unit Data.Pedido;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Conexao;

type
  [TAtributoGerador('ID_PEDIDO', 'GEN_PEDIDOS')]
  TdmdPedido = class(TdmdBaseCadastro)
    qryPedido: TFDQuery;
    qryPedidoID_PEDIDO: TIntegerField;
    qryPedidoID_CLIENTE: TIntegerField;
    qryPedidoDATA_CADASTRO: TSQLTimeStampField;
    qryPedidoVALOR_TOTAL: TBCDField;
    qryPedidoQTD_ITENS: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
  protected
    procedure AtribuiSQL; override;

  public
    { Public declarations }

  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdPedido }

procedure TdmdPedido.AtribuiSQL;
begin
  inherited;
  qryPedido.SQL.Text := FSQL.Text;
end;

procedure TdmdPedido.DataModuleCreate(Sender: TObject);
begin
  inherited;
  DataSet := qryPedido;
  FSQL.Text := qryPedido.SQL.Text;
end;

end.
