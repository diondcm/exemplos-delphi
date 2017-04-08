program ProjetoLogin;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Login in 'Form.Login.pas' {frmLogin},
  Classe.Login in 'Classe.Login.pas';

{$R *.res}

var
  lUsuario: TUsuario;
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  lUsuario := TFrmLogin.ExecutaLogin;
  if Assigned(lUsuario) then
  begin
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.Run;
    frmPrincipal.SetUsuatio(lUsuario);
  end else begin
    Application.Terminate;
  end;

end.
