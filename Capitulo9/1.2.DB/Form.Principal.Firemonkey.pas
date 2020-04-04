unit Form.Principal.Firemonkey;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    ButtonCadastroCliente: TButton;
    ButtonCadastroProdutos: TButton;
    procedure ButtonCadastroClienteClick(Sender: TObject);
    procedure ButtonCadastroProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Cadastro.Cliente.FMX, Form.Cadastro.Produto.FMX;

procedure TfrmPrincipal.ButtonCadastroClienteClick(Sender: TObject);
begin
  frmCadCliente.Show;
end;

procedure TfrmPrincipal.ButtonCadastroProdutosClick(Sender: TObject);
begin
  frmCadProduto.Show;
end;

end.
