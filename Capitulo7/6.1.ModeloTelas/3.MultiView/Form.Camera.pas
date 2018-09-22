unit Form.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Media, FMX.TabControl, FMX.Controls.Presentation;

type
  TfrmCamera = class(TForm)
    LayoutClient: TLayout;
    ToolBar1: TToolBar;
    TabControl: TTabControl;
    tabCamera: TTabItem;
    tabConfig: TTabItem;
    CameraComponent1: TCameraComponent;
    Rectangle1: TRectangle;
    SwitchCamera: TSwitch;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    ButtonStartCamera: TButton;
    ButtonStopCamera: TButton;
    ImageCamera: TImage;
    procedure SwitchCameraSwitch(Sender: TObject);
    procedure ButtonStartCameraClick(Sender: TObject);
    procedure ButtonStopCameraClick(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
  private
    procedure GetImage;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmCamera.ButtonStartCameraClick(Sender: TObject);
begin
  CameraComponent1.Active := True;
  TabControl.ActiveTab := tabCamera;
end;

procedure TfrmCamera.ButtonStopCameraClick(Sender: TObject);
begin
  CameraComponent1.Active := False;
end;

procedure TfrmCamera.CameraComponent1SampleBufferReady(Sender: TObject; const ATime: TMediaTime);
begin
  TThread.Synchronize(TThread.CurrentThread, GetImage);
end;

procedure TfrmCamera.GetImage;
begin
  CameraComponent1.SampleBufferToBitmap(ImageCamera.Bitmap, True);
end;

procedure TfrmCamera.SwitchCameraSwitch(Sender: TObject);
var
  lActive: Boolean;
begin
  lActive := CameraComponent1.Active;
  try
    CameraComponent1.Active := False;
    if SwitchCamera.IsChecked then
    begin
      CameraComponent1.Kind := TCameraKind.BackCamera;
    end else begin
      CameraComponent1.Kind := TCameraKind.FrontCamera;
    end;
  finally
    CameraComponent1.Active := lActive;
  end;
end;



end.
