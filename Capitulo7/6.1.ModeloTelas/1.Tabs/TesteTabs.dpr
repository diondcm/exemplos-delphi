program TesteTabs;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Tabs in 'Form.Principal.Tabs.pas' {frmPrincipalTabs};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipalTabs, frmPrincipalTabs);
  Application.Run;
end.
