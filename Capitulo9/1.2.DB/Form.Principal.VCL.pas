unit Form.Principal.VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipalVCL = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    CadastroCliente1: TMenuItem;
    CadastroProduto1: TMenuItem;
    procedure CadastroCliente1Click(Sender: TObject);
    procedure CadastroProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalVCL: TfrmPrincipalVCL;

implementation

{$R *.dfm}

uses Form.Cadastro.Cliente.VCL, Form.Cadastro.Produto.VCL;

procedure TfrmPrincipalVCL.CadastroCliente1Click(Sender: TObject);
begin
  frmCadClienteVCL.Show;
end;

procedure TfrmPrincipalVCL.CadastroProduto1Click(Sender: TObject);
begin
  frmCadProduto.Show;
end;

end.
