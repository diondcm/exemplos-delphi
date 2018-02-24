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
  Form.Local.DB in 'Form.Local.DB.pas' {frmLocalDB};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TClientModule, ClientModule);
  Application.CreateForm(TfrmLocalDB, frmLocalDB);
  Application.Run;
end.
