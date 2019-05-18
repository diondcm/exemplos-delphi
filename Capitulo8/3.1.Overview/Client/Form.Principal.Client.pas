unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ExtCtrls,
  System.DateUtils;

type
  TfrmTesteCargaPrincipal = class(TForm)
    PanelControles: TPanel;
    EditURL: TEdit;
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    MemoLog: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteCargaPrincipal: TfrmTesteCargaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTesteCargaPrincipal.Button1Click(Sender: TObject);
var
  lURL: string;
begin
  // QueryPerformanceCounter()

  lURL := EditURL.Text;

  for var i: Integer := 0 to 5 do
  begin
    TThread.CreateAnonymousThread(
      procedure
      var
        lStm: TStream;
        lIdHttp: TIdHTTP;
        lInicio: TTime;
        lTempoExec: Int64;
      begin
        lIdHttp := TIdHTTP.Create(nil);
        lStm := TStringStream.Create;
        try
          lInicio := Now;

          lIdHttp.Get(lURL, lStm);

          lTempoExec := MilliSecondsBetween(lInicio, Now);
          TThread.Synchronize(nil,
            procedure
            begin
              MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + TStringStream(lStm).DataString + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
            end);
        except
          on E: Exception do
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                MemoLog.Lines.Insert(0, TimeToStr(Now) + ' - ' + E.QualifiedClassName + ' - ' + E.Message + sLineBreak + 'ExecTime: ' + FormatFloat('0.,', lTempoExec) + sLineBreak);
              end);
          end;
        end;
        lIdHttp.Free;
        lStm.Free;
      end).Start;
  end;
end;

end.
