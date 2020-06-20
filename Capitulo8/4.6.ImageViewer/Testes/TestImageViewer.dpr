program TestImageViewer;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.ClassificaImage in '..\Classe.ClassificaImage.pas',
  Classe.ImageViewer in '..\Classe.ImageViewer.pas',
  Classe.LateralViewer in '..\Classe.LateralViewer.pas',
  Form.Visualiza.Imagem in '..\Form.Visualiza.Imagem.pas' {frmVisualiza};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
