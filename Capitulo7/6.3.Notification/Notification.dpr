program Notification;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Notification in 'Form.Notification.pas' {frmNotification},
  Data.Notification in 'Data.Notification.pas' {dmdNotification: TDataModule},
  Form.FireBase in 'Form.FireBase.pas' {frmFireBase},
  Firebase.Auth in 'FireBase\Firebase.Auth.pas',
  Firebase.Database in 'FireBase\Firebase.Database.pas',
  Firebase.Interfaces in 'FireBase\Firebase.Interfaces.pas',
  Firebase.Request in 'FireBase\Firebase.Request.pas',
  Firebase.Response in 'FireBase\Firebase.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmNotification, frmNotification);
  Application.CreateForm(TdmdNotification, dmdNotification);
  Application.CreateForm(TfrmFireBase, frmFireBase);
  Application.Run;
end.
