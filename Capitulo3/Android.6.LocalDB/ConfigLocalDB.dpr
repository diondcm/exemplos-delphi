program ConfigLocalDB;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Login in 'Form.Login.pas' {frmLogin},
  Classe.Usuario.Logado in 'Classe.Usuario.Logado.pas',
  Form.Config in 'Form.Config.pas' {frmConfig},
  Data.Geral in 'Data.Geral.pas' {dmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
