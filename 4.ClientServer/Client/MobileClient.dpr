program MobileClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Classe.Produto in '..\Comum\Classe.Produto.pas',
  Classe.Retorno in '..\Comum\Classe.Retorno.pas',
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadastroProduto},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Form.Segundo.Plano in 'Form.Segundo.Plano.pas' {frmSegundoPlano},
  Form.Grid.Test in 'Form.Grid.Test.pas' {frmGridTest};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TfrmGridTest, frmGridTest);
  Application.Run;
end.
