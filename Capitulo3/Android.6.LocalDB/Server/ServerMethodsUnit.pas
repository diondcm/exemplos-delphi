unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Configuracao;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection: TFDConnection;
    qryConfig: TFDQuery;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    function GravaConfig(pConfigList: TList<TConfiguracao>): string;
    function GetConfig(const pUsuario, pEmpresa: string): TList<TConfiguracao>;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

procedure TServerMethods1.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
  'CREATE TABLE IF NOT EXISTS CONFIGURACAO (' +
  '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
  '  USUARIO VARCHAR(30), ' +// Deve ser o ID_USUARIO
  '  EMPRESA VARCHAR(30), ' +// deve ser o ID_EMPRESA
  '  NOME_CONFIG VARCHAR(30), ' + // NOME_USUARIO, EMPRESA_PADRAO
  '  DESCRICAO_CONFIG VARCHAR(30), ' +
  '  VALOR_CONFIG VARCHAR(250) ' +
  ')');
end;

procedure TServerMethods1.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['Database'] := ExtractFilePath(ParamStr(0)) + 'server.db';
end;

function TServerMethods1.GetConfig(const pUsuario,
  pEmpresa: string): TList<TConfiguracao>;
var
  lConfig: TConfiguracao;
begin
  /// todo: serealizar os threads para não dar erro no sqlite
  Result := TList<TConfiguracao>.Create;

  qryConfig.Open(
    'select * from configuracao ' +
    'where usuario = :usuario and empresa = :empresa',
    [pUsuario, pEmpresa]);
  qryConfig.First;
  while not qryConfig.Eof do
  begin
    lConfig := TConfiguracao.Create;
//    lConfig.ID := qryConfig.FieldByName('ID').AsInteger;
    lConfig.Descricao := qryConfig.FieldByName('DESCRICAO_CONFIG').AsString;
    lConfig.NomeConfig := qryConfig.FieldByName('NOME_CONFIG').AsString;
    lConfig.ValorConfig := qryConfig.FieldByName('VALOR_CONFIG').AsString;
    lConfig.Usuario := qryConfig.FieldByName('USUARIO').AsString;
    lConfig.Empresa := qryConfig.FieldByName('EMPRESA').AsString;

    Result.Add(lConfig);

    qryConfig.Next;
  end;
end;

function TServerMethods1.GravaConfig(pConfigList: TList<TConfiguracao>): string;
var
  lConfig: TConfiguracao;
begin
  /// todo: serealizar os threads para não dar erro no sqlite

  for lConfig in pConfigList do
  begin
    qryConfig.IndexFieldNames := 'NOME_CONFIG;USUARIO;EMPRESA';
    if qryConfig.FindKey([lConfig.NomeConfig, lConfig.Usuario, lConfig.Empresa]) then
    begin
      qryConfig.Edit;
    end else begin
      qryConfig.Append;
    end;

    qryConfig.FieldByName('DESCRICAO_CONFIG').AsString := lConfig.Descricao;
    qryConfig.FieldByName('NOME_CONFIG').AsString := lConfig.NomeConfig;
    qryConfig.FieldByName('VALOR_CONFIG').AsString := lConfig.ValorConfig;
    qryConfig.FieldByName('USUARIO').AsString := lConfig.Usuario;
    qryConfig.FieldByName('EMPRESA').AsString := lConfig.Empresa;

    qryConfig.Post;
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

