program TesteThread;

uses
  Vcl.Forms,
  Form.Principal.Thread in 'Form.Principal.Thread.pas' {frmPrincipalTh},
  Classe.Thread.Classico in 'Classe.Thread.Classico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalTh, frmPrincipalTh);
  Application.Run;
end.
