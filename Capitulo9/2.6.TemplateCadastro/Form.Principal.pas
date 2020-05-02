unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Cadastro.Cliente, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus, System.ImageList, Vcl.ImgList, Data.Imagens,
  Form.Cadastro.Produto, Form.Cadastro.Pedido;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    ActionList1: TActionList;
    ActionClientes: TAction;
    ToolButton2: TToolButton;
    ActionProdutos: TAction;
    ButtonPedido: TToolButton;
    ActionPedido: TAction;
    procedure ActionClientesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionProdutosExecute(Sender: TObject);
    procedure ActionPedidoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionClientesExecute(Sender: TObject);
begin
  // frmCadastroCliente.Show; // para apenas 1 cadastro
  TfrmCadastroCliente.Create(Application).Show; // instacia mais de um cadastro
end;

procedure TfrmPrincipal.ActionPedidoExecute(Sender: TObject);
begin
  TfrmCadPedido.Create(Application).Show;
end;

procedure TfrmPrincipal.ActionProdutosExecute(Sender: TObject);
begin
  TfrmCadProduto.Create(Application).Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
end;

end.
