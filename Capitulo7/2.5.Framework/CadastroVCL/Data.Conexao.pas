unit Data.Conexao;

interface

uses
  WinApi.Windows, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.SqlExpr, Data.DB, FireDAC.Comp.Client, Base.Data.Cadastro;

type
  TdmdConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    SQLConnection1: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function ObtemGeradorSQLite(const pNomeGerador: string; pIncremento: Byte): Int64;
    function ObtemGeradorFB(const pNomeGerador: string; pIncremento: Byte): Int64;
  public
    { Public declarations }

  end;

var
  dmdConexao: TdmdConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdConexao }

procedure TdmdConexao.DataModuleCreate(Sender: TObject);
begin
  if CompareStr(UpperCase(FDConnection1.DriverName), 'SQLITE') = 0 then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorSQLite;
  end else if CompareStr(UpperCase(FDConnection1.DriverName), 'FB') = 0 then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorFB;
  end;

  //TdmdBaseCadastro. conn := FDConnection1
end;

function TdmdConexao.ObtemGeradorFB(const pNomeGerador: string; pIncremento: Byte): Int64;
begin
  //
end;

function TdmdConexao.ObtemGeradorSQLite(const pNomeGerador: string; pIncremento: Byte): Int64;
begin
  Result := GetTickCount64;
end;

end.
