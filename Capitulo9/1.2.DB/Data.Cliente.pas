unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdCliente = class(TDataModule)
    FDConnection: TFDConnection;
    qryCliente: TFDQuery;
    qryClienteID: TFDAutoIncField;
    qryClienteNOME: TWideStringField;
    qryClienteDATA_CADASTRO: TSQLTimeStampField;
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCliente: TdmdCliente;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdCliente.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
    'CREATE TABLE IF NOT EXISTS CLIENTES (' +
    '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
    '  NOME STRING(200), ' +
    '  DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP)');
end;

end.
