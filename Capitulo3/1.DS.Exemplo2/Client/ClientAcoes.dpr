program ClientAcoes;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Classe.Acao in '..\Shared\Classe.Acao.pas',
  Classe.Status in '..\Shared\Classe.Status.pas',
  Form.Chat in 'Form.Chat.pas' {frmChat};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmChat, frmChat);
  Application.Run;
end.
