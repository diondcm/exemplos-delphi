unit Form.Map.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.DialogService, FMX.StdCtrls, Form.Base, FMX.Controls.Presentation, System.Sensors, FMX.Maps, System.Sensors.Components;

type
  TfrmMapView = class(TfrmBase)
    buttonLocalizacao: TButton;
    LocationSensor: TLocationSensor;
    MapView: TMapView;
    procedure buttonLocalizacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMapView: TfrmMapView;

implementation

{$R *.fmx}

procedure TfrmMapView.buttonLocalizacaoClick(Sender: TObject);
var
  lMapCenter: TMapCoordinate;
begin
/// Exemplo: http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Mobile_Tutorial:_Using_a_Map_Component_to_Work_with_Maps_(iOS_and_Android)
/// Api key http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Configuring_Android_Applications_to_Use_Google_Maps

  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    lMapCenter := TMapCoordinate.Create(LocationSensor.Sensor.Latitude,
      LocationSensor.Sensor.Longitude);
    LocationSensor.Active := False;
  end else begin
    TDialogService.ShowMessage('Sensor de localozação não ativado.');
  end;
end;

end.
