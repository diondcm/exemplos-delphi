unit GetDadosUnit;

interface

uses System.SysUtils, System.Classes, System.Json, System.Diagnostics,
  DataSnap.DSProviderDataModuleAdapter, System.Generics.Collections, System.Hash,
  Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  FireDAC.VCLUI.Wait;

type
  TGetDados = class(TDSServerModule)
    FDConnection: TFDConnection;
    qryDados: TFDQuery;
  private
     type
       THashTabela = class(TDictionary<string, string>)
       end;

     class var FHashTabelas: THashTabela;
     class function GetHashTabelas: THashTabela;
  private
    function TrataRowsAffected(pRows: Integer): Integer;
    class destructor Destroy;
  public
    { Túnel de infos }
    function GetListaTabelas: string;
    function GetTabela(pNomeTabela, pHash: string): string;

    { Preferência minha para CRUD }
    function CadastraCountry(pCountry, pCurrency: string): Integer; // e. g.: Negativos para Erro, positivos para ID
    function AutalizaCountry(pCountryID: string; pCurrency: string): Integer;
    function DeletaCountry(pCountryID: string): Integer; // 1: Ok

    {  Stream }
    function SalvaImagem(pStm: TStream): string;

    { Básicos }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TGetDados.AutalizaCountry(pCountryID, pCurrency: string): Integer;
begin
  qryDados.ExecSQL('update country set currency = :pcurrency where country = :pcountry', [pCurrency, pCountryID]);
  Result := TrataRowsAffected(qryDados.RowsAffected);
end;

function TGetDados.CadastraCountry(pCountry, pCurrency: string): Integer;
begin
  qryDados.ExecSQL('insert into country (country, currency) values (:pcountry, :pcurrency)', [pCountry, pCurrency]);
  Result := TrataRowsAffected(qryDados.RowsAffected);
end;

function TGetDados.DeletaCountry(pCountryID: string): Integer;
begin
  qryDados.ExecSQL('delete from country where country = :pcountry', [pCountryID]);
  Result := TrataRowsAffected(qryDados.RowsAffected);
end;

class destructor TGetDados.Destroy;
begin
  FHashTabelas.Free;
end;

function TGetDados.EchoString(Value: string): string;
begin
  Result := Value;
end;

class function TGetDados.GetHashTabelas: THashTabela;
begin
  if not Assigned(FHashTabelas) then
  begin
    FHashTabelas := THashTabela.Create;
  end;

  Result := FHashTabelas;
end;

function TGetDados.GetListaTabelas: string;
var
  lJson: TJSONObject;
  lArr: TJSONArray;
begin
  if FileExists('sleepTab.txt') then
  begin
    Sleep(5000);
  end;

  lArr := TJSONArray.Create;
  lArr.Add(TJSONObject.Create(TJSONPair.Create('nome', 'country')));
  lArr.Add(TJSONObject.Create(TJSONPair.Create('nome', 'produto'))); // TAB_PROD
  lArr.Add(TJSONObject.Create(TJSONPair.Create('nome', 'customer')));

  lJson := TJSONObject.Create;
  lJson.AddPair('tabelas', lArr);

  Result := lJson.ToString;
  // { tabelas: [ { nome: country}, { nome: produto} ] }

  lJson.Free;
end;

function TGetDados.GetTabela(pNomeTabela, pHash: string): string;
var
  lStm: TStringStream;
  lJsResult: TJSONObject;
begin
  if FileExists('sleepGet.txt') then
  begin
    Sleep(8000);
  end;

  /// Outra opção: recebido json no parâmetro e usado TJsonObject.ParseJSONValue()
  if (GetHashTabelas.ContainsKey(pNomeTabela)) and (CompareStr(GetHashTabelas[pNomeTabela], pHash) = 0) then
  begin
    lJsResult := TJSONObject.Create;
    lJsResult.AddPair('tabela', pNomeTabela);
    lJsResult.AddPair('hash', pHash);
    lJsResult.AddPair('atualizada', 'sim');
    lJsResult.AddPair('data_atual', DateTimeToStr(Now));

    Result := lJsResult.ToString;
    lJsResult.Free;
  end else begin
    //  Para ser anti-injection: ou usar lista de parâmetros, ou usar macros; TAB_PROD: produto
    qryDados.Open('select * from ' + pNomeTabela);
    lStm := TStringStream.Create;
    qryDados.SaveToStream(lStm, TFDStorageFormat.sfJSON);
    Result := lStm.DataString;

    // usar seção crítica
    if not GetHashTabelas.ContainsKey(pNomeTabela) then
      GetHashTabelas.Add(pNomeTabela, THashMD5.GetHashString(Result))
    else
      GetHashTabelas[pNomeTabela] := THashMD5.GetHashString(Result);

    lStm.Free;
    qryDados.Close;
  end;
end;

function TGetDados.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TGetDados.SalvaImagem(pStm: TStream): string;
var
  lMemStm: TMemoryStream;
begin
  pStm.Position := 0;
  Result := IntToStr(TStopwatch.GetTimeStamp) + '.jpg';
  lMemStm := TMemoryStream.Create;
  lMemStm.LoadFromStream(pStm);
  lMemStm.SaveToFile(ExtractFilePath(ParamStr(0)) + Result);// buscar por Get Module Path no IIS
  lMemStm.Free;
end;

function TGetDados.TrataRowsAffected(pRows: Integer): Integer;
begin
  if pRows = 1 then
  begin
    Exit(1);
  end else begin
    if pRows = 0 then
    begin
      // Rollback
      Exit(-5);
    end else if pRows > 1 then
    begin
      // Rollback
      Exit(-6);
    end else begin
      Exit(-10);
    end;
  end;
end;

end.

