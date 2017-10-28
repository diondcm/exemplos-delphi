unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.DB, Data.SqlExpr, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Data.Win.ADODB, Base.Data.Cadastro;

type
  TdmdConexao = class(TdmdBase)
    SQLConnection: TSQLConnection;
    ADOConnection: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    FChave: Int64;
    function ObtemGerador(const pNomeGerador: string; pIncremento: Byte): Int64;
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
  inherited;
//  if SQLConnection.DriverName = 'Firebird' then
//  begin
//    TdmdBaseCadastro.MetodoGerador := ObtemGeradorFB;
//  end else if SQLConnection.DriverName = 'Sqlite' then
//  begin
//    TdmdBaseCadastro.MetodoGerador := ObtemGeradorSQLite;
//  end;

  TdmdBaseCadastro.MetodoGerador := ObtemGerador;
end;

function TdmdConexao.ObtemGerador(const pNomeGerador: string; pIncremento: Byte): Int64;
begin
  if FChave = 0 then
  begin
    FChave := Random(1000000000);
  end;
  Inc(FChave);
  Result := FChave;
end;

end.
