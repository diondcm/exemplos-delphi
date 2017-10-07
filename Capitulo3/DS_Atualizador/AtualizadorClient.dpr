program AtualizadorClient;

uses
  Vcl.Forms,
  Form.Client.Principal in 'Form.Client.Principal.pas' {frmClient},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Classe.FileTransfer in 'Classe.FileTransfer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClient, frmClient);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
