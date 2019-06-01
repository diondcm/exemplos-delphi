program ClientEMS;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Client in 'Form.Client.pas' {frmClient};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.
