program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Server.Principal in 'Form.Server.Principal.pas' {Form1},
  ServerMethodsAcao in 'ServerMethodsAcao.pas' {SMAcao: TDataModule},
  Web.Module in 'Web.Module.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
