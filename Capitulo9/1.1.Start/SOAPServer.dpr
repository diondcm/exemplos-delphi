program SOAPServer;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.SOAP in 'Form.Principal.SOAP.pas' {frmPrincipalSoap},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  ConversorMoedaImpl in 'ConversorMoedaImpl.pas',
  ConversorMoedaIntf in 'ConversorMoedaIntf.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalSoap, frmPrincipalSoap);
  Application.Run;
end.
