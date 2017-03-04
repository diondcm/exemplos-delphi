unit Form.Location;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.Detalhe, FMX.Controls.Presentation, System.Sensors,
  System.Sensors.Components, FMX.WebBrowser, FMX.Layouts;

type
  TfrmLocation = class(TfrmBaseDetalhe)
    WebBrowser1: TWebBrowser;
    LocationSensor1: TLocationSensor;
    Layout1: TLayout;
    Label1: TLabel;
    swtAtivaLocation: TSwitch;
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure swtAtivaLocationSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmLocation.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
const
  URL_GOOGLE_MAPS = 'https://maps.google.com/maps?q=%s,%s';
var
  lLatitude: string;
  lLongitude: string;
begin
  inherited;
  lLatitude := NewLocation.Latitude.ToString(ffGeneral, 5, 2, TFormatSettings.Create('en-US'));
  lLongitude := NewLocation.Longitude.ToString(ffGeneral, 5, 2, TFormatSettings.Create('en-US'));

  WebBrowser1.Navigate(Format(URL_GOOGLE_MAPS, [lLatitude, lLongitude]));
end;

procedure TfrmLocation.swtAtivaLocationSwitch(Sender: TObject);
begin
  inherited;
  LocationSensor1.Active := swtAtivaLocation.IsChecked;
end;

end.
