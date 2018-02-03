unit Form.MultiView.CameraComponent;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Base.Form.MultiView, FMX.Layouts,
  FMX.Objects, FMX.TabControl, FMX.Controls.Presentation, FMX.Media;

type
  TfrmCameraComponent = class(TfrmBaseMultiView)
    ToolBarCameraComp: TToolBar;
    buttonStart: TButton;
    buttonStop: TButton;
    TabControlCamera: TTabControl;
    tabCamera: TTabItem;
    tabConfig: TTabItem;
    RectangleTipoCamera: TRectangle;
    labelConfig: TLabel;
    buttonFront: TButton;
    buttonBack: TButton;
    imageCamera: TImage;
    CameraComponent: TCameraComponent;
    procedure CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
    procedure buttonStartClick(Sender: TObject);
    procedure buttonStopClick(Sender: TObject);
    procedure TabControlCameraChange(Sender: TObject);
    procedure buttonFrontClick(Sender: TObject);
    procedure buttonBackClick(Sender: TObject);
  private
    procedure GetImage;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmCameraComponent.buttonBackClick(Sender: TObject);
var
  lActive: Boolean;
begin
  lActive := CameraComponent.Active;
  try
    CameraComponent.Active := False;
    CameraComponent.Kind := TCameraKind.BackCamera;
  finally
    CameraComponent.Active := lActive;
  end;
end;

procedure TfrmCameraComponent.buttonFrontClick(Sender: TObject);
var
  lActive: Boolean;
begin
  lActive := CameraComponent.Active;
  try
    CameraComponent.Active := False;
    CameraComponent.Kind := TCameraKind.FrontCamera;
  finally
    CameraComponent.Active := lActive;
  end;
end;

procedure TfrmCameraComponent.buttonStartClick(Sender: TObject);
begin
  TabControlCamera.ActiveTab := tabCamera;
  CameraComponent.Active := True;
end;

procedure TfrmCameraComponent.buttonStopClick(Sender: TObject);
begin
  CameraComponent.Active := False;
  TabControlCamera.ActiveTab := tabConfig;
end;

procedure TfrmCameraComponent.CameraComponentSampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);
end;

procedure TfrmCameraComponent.GetImage;
begin
  CameraComponent.SampleBufferToBitmap(imageCamera.Bitmap, True);
end;

procedure TfrmCameraComponent.TabControlCameraChange(Sender: TObject);
begin
  if (TabControlCamera.ActiveTab = tabConfig) and (CameraComponent.Active) then
  begin
    CameraComponent.Active := False;
  end;
end;

end.
