program ShowForms;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Principal.Forms in 'Form.Principal.Forms.pas' {frmPrincipalForms},
  Form.Mapa.Browser in 'Form.Mapa.Browser.pas' {frmMapaBrowser};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalForms, frmPrincipalForms);
  Application.Run;
end.
