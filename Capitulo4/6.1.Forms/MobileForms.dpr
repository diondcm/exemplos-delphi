program MobileForms;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Tabs in 'Form.Tabs.pas' {frmTabs},
  Form.Menus in 'Form.Menus.pas' {frmMenus},
  Form.Lista in 'Form.Lista.pas' {frmLista},
  Base.Form.Mobile in 'Base.Form.Mobile.pas' {frmBase},
  Form.WebBrowser in 'Form.WebBrowser.pas' {frmWebBrowser},
  Form.Map.View in 'Form.Map.View.pas' {frmMapView},
  Form.Frames in 'Form.Frames.pas' {frmFrames},
  Frame.Usuario in 'Frame.Usuario.pas' {fraUsuario: TFrame},
  Frame.Dialog in 'Frame.Dialog.pas' {fraDialogs: TFrame},
  Form.MultiView in 'Form.MultiView.pas' {frmMultiView},
  Base.Form.MultiView in 'Base.Form.MultiView.pas' {frmBaseMultiView},
  Form.MultiView.Camera in 'Form.MultiView.Camera.pas' {frmCamera},
  Form.MultiView.Audio in 'Form.MultiView.Audio.pas' {frmAudio},
  Form.MultiView.CameraComponent in 'Form.MultiView.CameraComponent.pas' {frmCameraComponent};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmTabs, frmTabs);
  Application.CreateForm(TfrmMenus, frmMenus);
  Application.CreateForm(TfrmLista, frmLista);
  Application.CreateForm(TfrmFrames, frmFrames);
  Application.CreateForm(TfrmMultiView, frmMultiView);
  Application.Run;
end.
