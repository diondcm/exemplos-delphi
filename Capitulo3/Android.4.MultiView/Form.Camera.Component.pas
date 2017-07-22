unit Form.Camera.Component;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.MultiView, FMX.Layouts, FMX.Media, FMX.TabControl,
  FMX.Controls.Presentation, FMX.Objects;

type
  TfrmCameraComponent = class(TfrmBaseMultiView)
    CameraComponent1: TCameraComponent;
    tbcCamera: TTabControl;
    ToolBar1: TToolBar;
    btnStartCamera: TButton;
    btnStopCamera: TButton;
    tabCamera: TTabItem;
    imgCamera: TImage;
    tabConfig: TTabItem;
    Rectangle1: TRectangle;
    Label1: TLabel;
    btnFront: TSpeedButton;
    btnBack: TSpeedButton;
    procedure btnStartCameraClick(Sender: TObject);
    procedure btnStopCameraClick(Sender: TObject);
    procedure btnFrontClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
  private
    procedure GetImage;
  public
    { Public declarations }
  end;

var
  frmCameraComponent: TfrmCameraComponent;

implementation

{$R *.fmx}

procedure TfrmCameraComponent.btnBackClick(Sender: TObject);
var
  lActve: Boolean;
begin
  lActve := CameraComponent1.Active;
  try
    CameraComponent1.Active := False;
    CameraComponent1.Kind := TCameraKind.BackCamera;
  finally
    CameraComponent1.Active := lActve;
  end;
end;

procedure TfrmCameraComponent.btnFrontClick(Sender: TObject);
var
  lActve: Boolean;
begin
  lActve := CameraComponent1.Active;
  try
    CameraComponent1.Active := False;
    CameraComponent1.Kind := TCameraKind.FrontCamera;
  finally
    CameraComponent1.Active := lActve;
  end;
end;

procedure TfrmCameraComponent.btnStartCameraClick(Sender: TObject);
begin
  inherited;
  CameraComponent1.Active := True;
  tbcCamera.TabIndex := 0;
end;

procedure TfrmCameraComponent.btnStopCameraClick(Sender: TObject);
begin
  inherited;
  CameraComponent1.Active := False;
  tbcCamera.TabIndex := 1;
end;

procedure TfrmCameraComponent.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  inherited;
  TThread.Synchronize(TThread.CurrentThread, GetImage);
end;

procedure TfrmCameraComponent.GetImage;
begin
  CameraComponent1.SampleBufferToBitmap(imgCamera.Bitmap, True);
end;

end.
