unit Data.Pedido;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdPedido = class(TdmdBase)
    qryDadosIDPEDIDO: TFDAutoIncField;
    qryDadosDATA_CADASTRO: TDateTimeField;
    qryDadosDATA_ENTREGA: TDateTimeField;
    qryDadosDESCONTO: TBCDField;
    qryDadosVALOR_TOTAL: TBCDField;
    qryDadosIDCLIENTE: TIntegerField;
    qryCliente: TFDQuery;
    qryDadosNOME: TWideStringField;
    qryItens: TFDQuery;
    qryItensIDITEM: TFDAutoIncField;
    qryItensIDPEDIDO: TIntegerField;
    qryItensQUANTIDADE: TIntegerField;
    qryItensIDPRODUTO: TIntegerField;
    qryItensVALOR: TBCDField;
    qryItensDESCONTO: TBCDField;
    qryItensDESCRICAO: TStringField;
    qryProduto: TFDQuery;
    procedure qryDadosAfterOpen(DataSet: TDataSet);
    procedure qryDadosAfterClose(DataSet: TDataSet);
    procedure qryDadosAfterInsert(DataSet: TDataSet);
    procedure qryDadosNewRecord(DataSet: TDataSet);
    procedure qryDadosAfterPost(DataSet: TDataSet);
    procedure qryDadosAfterScroll(DataSet: TDataSet);
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryItensAfterOpen(DataSet: TDataSet);
    procedure qryItensAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdPedido: TdmdPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdPedido.qryDadosAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryCliente.Close;
end;

procedure TdmdPedido.qryDadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Pode também ser utilizado para inicializar os fields vide (OnNewRecord)
end;

procedure TdmdPedido.qryDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryCliente.Open;
end;

procedure TdmdPedido.qryDadosAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TdmdPedido.qryDadosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryItens.Close;
  qryItens.ParamByName('idpedido').Value := DataSet.FieldByName('idpedido').AsInteger;
  qryItens.Open;
end;

procedure TdmdPedido.qryDadosNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DATA_CADASTRO').AsDateTime := Now;
  // mesmo que: qryDadosDATA_CADASTRO.AsDateTime := Now;
end;

procedure TdmdPedido.qryItensAfterClose(DataSet: TDataSet);
begin
  inherited;
  qryProduto.Close;
end;

procedure TdmdPedido.qryItensAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryProduto.Close;
  qryProduto.Open;
end;

procedure TdmdPedido.qryItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryItensIDPEDIDO.AsInteger := qryDadosIDPEDIDO.AsInteger;
end;

end.
