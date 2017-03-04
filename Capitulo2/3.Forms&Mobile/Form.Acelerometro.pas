unit Form.Acelerometro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.Detalhe, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts,
  System.Sensors, System.Sensors.Components;

type
  TfrmAcelerometro = class(TfrmBaseDetalhe)
    Label1: TLabel;
    ListBox1: TListBox;
    lbiSensor: TListBoxItem;
    swtSensor: TSwitch;
    lbiAcX: TListBoxItem;
    lbiAcY: TListBoxItem;
    lbiACZ: TListBoxItem;
    lbiAnguloX: TListBoxItem;
    lbiAnguloY: TListBoxItem;
    lbiAnguloZ: TListBoxItem;
    lbiMovimento: TListBoxItem;
    lbiVelocidade: TListBoxItem;
    MotionSensor1: TMotionSensor;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure swtSensorSwitch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcelerometro: TfrmAcelerometro;

implementation

{$R *.fmx}

procedure TfrmAcelerometro.FormCreate(Sender: TObject);
begin
  inherited;
  lbiAcX.Visible := False;
  lbiAcY.Visible := False;
  lbiACZ.Visible := False;
  lbiAnguloX.Visible := False;
  lbiAnguloY.Visible := False;
  lbiAnguloZ.Visible := False;
  lbiMovimento.Visible := False;
  lbiVelocidade.Visible := False;

{$ifdef IOS}
  {$ifndef CPUARM}
    lbiSensor.Text := 'Simulator - no sensors';
    swtSensor.Enabled := False;
  {$endif}
{$endif}
end;

procedure TfrmAcelerometro.swtSensorSwitch(Sender: TObject);
begin
  inherited;
  MotionSensor1.Active := swtSensor.IsChecked;
  Timer1.Enabled := swtSensor.IsChecked;
end;

procedure TfrmAcelerometro.Timer1Timer(Sender: TObject);
var
  lProp: TCustomMotionSensor.TProperty;
begin
  for lProp in MotionSensor1.Sensor.AvailableProperties do
  begin
    case lProp of
      TCustomMotionSensor.TProperty.AccelerationX:
      begin
        lbiAcX.Visible := True;
        lbiAcX.Text := Format('Aceleração em X: %6.2f', [MotionSensor1.Sensor.AccelerationX]);
      end;
      TCustomMotionSensor.TProperty.AccelerationY:
      begin
        lbiAcY.Visible := True;
        lbiAcY.Text := Format('Aceleração em Y: %6.2f', [MotionSensor1.Sensor.AccelerationY]);
      end;
      TCustomMotionSensor.TProperty.AccelerationZ:
      begin
        lbiACZ.Visible := True;
        lbiACZ.Text := Format('Aceleração em Z: %6.2f', [MotionSensor1.Sensor.AccelerationZ]);
      end;
      TCustomMotionSensor.TProperty.AngleAccelX:
      begin
        lbiAnguloX.Visible := True;
        lbiAnguloX.Text := Format('Ângulo em X: %6.2f', [MotionSensor1.Sensor.AngleAccelX]);
      end;
      TCustomMotionSensor.TProperty.AngleAccelY:
      begin
        lbiAnguloY.Visible := True;
        lbiAnguloY.Text := Format('Ângulo em Y: %6.2f', [MotionSensor1.Sensor.AngleAccelY]);
      end;
      TCustomMotionSensor.TProperty.AngleAccelZ:
      begin
        lbiAnguloZ.Visible := True;
        lbiAnguloZ.Text := Format('Ângulo em Z: %6.2f', [MotionSensor1.Sensor.AngleAccelZ]);
      end;
      TCustomMotionSensor.TProperty.Motion:
      begin
        lbiMovimento.Visible := True;
        lbiMovimento.Text := Format('Movimento: %6.2f', [MotionSensor1.Sensor.Motion]);
      end;
      TCustomMotionSensor.TProperty.Speed:
      begin
        lbiVelocidade.Visible := True;
        lbiVelocidade.Text := Format('Velocidade: %6.2f', [MotionSensor1.Sensor.Speed]);
      end;
    end;
  end;



end;

end.
