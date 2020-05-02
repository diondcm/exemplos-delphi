unit Form.Principal.Thread;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Samples.Gauges;

type
  TfrmPrincipal = class(TForm)
    PanelExcept: TPanel;
    ButtonComExcept: TBitBtn;
    ButtonSemExcept: TBitBtn;
    ButtonStart: TButton;
    PanelGauges: TPanel;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    procedure ButtonSemExceptClick(Sender: TObject);
    procedure ButtonComExceptClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonComExceptClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      // Aqui: >> rodando em outra thread
      var lIni: TDateTime := Now;
      var lTexto: string := 'Inválido';
      var lConv: string;
      var lTotal: Integer;
      for var i: Integer := 0 to 1000000 do
      begin
        try
          lTotal := StrToInt(lTexto) + i;
        except
          lTotal := 0;
        end;
        lConv := InttoStr(lTotal);
        //Sleep(1);
      end;

      ShowMessage('Tempo: ' + FormatDateTime('HH:MM:SS.ZZZ', Now - lIni));

    end).Start; // << COLOCAR O START
end;

procedure TfrmPrincipal.ButtonSemExceptClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      // Aqui: >> rodando em outra thread
      var lIni: TDateTime := Now;
      var lTexto: string := 'Inválido';
      var lConv: string;
      var lTotal: Integer;
      for var i: Integer := 0 to 1000000 do
      begin
        lTotal := StrToIntDef(lTexto, 0) + i;
        lConv := InttoStr(lTotal);
        //Sleep(1);
      end;

      ShowMessage('Tempo: ' + FormatDateTime('HH:MM:SS.ZZZ', Now - lIni));

    end).Start; // << COLOCAR O START
end;

procedure TfrmPrincipal.ButtonStartClick(Sender: TObject);

  function GetProcTh(pGauge: TGauge): TProc;
  const
    MAX_VAL = 1000000;
  begin
    pGauge.MinValue := 0;
    pGauge.MaxValue := MAX_VAL;

    Result :=
      procedure
      begin
        for var i: Integer := 0 to MAX_VAL do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
//              pGauge.Progress := i div 1000;
              pGauge.Progress := i;
              // 5 passos
              // Todas chegem jutas em 20% e aguardem para seguir
            end);

//          Application.ProcessMessages;
//
//          if Application.Terminated then
//            Exit;

          //Sleep(1);
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
end;

end.
