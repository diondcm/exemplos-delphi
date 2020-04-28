program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Principal.Server in 'Form.Principal.Server.pas' {frmPrincipalServer},
  ServerMethodsGeral in 'ServerMethodsGeral.pas' {SMGeral: TDataModule},
  WebModuleUnitPrincipal in 'WebModuleUnitPrincipal.pas' {WebModulePrincipal: TWebModule},
  Classe.Pessoa in '..\shared\Classe.Pessoa.pas',
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule},
  Classe.Log.Server in 'Classe.Log.Server.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalServer, frmPrincipalServer);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.Run;
end.
