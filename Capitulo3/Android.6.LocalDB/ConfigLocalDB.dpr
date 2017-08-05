program ConfigLocalDB;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Login in 'Form.Login.pas' {frmLogin},
  Classe.Usuario.Logado in 'Classe.Usuario.Logado.pas',
  Form.Config in 'Form.Config.pas' {frmConfig},
  Data.Geral in 'Data.Geral.pas' {dmDados: TDataModule},
  Classe.Configuracao in 'Classe.Configuracao.pas',
  Classe.Lista.Configuracao in 'Classe.Lista.Configuracao.pas',
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
