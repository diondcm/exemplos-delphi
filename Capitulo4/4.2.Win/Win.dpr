program Win;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Classes.Win in 'Form.Classes.Win.pas' {frmClassesWin},
  Form.Mensagens in 'Form.Mensagens.pas' {frmMensagens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmClassesWin, frmClassesWin);
  Application.CreateForm(TfrmMensagens, frmMensagens);
  Application.Run;
end.
