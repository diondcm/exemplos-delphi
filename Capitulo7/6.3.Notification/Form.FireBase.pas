unit Form.FireBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation,
  System.PushNotification, FMX.ScrollBox, FMX.Memo
  {$IFDEF ANDROID}
   ,FMX.PushNotification.android
  {$ENDIF};

type
  TfrmFireBase = class(TForm)
    ToolBar1: TToolBar;
    ButtonClose: TButton;
    Button1: TButton;
    Memo1: TMemo;
    procedure ButtonCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ServiceConnection: TPushServiceConnection;
    PushService: TPushService;
    procedure OnChange(Sender: TObject; AChange: TPushService.TChanges);
    procedure OnReceiveNotification(Sender: TObject; const ANotification: TPushServiceNotification);
  end;

var
  frmFireBase: TfrmFireBase;

implementation

{$R *.fmx}

procedure TfrmFireBase.Button1Click(Sender: TObject);
var
  DeviceId: string;
  DeviceToken: string;
begin
   {$IFDEF ANDROID}
    PushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);
    PushService.AppProps[TPushService.TAppPropNames.GCMAppID] := 'AIzaSyBMMWcdzmiwUWfOeJ3M5Y4D4O8cLjPL_bc';
  {$ENDIF}
  ServiceConnection := TPushServiceConnection.Create(PushService);
  ServiceConnection.Active := True;
  ServiceConnection.OnChange := OnChange;
  ServiceConnection.OnReceiveNotification := OnReceiveNotification;

  DeviceId := PushService.DeviceIDValue[TPushService.TDeviceIDNames.DeviceId];
  DeviceToken := PushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
  Memo1.Lines.Add('DeviceID: ' + DeviceId);
  Memo1.Lines.Add('FCM Token: ' + DeviceToken);
  Memo1.Lines.Add('Ready to receive!');
end;

procedure TfrmFireBase.ButtonCloseClick(Sender: TObject);

/// IIS: http://edn.embarcadero.com/hr/article/40108

  procedure GravaLog(pMsg: String);
  const
    ARQ_LOG = 'c:\temp\logServer.txt';
  var
    lStl: TStringList;
  begin
    lStl := TStringList.Create;
    if FileExists(ARQ_LOG) then
    begin
      lStl.LoadFromFile(ARQ_LOG);
    end;
    lStl.Insert(pMsg, 0);
    lStl.SaveToFile(ARQ_LOG);
    lStl.Free;
  end;

begin
  Close;
end;

procedure TfrmFireBase.OnChange(Sender: TObject; AChange: TPushService.TChanges);
begin
  ShowMessage('OnChange');
end;

procedure TfrmFireBase.OnReceiveNotification(Sender: TObject; const ANotification: TPushServiceNotification);
begin
  ShowMessage('Notificacao');
end;

end.
