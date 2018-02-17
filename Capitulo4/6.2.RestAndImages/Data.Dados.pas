unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, ClientModuleUnit, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON;

type
  TdmdDados = class(TDataModule)
    qryDados: TFDQuery;
    memDados: TFDMemTable;
  private
    { Private declarations }
  private
    class var
      FInstance: TdmdDados;
  public
    class function GetInstance: TdmdDados;

    function GetTabelas: string;
    procedure CarregaTabela(const pTabela: string); overload;
    procedure CarregaTabela(const pTabela: string; const pOk: TProc; const pErro: TProc); overload;
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

end.
