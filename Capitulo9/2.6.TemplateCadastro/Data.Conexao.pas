unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB, Data.SqlExpr,
  Data.DbxSqlite;

type
  TdmdConexao = class(TDataModule)
    SQLConnection: TSQLConnection;
    FDConnection: TFDConnection;
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConexao: TdmdConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdConexao.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open;
end;

procedure TdmdConexao.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL('CREATE TABLE IF NOT EXISTS CLIENTE ( ' +
    ' ID    INTEGER         PRIMARY KEY AUTOINCREMENT NOT NULL, ' +
    ' NOME  STRING (200), ' +
    ' SALDO DECIMAL (10, 3) )');
end;

procedure TdmdConexao.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Database := '..\..\Dados\Cadastro.DB';
end;

end.
