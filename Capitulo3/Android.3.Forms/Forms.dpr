program Forms;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Mapa.Browser in 'Form.Mapa.Browser.pas' {frmMapaBrowser},
  Form.Mapa.MapView in 'Form.Mapa.MapView.pas' {frmMapView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
