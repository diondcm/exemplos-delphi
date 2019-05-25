program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormServer in 'FormServer.pas' {frmServer},
  SMGeral in 'SMGeral.pas' {ServerMethodsGeral: TDataModule},
  WebModulePrincipal in 'WebModulePrincipal.pas' {WebModule1: TWebModule},
  Classe.Pessoa in 'Classe.Pessoa.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
