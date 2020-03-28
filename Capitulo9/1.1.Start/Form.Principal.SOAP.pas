unit Form.Principal.SOAP;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, Vcl.ExtCtrls;

type
  TfrmPrincipalSoap = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    TimerVariaMoeda: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerVariaMoedaTimer(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalSoap: TfrmPrincipalSoap;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, ConversorMoedaImpl;

procedure TfrmPrincipalSoap.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TfrmPrincipalSoap.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TfrmPrincipalSoap.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TfrmPrincipalSoap.ButtonStopClick(Sender: TObject);
begin
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TfrmPrincipalSoap.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TfrmPrincipalSoap.FormShow(Sender: TObject);
begin
  StartServer;
end;

procedure TfrmPrincipalSoap.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TfrmPrincipalSoap.TimerVariaMoedaTimer(Sender: TObject);
begin
  if Odd(Random(10)){ even() } then
  begin
    TTConversorMoeda.FCotacaoAtual := FloatToStr(StrToFloat(TTConversorMoeda.FCotacaoAtual) + (5 * Random(30)/100));
  end else begin
    TTConversorMoeda.FCotacaoAtual := FloatToStr(StrToFloat(TTConversorMoeda.FCotacaoAtual) - (5 * Random(30)/100));
  end;

  TTConversorMoeda.FHistorico := TTConversorMoeda.FHistorico + sLineBreak + DateTimeToStr(Now) + ' - ' + TTConversorMoeda.FCotacaoAtual;
end;

end.
