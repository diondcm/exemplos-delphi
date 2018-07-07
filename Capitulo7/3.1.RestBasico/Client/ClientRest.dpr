program ClientRest;

uses
  Vcl.Forms,
  Form.Principal.Client in 'Form.Principal.Client.pas' {frmPrincipalClient},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalClient, frmPrincipalClient);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
