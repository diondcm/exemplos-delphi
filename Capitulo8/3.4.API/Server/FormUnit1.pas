unit FormUnit1;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Classe.Root;

type
  TForm1 = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    MemoLog: TMemo;
    ButtonGet: TButton;
    RESTClient: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest: TRESTRequest;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure ButtonGetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TForm1.ButtonGetClick(Sender: TObject);
var
  lStm: TStringStream;
  lRetorno: string;
  lObjBlockChain: TRootClass;
  lTransaction: string;
begin
  RESTRequest.Execute;
  lRetorno := RESTResponse1.Content;
  MemoLog.Text := lRetorno;
  lObjBlockChain := TRootClass.FromJsonString(MemoLog.Text);
  Edit1.Text := FormatFloat('0.,00', lObjBlockChain.balance);
  MemoLog.Lines.Insert(0, '');
  for lTransaction in lObjBlockChain.transactions do
  begin
    MemoLog.Lines.Insert(0, lTransaction);
  end;

//  lStm := TStringStream.Create;
//  IdHTTP1.Get('https://rest.bitcoin.com/v2/address/details/bitcoincash:qzs02v05l7qs5s24srqju498qu55dwuj0cx5ehjm2c', lStm);
//  MemoLog.Text := lStm.DataString;
//  lStm.Free;
end;

procedure TForm1.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StartServer;
end;

procedure TForm1.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

end.
