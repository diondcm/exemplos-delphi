unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges;

type
  TfrmPrincipal = class(TForm)
    btnSleep: TButton;
    btnSleepThread: TButton;
    gauThread: TGauge;
    gauMain: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    btnStart: TButton;
    Label3: TLabel;
    Gauge1: TGauge;
    Label4: TLabel;
    Gauge2: TGauge;
    procedure btnSleepClick(Sender: TObject);
    procedure btnSleepThreadClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnSleepClick(Sender: TObject);
begin
  Sleep(1500);
end;

procedure TfrmPrincipal.btnSleepThreadClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      Sleep(5000);
    end).Start;
end;

procedure TfrmPrincipal.btnStartClick(Sender: TObject);
var
  i: Integer;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      l: Integer;
    begin
      for l := 0 to gauThread.MaxValue do
      begin
        TThread.Synchronize(nil,
          procedure
          begin
            if (l mod 1000000000) = 0 then
              gauThread.Progress := l;
          end);

//        gauThread.Progress := l;
//        if (l mod 10000) = 0 then
//          Sleep(1);
      end;
    end).Start;

  TThread.CreateAnonymousThread(
    procedure
    var
      l: Integer;
    begin
      for l := 0 to Gauge2.MaxValue do
      begin
        TThread.Synchronize(nil,
          procedure
          begin
            if (l mod 1000000000) = 0 then
              Gauge2.Progress := l;
          end);
//        Gauge2.Progress := l;
//        if (l mod 10000) = 0 then
//          Sleep(1);
      end;
    end).Start;

  TThread.CreateAnonymousThread(
    procedure
    var
      l: Integer;
    begin
      for l := 0 to Gauge1.MaxValue do
      begin
        TThread.Synchronize(nil,
          procedure
          begin
            if (l mod 1000000000) = 0 then
              Gauge1.Progress := l;
          end);
//        Gauge1.Progress := l;
//        if (l mod 10000) = 0 then
//          Sleep(1);
      end;
    end).Start;

//  for i := 0 to gauMain.MaxValue do
//  begin
//    gauMain.Progress := i;
//    if (i mod 10000) = 0 then
//      Sleep(1);
//  end;
end;

end.
