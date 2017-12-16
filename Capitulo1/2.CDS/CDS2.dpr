program CDS2;

uses
  Vcl.Forms,
  Form.Principal.CDS in 'Form.Principal.CDS.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
