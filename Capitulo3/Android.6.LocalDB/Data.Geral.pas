unit Data.Geral;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FMX.Dialogs;

type
  TdmDados = class(TDataModule)
    FDConnection: TFDConnection;
    qryConfig: TFDQuery;
    qryConfigID: TFDAutoIncField;
    qryConfigUSUARIO: TStringField;
    qryConfigEMPRESA: TStringField;
    qryConfigNOME_CONFIG: TStringField;
    qryConfigVALOR_CONFIG: TStringField;
    qryConfigDESCRICAO_CONFIG: TStringField;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;


procedure TdmDados.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
  'CREATE TABLE IF NOT EXISTS CONFIGURACAO (' +
  '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
  '  USUARIO VARCHAR(30), ' +// Deve ser o ID_USUARIO
  '  EMPRESA VARCHAR(30), ' +// deve ser o ID_EMPRESA
  '  NOME_CONFIG VARCHAR(30), ' + // NOME_USUARIO, EMPRESA_PADRAO
  '  DESCRICAO_CONFIG VARCHAR(30), ' +
  '  VALOR_CONFIG VARCHAR(250) ' +
  ')')
end;

procedure TdmDados.FDConnectionBeforeConnect(Sender: TObject);
var
  lPath: string;
begin
  {$IFDEF ANDROID } // IF DEFINE(ANDROID) //tb funciona
  lPath := TPath.GetDocumentsPath;
  {$ELSE}
  lPath := TPath.GetTempPath;
  {$ENDIF}

  FDConnection.Params.Values['Database'] := TPath.Combine(lPath, 'config.db');
end;

end.
