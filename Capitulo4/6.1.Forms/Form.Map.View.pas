unit Form.Map.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Base.Form.Mobile, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation, FMX.Maps, System.Sensors, System.Sensors.Components,
  FMX.DialogService;

type
  TfrmMapView = class(TfrmBase)
    MapView: TMapView;
    Button2: TButton;
    actAtivarLocalizacao: TAction;
    LocationSensor: TLocationSensor;
    procedure actAtivarLocalizacaoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmMapView.actAtivarLocalizacaoExecute(Sender: TObject);
var
  lmapCenter: TMapCoordinate;
begin
  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    lmapCenter := TMapCoordinate.Create(LocationSensor.Sensor.Latitude, LocationSensor.Sensor.Longitude);
    MapView.Location := lmapCenter;
    LocationSensor.Active := False;
  end else begin
    TDialogService.ShowMessage('Sensor de localização não ativado.');
  end;
end;

end.
