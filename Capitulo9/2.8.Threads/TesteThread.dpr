program TesteThread;

uses
  Vcl.Forms,
  Form.Principal.Thread in 'Form.Principal.Thread.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
