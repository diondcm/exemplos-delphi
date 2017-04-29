unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, Base.Data, Data.DB, Data.SqlExpr,
  System.ImageList, Vcl.ImgList, Vcl.Controls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DbxSqlite,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Base.Data.Cadastro, Data.FMTBcd;

type
  TdmdConexao = class(TdmdBase)
    imlBase: TImageList;
    SQLConnection: TSQLConnection;
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    qryGerador: TFDQuery;
    sqlGerador: TSQLDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function ObtemGeradorFB(const pNomeGerador: string; pIncremento: Byte): Int64;
    function ObtemGeradorSQLite(const pNomeGerador: string; pIncremento: Byte): Int64;
  public

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
  //SQLConnection.DriverName = UpperCase('Sqlite')
  if FDConnection.DriverName = 'FB' then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorFB;
  end else if FDConnection.DriverName = 'SQLite' then
  begin
    TdmdBaseCadastro.MetodoGerador := ObtemGeradorSQLite;
  end;
end;

function TdmdConexao.ObtemGeradorFB(const pNomeGerador: string;
  pIncremento: Byte): Int64;
const
  ID_GERADOR = 0;
begin
  qryGerador.Close;
  qryGerador.Open('select GEN_ID(' + pNomeGerador + ',' +
    pIncremento.ToString + ') from RDB$DATABASE');
  Result := qryGerador.Fields[ID_GERADOR].AsLargeInt;
  qryGerador.Close;

//  sqlGerador.Close;
//  sqlGerador.CommandText := 'select GEN_ID(' + pNomeGerador + ',' +
//    pIncremento.ToString + ') from RDB$DATABASE';
//  sqlGerador.Open;
//  Result := sqlGerador.Fields[ID_GERADOR].AsLargeInt;
//  sqlGerador.Close;
end;

function TdmdConexao.ObtemGeradorSQLite(const pNomeGerador: string;
  pIncremento: Byte): Int64;
begin
  Result := 0;
end;

end.
