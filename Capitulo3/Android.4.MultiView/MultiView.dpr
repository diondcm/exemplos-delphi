program MultiView;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base.MultiView in 'Form.Base.MultiView.pas' {frmBaseMultiView},
  Form.Camera in 'Form.Camera.pas' {frmCamera},
  Form.Camera.Component in 'Form.Camera.Component.pas' {frmCameraComponent},
  Form.Audio in 'Form.Audio.pas' {frmAudio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBaseMultiView, frmBaseMultiView);
  Application.CreateForm(TfrmCamera, frmCamera);
  Application.CreateForm(TfrmCameraComponent, frmCameraComponent);
  Application.CreateForm(TfrmAudio, frmAudio);
  Application.Run;
end.
