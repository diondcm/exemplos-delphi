unit Form.Notification;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Notification,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.StdCtrls, FMX.ListView, FMX.Controls.Presentation, FMX.Layouts, System.DateUtils;

type
  TfrmNotifications = class(TForm)
    ToolBar1: TToolBar;
    buttonBack: TButton;
    gridControles: TGridPanelLayout;
    buttonNotificationAgendada: TButton;
    NotificationCenter: TNotificationCenter;
    buttonNotificacao: TButton;
    buttonNotificacaoRepetitiva: TButton;
    buttonCancelNotification: TButton;
    procedure buttonBackClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure buttonNotificationAgendadaClick(Sender: TObject);
    procedure buttonNotificacaoClick(Sender: TObject);
    procedure buttonNotificacaoRepetitivaClick(Sender: TObject);
    procedure buttonCancelNotificationClick(Sender: TObject);
  private
    FNotification: string;
    class var
      FInstance: TfrmNotifications;
  public
    class function GetInstance: TfrmNotifications;
  end;

implementation

{$R *.fmx}

uses
  FMX.Platform, FMX.VirtualKeyboard;

procedure TfrmNotifications.buttonBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNotifications.buttonCancelNotificationClick(Sender: TObject);
begin
  if FNotification = '' then
  begin
    NotificationCenter.CancelAll;
  end else begin
    NotificationCenter.CancelNotification(FNotification);
    FNotification := '';
  end;
end;

procedure TfrmNotifications.buttonNotificacaoClick(Sender: TObject);
var
  lNot: TNotification;
begin
  lNot := NotificationCenter.CreateNotification;
  try
    lNot.Name := 'buttonNotificacao';
    FNotification := lNot.Name;
    lNot.AlertBody := 'ATENÇÃO: Mobile essentials';
    NotificationCenter.PresentNotification(lNot);
  finally
//    lNot.Free;
    lNot.DisposeOf;
  end;
end;

procedure TfrmNotifications.buttonNotificacaoRepetitivaClick(Sender: TObject);
var
  lNot: TNotification;
begin
  lNot := NotificationCenter.CreateNotification;
  try
    lNot.Name := 'buttonNotificacaoRepetiti';
    FNotification := lNot.Name;
    lNot.AlertBody := 'ATENÇÃO: Mobile essentials';
    lNot.FireDate := IncSecond(Now, 10);
    lNot.RepeatInterval := TRepeatInterval.Minute;
    NotificationCenter.ScheduleNotification(lNot);
  finally
    lNot.Free;
  end;
end;

procedure TfrmNotifications.buttonNotificationAgendadaClick(Sender: TObject);
var
  lNot: TNotification;
begin
  lNot := NotificationCenter.CreateNotification;
  try
    lNot.Name := 'buttonNotificationAgendada';
    FNotification := lNot.Name;
    lNot.AlertBody := 'ATENÇÃO: Mobile essentials';
    lNot.FireDate := IncSecond(Now, 10);
    NotificationCenter.ScheduleNotification(lNot);
  finally
    lNot.Free;
  end;
end;

procedure TfrmNotifications.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
var
  lService: IFMXVirtualKeyboardService;
begin
  // Evitar alterar comportamentos padrões do Delphi
  if Key = vkHardwareBack Then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(lService));
    if (lService <> nil) and (TVirtualKeyboardState.Visible in lService.VirtualKeyBoardState) Then
    begin
      // Reserved, do nothing
    end else begin
      Key := 0;
    end;
  end;
end;

class function TfrmNotifications.GetInstance: TfrmNotifications;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmNotifications.Create(Application);
  end;

  Result := FInstance;
end;

end.
