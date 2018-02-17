program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.Sever in 'Form.Principal.Sever.pas' {frmPrincipalServer},
  GetDadosUnit in 'GetDadosUnit.pas' {GetDados: TDSServerModule},
  WebModulePrincipalUnit in 'WebModulePrincipalUnit.pas' {WebModulePrincipal: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalServer, frmPrincipalServer);
  Application.Run;
end.
