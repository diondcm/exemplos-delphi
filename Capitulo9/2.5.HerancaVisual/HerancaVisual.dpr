program HerancaVisual;

uses
  Vcl.Forms,
  System.UITypes,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Config in 'Form.Config.pas' {frmConfig},
  Form.Login in 'Form.Login.pas' {frmLogin},
  Form.Base.Dialog in 'Form.Base.Dialog.pas' {frmBaseDialog},
  Form.Config.Impressao in 'Form.Config.Impressao.pas' {frmConfigImpressao},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadastroCliente},
  Form.Base in 'Form.Base.pas' {frmBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmBaseDialog, frmBaseDialog);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmConfigImpressao, frmConfigImpressao);

  Application.Run;
end.
