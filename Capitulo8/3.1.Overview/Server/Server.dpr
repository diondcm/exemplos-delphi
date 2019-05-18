program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.Server in 'Form.Principal.Server.pas' {frmPrincipalServer},
  ServerMethodsGeral in 'ServerMethodsGeral.pas' {SMGeral: TDataModule},
  WebModuleUnitPrincipal in 'WebModuleUnitPrincipal.pas' {WebModulePrincipal: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalServer, frmPrincipalServer);
  Application.Run;
end.
