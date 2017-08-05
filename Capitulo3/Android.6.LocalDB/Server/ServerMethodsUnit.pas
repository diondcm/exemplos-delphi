unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    function gravaConfig(string, string )

    function GravaConfig(pConfigList: TList<TConfigurcao>): string;
    function GetConfig(const pUsuario, pEmpresa: string): TList<TConfigurcao>;


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
  pEmpresa: string): TList<TConfigurcao>;
begin

end;

function TServerMethods1.GravaConfig(pConfigList: TList<TConfigurcao>): string;
begin

end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

