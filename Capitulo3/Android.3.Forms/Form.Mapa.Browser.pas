unit Form.Mapa.Browser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base, FMX.WebBrowser, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  System.Sensors, System.Sensors.Components;

type
  TfrmMapaBrowser = class(TfrmBase)
    Layout1: TLayout;
    edtUrl: TEdit;
    WebBrowser: TWebBrowser;
    LocationSensor1: TLocationSensor;
    btnNavigate: TButton;
    Button1: TButton;
    procedure btnNavigateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private const
    LOCATION_URL = 'https://www.google.com.br/maps/search/maps/@%f,%f,12z';
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmMapaBrowser: TfrmMapaBrowser;

implementation

{$R *.fmx}

procedure TfrmMapaBrowser.btnNavigateClick(Sender: TObject);
begin
  WebBrowser.Navigate(edtUrl.Text);

end;

procedure TfrmMapaBrowser.Button1Click(Sender: TObject);
begin
  inherited;
  LocationSensor1.Active := True;
  if LocationSensor1.Active then
  begin
    edtUrl.Text := Format(LOCATION_URL, [LocationSensor1.Sensor.Latitude,
                                              LocationSensor1.Sensor.Longitude]);
    LocationSensor1.Active := False;
    WebBrowser.Navigate(edtUrl.Text);

  end;
end;

end.
