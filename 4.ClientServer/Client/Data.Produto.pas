unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, Classe.Produto, ClientModuleUnit1,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Retorno;

type
  TFuncErro = reference to procedure(const pMsg: string);

  TdmdProduto = class(TDataModule)
    fmdProduto: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
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
begin
  fmdProduto.EmptyDataSet;
  lLista := ClientModule1.ServerMethods1Client.GetListaProdutos;
  // GetMetaData -> CarregaDataSet(lLista, Memtable)
  for lProduto in lLista do
  begin
    fmdProduto.Append;
    fmdProduto.FieldByName('ID').AsInteger := lProduto.ID;
    fmdProduto.FieldByName('Descricao').AsString := lProduto.Descricao;
    fmdProduto.FieldByName('Valor').AsCurrency := lProduto.Valor;
    fmdProduto.Post;
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

procedure TdmdProduto.DataModuleCreate(Sender: TObject);
begin
  // (meu Server).(metodo meu GetMetada(base na "classe"(digo nome) por parametro))
  fmdProduto.FieldDefs.Clear;
  fmdProduto.FieldDefs.Add('ID', ftInteger);
  fmdProduto.FieldDefs.Add('Descricao', ftString, 200);
  fmdProduto.FieldDefs.Add('Valor', ftCurrency);

  fmdProduto.Open;

  // não chamaria o atualiza, visto que isso deixaria a abertua mais lenta
end;

end.
