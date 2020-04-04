unit Data.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TdmdConnection = class(TDataModule)
    FDConnection: TFDConnection;
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConnection: TdmdConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdConnection.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS CLIENTES (' +
    '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    '  NOME STRING(200), ' +
    '  DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');

  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS PRODUTOS (' +
    '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    '  DESCRICAO STRING(200), ' +
    '  CODIGO STRING(200), ' +
    '  PESO REAL, ' +
    '  DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');
end;

end.
