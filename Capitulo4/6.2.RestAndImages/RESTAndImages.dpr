program RESTAndImages;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Menu in 'Form.Menu.pas' {frmMenu},
  Form.RESTGetImage in 'Form.RESTGetImage.pas' {frmRESTGetImage},
  Form.JSONFromRest in 'Form.JSONFromRest.pas' {frmJSONFromRest},
  Form.Get.Dados in 'Form.Get.Dados.pas' {frmGetDados},
  Data.Dados in 'Data.Dados.pas' {dmdDados: TDataModule},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule: TDataModule},
  Form.Notification in 'Form.Notification.pas' {frmNotifications},
  Form.Intents in 'Form.Intents.pas' {frmIntent},
  Classe.Intent.Email in 'Classe.Intent.Email.pas',
  Form.ListView.WS in 'Form.ListView.WS.pas' {frmListViewWS},
  Classe.Custom.Adapter in 'Classe.Custom.Adapter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
