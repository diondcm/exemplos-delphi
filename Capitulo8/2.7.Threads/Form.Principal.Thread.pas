unit Form.Principal.Thread;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Gauges, Vcl.ExtCtrls, System.DateUtils;

type
  TfrmPrincipalTh = class(TForm)
    Panel1: TPanel;
    Gauge1: TGauge;
    Panel2: TPanel;
    ButtonStart: TButton;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    ButtonCountError: TButton;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonCountErrorClick(Sender: TObject);
  private
    procedure IniciaProcesso;
  public
    { Public declarations }
  end;

var
  frmPrincipalTh: TfrmPrincipalTh;

implementation

{$R *.dfm}

procedure TfrmPrincipalTh.ButtonCountErrorClick(Sender: TObject);
begin
{ Sem exceções
  TThread.CreateAnonymousThread(
    procedure
    var
      i, j: Integer;
      lStr: string;
      lDtIni: TDateTime;
    begin
      lStr := '100';
      lDtini := Now;
      for i := 0 to 1000000 do
      begin
        j := StrToInt(lStr);
      end;
      Tthread.Synchronize(nil,
        procedure
        begin
          Caption := 'Terminou - ' + TimeToStr(Now) + ' == ' + IntToStr(MilliSecondsBetween(Now, lDtIni));
        end);
    end).Start;
}

  TThread.CreateAnonymousThread(
    procedure
    var
      i, j: Integer;
      lStr: string;
      lDtIni: TDateTime;
    begin
      lStr := 'A';
      lDtini := Now;
      for i := 0 to 10000 do
      begin
        try
          j := StrToInt(lStr);
        except
          // ignorar
        end;
      end;
      Tthread.Synchronize(nil,
        procedure
        begin
          Caption := 'Terminou SE- ' + TimeToStr(Now) + ' == ' + IntToStr(MilliSecondsBetween(Now, lDtIni));
        end);
    end).Start;

end;

procedure TfrmPrincipalTh.ButtonStartClick(Sender: TObject);
begin
  IniciaProcesso;
end;

procedure TfrmPrincipalTh.IniciaProcesso;

   function GetProcTh(pGauge: TGauge): TProc;
   begin
     Result :=
      procedure
      var
        i: Integer;
      begin
        for i := 0 to 100000 {100} do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              pGauge.Progress := i div 1000 { 1};
            end);
          //Application.ProcessMessages; // falácia: só funciona se a aplicação recebe o foco a cada iteração
          Sleep(1 {1000});
        end;
      end;
   end;

begin
  TThread.CreateAnonymousThread(GetProcTh(Gauge1)).Start;
  TThread.CreateAnonymousThread(GetProcTh(Gauge2)).Start;
  TThread.CreateAnonymousThread(GetProcTh(Gauge3)).Start;
  TThread.CreateAnonymousThread(GetProcTh(Gauge4)).Start;
  TThread.CreateAnonymousThread(GetProcTh(Gauge5)).Start;
  TThread.CreateAnonymousThread(GetProcTh(Gauge6)).Start;

//  TThread.CreateAnonymousThread(
//    procedure
//    var
//      i: Integer;
//    begin
//      for i := 0 to 10000 do
//      begin
//        TThread.Synchronize(nil,
//          procedure
//          begin
//            Gauge1.Progress := i div 100;
//          end);
//        //Application.ProcessMessages; // falácia: só funciona se a aplicação recebe o foco a cada iteração
//        Sleep(10);
//      end;
//    end).Start;
end;

end.
