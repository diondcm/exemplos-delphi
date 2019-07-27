program TesteArquitetura;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Mobile in 'Form.Principal.Mobile.pas' {frmPrincipal},
  Form.Tabs in 'Form.Tabs.pas' {frmTabs},
  Form.Forms in 'Form.Forms.pas' {frmForms},
  Form.Map.Browser in 'Form.Map.Browser.pas' {frmMapBrowser},
  Form.MapView in 'Form.MapView.pas' {frmMapView},
  Form.MultiView in 'Form.MultiView.pas' {frmMultiView},
  Form.MultiView.Camera in 'Form.MultiView.Camera.pas' {frmMultiViewCamera},
  Form.MultiView.Base in 'Form.MultiView.Base.pas' {frmBaseMultiView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTabs, frmTabs);
  Application.CreateForm(TfrmForms, frmForms);
  Application.CreateForm(TfrmMapBrowser, frmMapBrowser);
  Application.CreateForm(TfrmMapView, frmMapView);
  Application.CreateForm(TfrmMultiView, frmMultiView);
  Application.CreateForm(TfrmMultiViewCamera, frmMultiViewCamera);
  Application.CreateForm(TfrmBaseMultiView, frmBaseMultiView);
  Application.Run;
end.
