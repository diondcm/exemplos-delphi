program ListViewWS;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmListView},
  Classes.Custom.Adapter in 'Classes.Custom.Adapter.pas',
  Form.Menu in 'Form.Menu.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmListView, frmListView);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
