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
    procedure qryDadosAfterOpen(DataSet: TDataSet);
    procedure qryDadosAfterClose(DataSet: TDataSet);
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

procedure TdmdPedido.qryDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryCliente.Open;
end;

end.
