unit GetDadosUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TGetDados = class(TDSServerModule)
    FDConnection: TFDConnection;
    qryDados: TFDQuery;
  private
    { Private declarations }
  public
    function GetListaTabelas: string;
    function GetTabela(pNomeTabela: string): string;

    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TGetDados.EchoString(Value: string): string;
begin
  Result := Value;
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

function TGetDados.GetTabela(pNomeTabela: string): string;
var
  lStm: TStringStream;
begin
   if FileExists('sleepGet.txt') then
  begin
    Sleep(8000);
  end;

  //  Para ser anti-injection: ou usar lista de parâmetros, ou usar macros; TAB_PROD: produto
  qryDados.Open('select * from ' + pNomeTabela);
  lStm := TStringStream.Create;
  qryDados.SaveToStream(lStm, TFDStorageFormat.sfJSON);
  Result := lStm.DataString;
  lStm.Free;
  qryDados.Close;
end;

function TGetDados.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

