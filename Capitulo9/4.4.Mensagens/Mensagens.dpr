program Mensagens;

uses
  Vcl.Forms,
  Form.Principal.Mensagens in 'Form.Principal.Mensagens.pas' {frmPrincipalMensagens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalMensagens, frmPrincipalMensagens);
  Application.Run;
end.
