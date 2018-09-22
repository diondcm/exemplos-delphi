program MultiView;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.MultiView in 'Form.Principal.MultiView.pas' {frmPrincipalMultiView},
  Form.Mensagem in 'Form.Mensagem.pas' {frmMensagem},
  Form.Audio in 'Form.Audio.pas' {frmAudio},
  Form.Camera in 'Form.Camera.pas' {frmCamera};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalMultiView, frmPrincipalMultiView);
  Application.Run;
end.
