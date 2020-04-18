program RemoteDebug;



uses
  Vcl.Forms,
  Form.Principal.Remote in 'Form.Principal.Remote.pas' {frmPrincipal},
  Classe.Remote.Debug in 'Classe.Remote.Debug.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
