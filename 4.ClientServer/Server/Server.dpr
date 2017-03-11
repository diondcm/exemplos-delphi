program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.Server in 'Form.Principal.Server.pas' {Form2},
  Server.Methods in 'Server.Methods.pas' {ServerMethods1: TDataModule},
  Server.Container in 'Server.Container.pas' {ServerContainer1: TDataModule},
  Web.Module in 'Web.Module.pas' {WebModule1: TWebModule},
  Classe.Produto in '..\Comum\Classe.Produto.pas',
  Classe.Retorno in '..\Comum\Classe.Retorno.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
