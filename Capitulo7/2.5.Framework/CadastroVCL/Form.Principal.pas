unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Base.Form, System.Actions, Vcl.ActnList, Vcl.Menus, Form.Pesquisa.Cliente, Form.Pesquisa.Pedido;

type
  TfrmPrincipal = class(TfrmBase)
    buttonCliente: TButton;
    buttonPedidos: TButton;
    procedure buttonClienteClick(Sender: TObject);
    procedure buttonPedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonClienteClick(Sender: TObject);
begin
  inherited;
  TfrmPesquisaCliente.Create(Self, nil, True).Show;
end;

procedure TfrmPrincipal.buttonPedidosClick(Sender: TObject);
begin
  inherited;
  TfrmPesquisaPedido.Create(Self, nil, True).Show;
end;

end.
