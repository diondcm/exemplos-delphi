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
    procedure qryDadosNewRecord(DataSet: TDataSet);
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

procedure TdmdPedido.qryDadosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDadosDATA_COMPRA.AsDateTime := Now;// pegar do server
  qryDadosVLR_TOTAL.AsCurrency := 0;
end;

end.
