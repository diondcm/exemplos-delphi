program FMGerais;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Gerais in 'Form.Principal.Gerais.pas' {frmPrincipalGerais},
  Form.Download.Images in 'Form.Download.Images.pas' {frmDownloadImage},
  Classe.Down.Image in 'Classe.Down.Image.pas',
  Form.Base.Mobile in 'Form.Base.Mobile.pas' {frmBaseMobile},
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Action.Camera in 'Form.Action.Camera.pas' {frmActionCamera},
  Form.Dados in 'Form.Dados.pas' {frmDados},
  Data.Dados in 'Data.Dados.pas' {dmdDados: TDataModule},
  Form.Cadastro in 'Form.Cadastro.pas' {frmCadastro},
  Form.Pedidos in 'Form.Pedidos.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdDados, dmdDados);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
