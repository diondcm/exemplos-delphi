program FMGerais;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Gerais in 'Form.Principal.Gerais.pas' {frmPrincipal},
  Form.Download.Images in 'Form.Download.Images.pas' {frmDownloadImage};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
