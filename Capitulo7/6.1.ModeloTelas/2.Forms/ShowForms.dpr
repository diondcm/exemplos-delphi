program ShowForms;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Principal.Forms in 'Form.Principal.Forms.pas' {frmPrincipalForms},
  Form.Mapa.Browser in 'Form.Mapa.Browser.pas' {frmMapaBrowser},
  Form.Map.View in 'Form.Map.View.pas' {frmMapView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalForms, frmPrincipalForms);
  Application.CreateForm(TfrmMapView, frmMapView);
  Application.Run;
end.
