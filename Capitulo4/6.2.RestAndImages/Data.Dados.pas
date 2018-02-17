unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, FMX.DialogService, FMX.Surfaces, System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, ClientModuleUnit, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FMX.Graphics;

type
  TdmdDados = class(TDataModule)
    qryDados: TFDQuery;
    memDados: TFDMemTable;
  private
    { Private declarations }
  private
    class var
      FInstance: TdmdDados;
    procedure TrataRetornoCRUD(pRetorno: Integer);

  public
    class function GetInstance: TdmdDados;

    function GetTabelas: string;
    procedure CarregaTabela(const pTabela: string); overload;
    procedure CarregaTabela(const pTabela: string; const pOk: TProc; const pErro: TProc); overload;

    procedure CadastraCountry(const pCountry, pCurrency: string);
    procedure AlteraCountry(const pCountry, pCurrency: string);
    procedure DeletaCountry(const pCountry: string);

    procedure SaveJpegToStream(Bitmap: TBitmap; Stream: TStream);
    procedure UpLoadImagem(pBitmap: TBitmap);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses FMX.Forms;

{ TdmdDados }

procedure TdmdDados.CarregaTabela(const pTabela: string);
var
  lResultado: string;
  lStm: TStringStream;
begin
  lResultado := ClientModule.GetDadosClient.GetTabela(pTabela);
  lStm := TStringStream.Create(lResultado);
  memDados.LoadFromStream(lStm, TFDStorageFormat.sfJson);
  lStm.Free;
end;

procedure TdmdDados.AlteraCountry(const pCountry, pCurrency: string);
begin
  TrataRetornoCRUD(ClientModule.GetDadosClient.AutalizaCountry(pCountry, pCurrency));
end;

procedure TdmdDados.CadastraCountry(const pCountry, pCurrency: string);
begin
  TrataRetornoCRUD(ClientModule.GetDadosClient.CadastraCountry(pCountry, pCurrency));
end;

procedure TdmdDados.CarregaTabela(const pTabela: string; const pOk, pErro: TProc);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      lClient: TClientModule;
      lResultado: string;
      lStm: TStringStream;
    begin
      try
        lStm := TStringStream.Create;
        lClient := TClientModule.Create(nil);
        try
          lResultado := lClient.GetDadosClient.GetTabela(pTabela);
          lStm.WriteString(lResultado);
          lStm.Position := 0;

          TThread.Synchronize(nil,
            procedure
            begin
              memDados.LoadFromStream(lStm, TFDStorageFormat.sfJson);
              pOk;
            end);
        finally
          lClient.Free;
          lStm.Free;
        end;
      except
        on E: Exception do
        begin
          pErro; // passar E por param
        end;
      end;
    end
  ).Start;
end;

procedure TdmdDados.DeletaCountry(const pCountry: string);
begin
  TrataRetornoCRUD(ClientModule.GetDadosClient.DeletaCountry(pCountry));
end;

class function TdmdDados.GetInstance: TdmdDados;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TdmdDados.Create(Application);
  end;

  Result := FInstance;
end;

function TdmdDados.GetTabelas: string;
var
  lJson: TJSONObject;
  lArr: TJSONArray;
  i: Integer;
begin
  // { tabelas: [ { nome: country}, { nome: produto} ] }
  Result := ClientModule.GetDadosClient.GetListaTabelas;
  // cuidado no dia a dia, para garantir que a estrutura esteja assim, senão vai dar erro, até AV
  lJson := (TJSONObject.ParseJSONValue(Result) as TJSONObject);
  Result := '';
  if lJson.values['tabelas'] is TJSONArray then
  begin
    lArr := TJSONArray(lJson.values['tabelas']);
    for i := 0 to lArr.Count -1 do
    begin
      if lArr.Items[i] is TJSONObject then
      begin
        Result := Result + TJsonString(TJsonObject(lArr.Items[i]).Values['nome']).Value + sLineBreak;
      end;
    end;
  end;

  lJson.Free;
end;

procedure TdmdDados.TrataRetornoCRUD(pRetorno: Integer);
begin
  case pRetorno of
    1 : TDialogService.ShowMessage('Registro Processado com sucesso.');
    -5: TDialogService.ShowMessage('Nenhum registro localizado.');
    -6: TDialogService.ShowMessage('Mais de um registro afetado pela instrução.');
  else
    TDialogService.ShowMessage('Retorno não previsto: ' + IntToStr(pRetorno));
  end;
end;

procedure TdmdDados.SaveJpegToStream(Bitmap: TBitmap; Stream: TStream);
var
  Surf: TBitmapSurface;
begin
  Surf := TBitmapSurface.Create;
  try
    Surf.Assign(Bitmap);
    if not TBitmapCodecManager.SaveToStream(Stream, Surf, '.jpg') then
      raise Exception.Create('Não foi possível converter em jpeg');
  finally
    Surf.Free;
  end;
end;

procedure TdmdDados.UpLoadImagem(pBitmap: TBitmap);
var
  lStm: TMemoryStream;
  lNome: string;
begin
  lStm := TMemoryStream.Create;
  // pBitmap.SaveToStream(lStm);
  SaveJpegToStream(pBitmap, lStm);
  lStm.Position := 0;
  lNome := ClientModule.GetDadosClient.SalvaImagem(lStm);
  if lNome <> '' then
    TDialogService.ShowMessage('Imagem salva com sucesso no servidor: ' + lNome);
end;

end.
