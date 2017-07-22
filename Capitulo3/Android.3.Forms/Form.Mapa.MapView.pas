unit Form.Mapa.MapView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base, FMX.Controls.Presentation, FMX.Maps, System.Sensors,
  System.Sensors.Components;

type
  TfrmMapView = class(TfrmBase)
    MapView1: TMapView;
    LocationSensor1: TLocationSensor;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmMapView.FormShow(Sender: TObject);
var
  mapCenter: TMapCoordinate;
begin
  LocationSensor1.Active := True;
  if LocationSensor1.Active then
  begin
    mapCenter :=
      TMapCoordinate.Create(
        LocationSensor1.Sensor.Latitude,
        LocationSensor1.Sensor.Longitude);
    MapView1.Location := mapCenter;

    LocationSensor1.Active := False;
  end;
end;

end.
