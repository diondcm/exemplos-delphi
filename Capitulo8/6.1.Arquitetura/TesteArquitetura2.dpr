program TesteArquitetura2;

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
  Form.MultiView.Base in 'Form.MultiView.Base.pas' {frmBaseMultiView},
  Form.MultiView.Audio in 'Form.MultiView.Audio.pas' {frmMultiViewAudio},
  Form.MultiView.Mensagem in 'Form.MultiView.Mensagem.pas' {frmMultiViewMensagem},
  Form.Exibe.Frame in 'Form.Exibe.Frame.pas' {frmExibeFrame},
  Frame.Cliente in 'Frame.Cliente.pas' {fraCliente: TFrame};

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
  Application.CreateForm(TfrmMultiViewAudio, frmMultiViewAudio);
  Application.CreateForm(TfrmMultiViewMensagem, frmMultiViewMensagem);
  Application.CreateForm(TfrmExibeFrame, frmExibeFrame);
  Application.Run;
end.
