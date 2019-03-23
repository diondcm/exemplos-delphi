program TesteWS;

uses
  Vcl.Forms,
  Form.Principal.TesteWS in 'Form.Principal.TesteWS.pas' {frmPrincipalTesteWS},
  FachadaWSSGS1 in 'FachadaWSSGS1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalTesteWS, frmPrincipalTesteWS);
  Application.Run;
end.
