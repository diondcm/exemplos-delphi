program FMGerais;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Gerais in 'Form.Principal.Gerais.pas' {frmPrincipalGerais},
  Form.Download.Images in 'Form.Download.Images.pas' {frmDownloadImage},
  Classe.Down.Image in 'Classe.Down.Image.pas',
  Form.Base.Mobile in 'Form.Base.Mobile.pas' {frmBaseMobile},
  Form.Principal in 'Form.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalGerais, frmPrincipalGerais);
  Application.CreateForm(TfrmBaseMobile, frmBaseMobile);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
