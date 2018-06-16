unit Form.Cidades;

interface

uses
  DateUtils, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ComCtrls;

type
  TDownCidades = class(TThread)
  public
    const
      // https://bit.ly/2le1x6L
      URL_WS_CIDADES = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios';
  private
    class var
      FStrJson: string;
      FProcessado: Boolean;
  protected
    procedure BaixaCidades;
    procedure Execute; override;
  public
    constructor Create;
    class property StrJson: string read FStrJson write FStrJson;
    class property Processado: Boolean read FProcessado write FProcessado;
  end;

  TfrmCidades = class(TForm)
    panelControles: TPanel;
    buttonBaixarCidades: TButton;
    gridDados: TDBGrid;
    memoLog: TMemo;
    Splitter1: TSplitter;
    timerExecute: TTimer;
    status: TStatusBar;
    procedure buttonBaixarCidadesClick(Sender: TObject);
    procedure timerExecuteTimer(Sender: TObject);
  private
    FProcessando: Boolean;
    FStart: TDateTime;
  public
    { Public declarations }
  end;

var
  frmCidades: TfrmCidades;

implementation

{$R *.dfm}

procedure TfrmCidades.buttonBaixarCidadesClick(Sender: TObject);
begin
  buttonBaixarCidades.Enabled := False;
  FStart := Now;
  FProcessando := True;
  TDownCidades.Create;
  timerExecute.Enabled := True;
end;

{ TDownCidades }

procedure TDownCidades.BaixaCidades;
var
  lHTTP: TIdHTTP;
  lStm: TStringStream;
  lValJson: string;
begin
  lHTTP := TIdHTTP.Create(nil);
  lStm := TStringStream.Create;
  try
    lHTTP.Get(URL_WS_CIDADES, lStm);
    lValJson := lStm.DataString;

    TThread.Queue(nil,
      procedure
      begin
        StrJson := lValJson;
        FProcessado := True;
      end);
  finally
    lStm.Free;
    lHTTP.Free;
  end;
end;

constructor TDownCidades.Create;
begin
  FProcessado := False;
  FreeOnTerminate := True;
  inherited Create(False);
end;

procedure TDownCidades.Execute;
begin
  BaixaCidades;
end;

procedure TfrmCidades.timerExecuteTimer(Sender: TObject);
begin
  status.Panels[0].Text := 'Executando há: ' + IntToStr(SecondsBetween(FStart, Now)) + ' segs';
  if TDownCidades.Processado then
  begin
    FProcessando := False;
    status.Panels[0].Text := 'Concluído em ' + TimeToStr(Now) + ' em ' + IntToStr(SecondsBetween(FStart, Now)) + ' segs';
    memoLog.Text := TDownCidades.StrJson;
    timerExecute.Enabled := False;
    buttonBaixarCidades.Enabled := True;
  end;
end;

end.
