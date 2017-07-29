program ListViewWS;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Types,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classes.Custom.Adapter in 'Classes.Custom.Adapter.pas';

{$R *.res}

begin
  Application.Initialize;
//  VKAutoShowMode := TVKAutoShowMode.Always;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
