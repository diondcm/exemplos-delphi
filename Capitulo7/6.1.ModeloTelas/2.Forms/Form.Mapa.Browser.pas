unit Form.Mapa.Browser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Form.Base, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.WebBrowser, System.Sensors, System.Sensors.Components;

type
  TfrmMapaBrowser = class(TfrmBase)
    Layout1: TLayout;
    editURL: TEdit;
    WebBrowser: TWebBrowser;
    buttonGo: TButton;
    LocationSensor: TLocationSensor;
    procedure buttonGoClick(Sender: TObject);
  private
    { Private declarations }
  private const
    LOCATION_URL = 'https://www.google.com.br/maps/search/maps/@%f,%f,12z';
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmMapaBrowser.buttonGoClick(Sender: TObject);
begin
  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    editURL.Text := Format(LOCATION_URL, [
      LocationSensor.Sensor.Latitude,
      LocationSensor.Sensor.Longitude]);

    LocationSensor.Active := False;
    WebBrowser.Navigate(editURL.Text);
  end;
end;

end.
