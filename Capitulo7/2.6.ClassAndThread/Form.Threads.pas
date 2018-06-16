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
    buttonStrToInt: TButton;
    buttonStrToIntExcept: TButton;
    memoLog: TMemo;
    Button1: TButton;
    procedure buttonStartClick(Sender: TObject);
    procedure buttonStrToIntClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonStrToIntExceptClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fFrequency: Int64;
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
const
  MAX_VAL = 1000000;
var
  i: Integer;
begin
  inherited;
  try

  FGauge.Progress := 0;
  FGauge.MinValue := 0;
  FGauge.MaxValue := MAX_VAL div 1000;
  for i := 0 to MAX_VAL do
  begin
    if i mod 1000 = 0 then
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          //if i mod 1000 = 0 then
          // aqui, já estamos na main thread
          FGauge.Progress := FGauge.Progress + 1;
        end);
    end;
  end;
  raise Exception.Create(IntToStr(CurrentThread.ThreadID) +' - Error Message');
  except
    on E: Exception do
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          ShowMessage(E.Message);
          //raise Exception.Create();
        end);
    end;
  end;
end;

procedure TfrmThreads.buttonStrToIntClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      I: Integer;
      lVal: string;
      lInt: Int64;
      lFim: Int64;
    begin
      QueryPerformanceCounter(lInt);

      for I := 0 to 10000 do
      begin
        lVal := IntToStr(i);
        StrToInt(lVal);
      end;
      //sleep(1000);

      QueryPerformanceCounter(lFim);

      TThread.Synchronize(nil,
        procedure
        begin
          memoLog.Lines.Add('StrToInt: ' +
            FloatToStr(MSecsPerSec * ((lFim - lInt)/ fFrequency)));
        end);
    end).Start;

end;

procedure TfrmThreads.buttonStrToIntExceptClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      I: Integer;
      lVal: string;
      lInt: Int64;
      lFim: Int64;
    begin
      QueryPerformanceCounter(lInt);

      for I := 0 to 10000 do
      begin
        try
          lVal := IntToStr(i);
//          StrToInt(lVal + ' inválido');
          StrToIntdef(lVal + ' inválido', 0);
        except
          // não propagar, para não parar loop
        end;
      end;
      //sleep(1000);

      QueryPerformanceCounter(lFim);

      TThread.Synchronize(nil,
        procedure
        begin
          memoLog.Lines.Add('StrToInt: ' +
            FloatToStr(MSecsPerSec * ((lFim - lInt)/ fFrequency)));
        end);
    end).Start;
end;

procedure TfrmThreads.Button1Click(Sender: TObject);
//var
//  I: Integer;
begin
//  for I := 0 to 1000000000 do
//  begin
//    Application.ProcessMessages;
//    Sleep(1);
//  end;
end;

procedure TfrmThreads.buttonStartClick(Sender: TObject);
begin
  TThreadExec.Create(Gauge1);
  TThreadExec.Create(Gauge2);
  TThreadExec.Create(Gauge3);
  TThreadExec.Create(Gauge4);
  TThreadExec.Create(Gauge5);
end;

procedure TfrmThreads.FormCreate(Sender: TObject);
begin
  QueryPerformanceFrequency(fFrequency);
end;

end.
