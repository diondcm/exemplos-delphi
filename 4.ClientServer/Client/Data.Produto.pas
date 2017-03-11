unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, Classe.Produto, ClientModuleUnit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, System.DateUtils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Retorno,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, System.IniFiles,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, System.IOUtils, FireDAC.DApt;

type
  TFuncErro = reference to procedure(const pMsg: string);

  TdmdProduto = class(TDataModule)
    fmdProduto: TFDMemTable;
    conSQLite: TFDConnection;
    qryProduto: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure conSQLiteBeforeConnect(Sender: TObject);
    procedure conSQLiteAfterConnect(Sender: TObject);
  private const
    DB_SQLITE = 'filedb.db';
    INI_FILE = 'produto.conf';
  public
    procedure GetServerProdutos;
    function AtualizaProduto(pProduto: TProduto; pProcedureOK: TProc = nil; pFuncErro: TFuncErro = nil): TRetorno;
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmdProduto }

procedure TdmdProduto.GetServerProdutos;
var
  lLista: TListaProduto;
  lProduto: TProduto;
  lIni: TIniFile;
  lDataAtualizacao: TDate;
begin
  lIni := TIniFile.Create(TPath.Combine(TPath.GetDocumentsPath, INI_FILE));
  try
    lDataAtualizacao := lIni.ReadDate('CONFIG', 'data_atualizacao', 0);
    if (lDataAtualizacao = 0) or (DateOf(lDataAtualizacao) <> DateOf(Now)) then
    begin
      lLista := ClientModule1.ServerMethods1Client.GetListaProdutos;
      qryProduto.ExecSQL('delete from produto');
      qryProduto.Open('select * from produto');

      // GetMetaData -> CarregaDataSet(lLista, Memtable)
      for lProduto in lLista do
      begin
        qryProduto.Append;
        qryProduto.FieldByName('ID').AsInteger := lProduto.ID;
        qryProduto.FieldByName('Descricao').AsString := lProduto.Descricao;
        qryProduto.FieldByName('Valor').AsCurrency := lProduto.Valor;
        qryProduto.Post;
      end;
      lIni.WriteDate('CONFIG', 'data_atualizacao', DateOf(Now));
    end else begin
      qryProduto.Open('select * from produto');
    end;
    // Mais lento -> fmdProduto.CopyDataSet(qryProduto);

    fmdProduto.Data := qryProduto.Data;
    // poderia utilizar diretamente a qry, fmd apens para exemplo
  finally
    lIni.Free;
  end;
end;

function TdmdProduto.AtualizaProduto(pProduto: TProduto; pProcedureOK: TProc; pFuncErro: TFuncErro): TRetorno;
var
  lListaProduto: TListaProduto;
  lRetorno: TRetorno;
begin
  lListaProduto := TListaProduto.Create;
  lListaProduto.Add(pProduto);
  lRetorno := ClientModule1.ServerMethods1Client.SetListaProduto(lListaProduto);
  if lRetorno.Sucess then
  begin
    if Assigned(pProcedureOK) then
      pProcedureOK;
  end else begin
    if Assigned(pFuncErro) then
      pFuncErro(lRetorno.Msg);
  end;
  Result := lRetorno;
end;

procedure TdmdProduto.conSQLiteAfterConnect(Sender: TObject);
begin
  // Obtido do server -> get metadata
  conSQLite.ExecSQL(
    'create table if not exists produto (' + sLineBreak +
    'id integer primary key,' + sLineBreak +
    'descricao text not null,' + sLineBreak +
    'valor real)');
end;

procedure TdmdProduto.conSQLiteBeforeConnect(Sender: TObject);
var
  lCaminhobanco: string;
begin
//  lCaminhobanco := TPath.GetDocumentsPath + DB_SQLITE;
  lCaminhobanco := TPath.Combine(TPath.GetDocumentsPath, DB_SQLITE);
  conSQLite.Params.Database := lCaminhobanco;
end;

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  // (meu Server).(metodo meu GetMetada(base na "classe"(digo nome) por parametro))
//  fmdProduto.FieldDefs.Clear;
//  fmdProduto.FieldDefs.Add('ID', ftInteger);
//  fmdProduto.FieldDefs.Add('Descricao', ftString, 200);
//  fmdProduto.FieldDefs.Add('Valor', ftCurrency);
//
//  fmdProduto.Open;

  // não chamaria o atualiza, visto que isso deixaria a abertua mais lenta
end;

end.
