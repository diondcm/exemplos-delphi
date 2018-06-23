unit Data.Conexao;

interface

uses
  WinApi.Windows, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.SqlExpr, Data.DB, FireDAC.Comp.Client, Base.Data.Cadastro, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmdConexao = class(TDataModule)
    FDConnection: TFDConnection;
    SQLConnection1: TSQLConnection;
    qryGenerator: TFDQuery;
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
  if CompareStr(UpperCase(FDConnection.DriverName), 'SQLITE') = 0 then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorSQLite;
  end else if CompareStr(UpperCase(FDConnection.DriverName), 'FB') = 0 then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorFB;
  end;

  //TdmdBaseCadastro. conn := FDConnection1
end;

function TdmdConexao.ObtemGeradorFB(const pNomeGerador: string; pIncremento: Byte): Int64;
var
  lSql: string;
begin
  lSql := qryGenerator.SQL.Text;
  try
    qryGenerator.SQL.Text := StringReplace(
      qryGenerator.SQL.Text,
      '/*GEN_NAME*/',
      pNomeGerador,
      [rfIgnoreCase]);
    qryGenerator.Open;

    Result := qryGenerator.Fields[0].AsLargeInt;
  finally
    qryGenerator.Close;
    qryGenerator.SQL.Text := lSQL;
  end;
end;

function TdmdConexao.ObtemGeradorSQLite(const pNomeGerador: string; pIncremento: Byte): Int64;
begin
  Result := GetTickCount64;
end;

end.
