program ClientFiles;

uses
  Vcl.Forms,
  Form.Principal.Client in 'Form.Principal.Client.pas' {frmPrincipalClinet},
  Client.Classes in 'Client.Classes.pas',
  Client.Module in 'Client.Module.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalClinet, frmPrincipalClinet);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
