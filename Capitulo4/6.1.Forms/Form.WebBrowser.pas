unit Form.WebBrowser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Base.Form.Mobile, System.Actions,
  FMX.ActnList, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, System.Sensors, System.Sensors.Components,
  FMX.WebBrowser, FMX.DialogService;

type
  TfrmWebBrowser = class(TfrmBase)
    buttonAtivar: TButton;
    actAtivar: TAction;
    LayoutURL: TLayout;
    editURL: TEdit;
    buttonNavegar: TButton;
    actNavegar: TAction;
    LocationSensor: TLocationSensor;
    WebBrowser: TWebBrowser;
    procedure actAtivarExecute(Sender: TObject);
    procedure actNavegarExecute(Sender: TObject);
  private const
    LOCATION_URL = 'https://www.google.com.br/maps/search/maps/@%f,%f,12z';
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmWebBrowser.actAtivarExecute(Sender: TObject);
begin
  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    editURL.Text := Format(LOCATION_URL, [LocationSensor.Sensor.Latitude, LocationSensor.Sensor.Longitude]);
    LocationSensor.Active := False;

    actNavegar.Execute;
  end else begin
    // FMX.Dialogs.ShowMessage();
    TDialogService.ShowMessage('Sensor de localização, não ativado.');
  end;
end;

procedure TfrmWebBrowser.actNavegarExecute(Sender: TObject);
begin
  WebBrowser.Navigate(editURL.Text);
end;

end.
