program ClientProxy;

uses
  Vcl.Forms,
  Form.Proxy.Principal in 'Form.Proxy.Principal.pas' {frmProxyPrincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProxyPrincipal, frmProxyPrincipal);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
