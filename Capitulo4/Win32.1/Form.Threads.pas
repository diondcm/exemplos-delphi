unit Form.Threads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Threading, Vcl.Samples.Gauges;

type
  TThreadExec = class(TThread)
  private
    FGauge: TGauge;
    // para olds Delphis
    FProgresso: Integer;

  protected
    // para olds Delphis
    procedure AtualizaProgresso;

    procedure Execute; override;
  public
    constructor Create(pGauge: TGauge);

  end;


  TfrmThreads = class(TForm)
    buttonStart: TButton;
    gaugeProcesso1: TGauge;
    gaugeProcesso2: TGauge;
    gaugeProcesso3: TGauge;
    gaugeProcesso4: TGauge;
    gaugeProcesso5: TGauge;
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

procedure TfrmThreads.buttonStartClick(Sender: TObject);
// Biblioteca boa sobre threads(C++) Boost
begin
  TThreadExec.Create(gaugeProcesso1);
  TThreadExec.Create(gaugeProcesso2);
  TThreadExec.Create(gaugeProcesso3);
  TThreadExec.Create(gaugeProcesso4);
  TThreadExec.Create(gaugeProcesso5);


//        Application.ProcessMessages; // Resolver com esse
 {
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
    begin
      try
      TThread.Synchronize(nil,
        procedure
        begin
          gaugeProcesso1.Progress := 0;
        end);


      for i := 0 to 100 do
      begin
        Sleep(100); //Simula um grande processamento

//        if i = 30 then
//          raise Exception.Create('Error Message');

        TThread.Synchronize(nil,
          procedure
          begin
            gaugeProcesso1.Progress := gaugeProcesso1.Progress + 1;
          end);
      end;
      except
        on E: Exception do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              ShowMessage('Erro em Thread: ' + E.ClassName + sLineBreak + E.Message)
              //raise Exception.Create();
            end);
        end;
      end;
    end).Start;
 }
end;

{ TThreadExec }

procedure TThreadExec.AtualizaProgresso;
begin
  FGauge.Progress := FProgresso;
end;

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
//  if FGauge.Name = 'gaugeProcesso1' then
//  begin
//    Priority := TThreadPriority.tpLowest;
//  end;

  NameThreadForDebugging('Calcula Progresso');
  try
    // para olds Delphis
    // FProgresso := 0;
    // Synchronize(AtualizaProgresso);
    TThread.Synchronize(nil,
      procedure
      begin
        FGauge.Progress := 0;
        FGauge.MaxValue := 1000000;
      end);

    for i := 0 to 1000000 do
    begin
      //Sleep(100); //Simula um grande processamento

  //        if i = 30 then
  //          raise Exception.Create('Error Message');

    // FProgresso := FProgresso + 1;
    // Synchronize(AtualizaProgresso);

      TThread.Synchronize(nil,
        procedure
        begin
          FGauge.Progress := FGauge.Progress + 1;
          Application.ProcessMessages;
        end);
    end;
  except
    on E: Exception do
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          // não aconcelhado >> FListMsg >> lá no frm principal, e ela exibir a msg
          ShowMessage('Erro em Thread: ' + E.ClassName + sLineBreak + E.Message)
          //raise Exception.Create();
        end);
    end;
  end;
end;

end.
