program TestImageViewer;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.ClassificaImage in '..\Classe.ClassificaImage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
