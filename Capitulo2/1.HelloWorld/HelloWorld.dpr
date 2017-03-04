program HelloWorld;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Frames in 'Form.Frames.pas' {frmFrames},
  Frame.Mensagem in 'Frame.Mensagem.pas' {fraMensagem: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmFrames, frmFrames);
  Application.Run;
end.
