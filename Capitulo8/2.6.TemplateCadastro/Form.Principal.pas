unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ToolWin, Form.Cadastro.Cliente, Form.Cadastro.Produto, Form.Cadastro.Pedido;

type
  TfrmPrincipal = class(TForm)
    ToolBar: TToolBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ToolButtonCliente: TToolButton;
    ActionCadCliente: TAction;
    ToolButtonProdutos: TToolButton;
    ActionCadProduto: TAction;
    ActionCadPedido: TAction;
    ToolButtonPedido: TToolButton;
    procedure ActionCadClienteExecute(Sender: TObject);
    procedure ActionCadProdutoExecute(Sender: TObject);
    procedure ActionCadPedidoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionCadClienteExecute(Sender: TObject);
begin
  frmCadCliente.Show;
end;

procedure TfrmPrincipal.ActionCadPedidoExecute(Sender: TObject);
begin
  frmCadPedido.Show;
end;

procedure TfrmPrincipal.ActionCadProdutoExecute(Sender: TObject);
begin
  frmCadProduto.Show;
end;

end.
