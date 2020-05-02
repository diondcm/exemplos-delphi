unit Data.Pedido;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdPedido = class(TdmdBase)
    qryDadosIDPEDIDO: TFDAutoIncField;
    qryDadosIDCLIENTE: TIntegerField;
    qryDadosENDERECO: TWideStringField;
    qryDadosDATA_COMPRA: TDateTimeField;
    qryDadosVLR_TOTAL: TLargeintField;
    qryDadosCLIENTE: TWideStringField;
    qryPesquisaCliente: TFDQuery;
    qryPesquisaClienteID: TFDAutoIncField;
    qryPesquisaClienteNOME: TWideStringField;
    qryPesquisaClienteSALDO: TBCDField;
    qryItens: TFDQuery;
    dtsPedido: TDataSource;
    qryItensIDPEDIDO: TLargeintField;
    qryItensIDITEM_PEDIDO: TFDAutoIncField;
    qryItensIDPRODUTO: TIntegerField;
    qryItensQTD: TLargeintField;
    qryItensVALOR: TLargeintField;
    qryPesquisaProduto: TFDQuery;
    qryItensPRODUTO: TStringField;
    memProduto: TFDMemTable;
    procedure qryDadosNewRecord(DataSet: TDataSet);
    procedure qryDadosAfterOpen(DataSet: TDataSet);
    procedure qryItensCalcFields(DataSet: TDataSet);
    procedure qryItensBeforeOpen(DataSet: TDataSet);
    procedure qryPesquisaProdutoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  dmdPedido: TdmdPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdPedido.qryDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryItens.Open;
end;

procedure TdmdPedido.qryDadosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDadosDATA_COMPRA.AsDateTime := Now;// pegar do server
  qryDadosVLR_TOTAL.AsCurrency := 0;
end;

procedure TdmdPedido.qryItensBeforeOpen(DataSet: TDataSet);
begin
  qryPesquisaProduto.Close;
  qryPesquisaProduto.Open;
end;

procedure TdmdPedido.qryItensCalcFields(DataSet: TDataSet);
begin
//  qryPesquisaProduto.Locate() // bem mais lento
  // não pode alterar valor de fields normais aqui!!!

  if memProduto.FindKey([qryItensIDPRODUTO.AsInteger]) then
  begin
    qryItensPRODUTO.AsString := memProduto.FieldByName('DESCRICAO').AsString;
  end;
end;

procedure TdmdPedido.qryPesquisaProdutoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  memProduto.CloneCursor(qryPesquisaProduto);
  memProduto.IndexFieldNames := 'IDPRODUTO';
//  memProduto.Data := qryPesquisaProduto.Data;
end;

end.
