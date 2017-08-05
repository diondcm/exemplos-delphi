program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Server in 'Form.Server.pas' {frmServer},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods1: TDataModule},
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule},
  Classe.Configuracao in '..\Classe.Configuracao.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
