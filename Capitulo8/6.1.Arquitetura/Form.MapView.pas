unit Form.MapView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Maps, System.Sensors, System.Sensors.Components;

type
  TfrmMapView = class(TForm)
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    ButtonGo: TButton;
    LocationSensor: TLocationSensor;
    Label1: TLabel;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMapView: TfrmMapView;

implementation

{$R *.fmx}

procedure TfrmMapView.ButtonGoClick(Sender: TObject);
var
  lMapCenter: TMapCoordinate;
begin
  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    lMapCenter := TMapCoordinate.Create(LocationSensor.Sensor.Latitude, LocationSensor.Sensor.Longitude);
//    MapView1.Location := lMapCenter;
    LocationSensor.Active := False;
  end;
end;

procedure TfrmMapView.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
