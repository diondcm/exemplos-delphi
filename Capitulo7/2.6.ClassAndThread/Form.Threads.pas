unit Form.Threads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls;

type
  TThreadExec = class(TThread)
  private
    FGauge: TGauge;
  protected
    procedure Execute; override;
  public
    constructor Create(pGauge: TGauge);
  end;


  TfrmThreads = class(TForm)
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    buttonStart: TButton;
    procedure buttonStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmThreads: TfrmThreads;

implementation

{$R *.dfm}

{ TThreadExec }

constructor TThreadExec.Create(pGauge: TGauge);
begin
  FGauge := pGauge;
  FreeOnTerminate := True;

  inherited Create(False);
end;

procedure TThreadExec.Execute;
var
  i: Integer;
begin
  inherited;

  FGauge.Progress := 0;
  FGauge.MinValue := 0;
  FGauge.MaxValue := 1000000;
  for i := 0 to 1000000 do
  begin
    FGauge.Progress := FGauge.Progress + 1;
  end;
end;

procedure TfrmThreads.buttonStartClick(Sender: TObject);
begin
  TThreadExec.Create(Gauge1);
  TThreadExec.Create(Gauge2);
  TThreadExec.Create(Gauge3);
  TThreadExec.Create(Gauge4);
  TThreadExec.Create(Gauge5);
end;

end.
