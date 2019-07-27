unit Form.Map.Browser;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Sensors, System.Sensors.Components,
  FMX.WebBrowser, FMX.Edit, FMX.Layouts;

type
  TfrmMapBrowser = class(TForm)
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    ButtonGo: TButton;
    Layout1: TLayout;
    EditURL: TEdit;
    WebBrowser1: TWebBrowser;
    LocationSensor: TLocationSensor;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnCloseForm: TProc;
    { Private declarations }
  const
    LOCATION_URL = 'https://www.google.com/maps/@%f,%f,15z';
  public
    { Public declarations }
    procedure ExibeForm(pOnClose: TProc);
  end;

var
  frmMapBrowser: TfrmMapBrowser;

implementation

{$R *.fmx}

procedure TfrmMapBrowser.ButtonGoClick(Sender: TObject);
begin
  LocationSensor.Active := True;
  if LocationSensor.Active then
  begin
    EditURL.Text := Format(LOCATION_URL, [LocationSensor.Sensor.Latitude, LocationSensor.Sensor.Longitude]);
    LocationSensor.Active := False;
    WebBrowser1.Navigate(EditURL.Text);
  end else begin
    EditURL.Text := 'www.google.com.br';
    WebBrowser1.Navigate(EditURL.Text);
  end;
end;

procedure TfrmMapBrowser.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMapBrowser.ExibeForm(pOnClose: TProc);
begin
  FOnCloseForm := pOnClose;
  Self.Show;
end;

procedure TfrmMapBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnCloseForm) then
  begin
    FOnCloseForm();
  end;

end;

end.
