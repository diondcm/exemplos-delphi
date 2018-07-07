unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ClientModuleUnit1;

type
  TfrmPrincipalClient = class(TForm)
    panelDatas: TPanel;
    labelDataDelphi: TLabel;
    labelDataIso8601: TLabel;
    labelDataUnix: TLabel;
    timerData: TTimer;
    checkAtualizaData: TCheckBox;
    IdHTTP: TIdHTTP;
    procedure checkAtualizaDataClick(Sender: TObject);
    procedure timerDataTimer(Sender: TObject);
  private
    procedure AtualizaDataDelphi;
    procedure AtualizaDataISO;
    procedure AtualizaDataUnix;
  public
    { Public declarations }
  end;

var
  frmPrincipalClient: TfrmPrincipalClient;

implementation

{$R *.dfm}

procedure TfrmPrincipalClient.checkAtualizaDataClick(Sender: TObject);
begin
  timerData.Enabled := checkAtualizaData.Checked;
end;

procedure TfrmPrincipalClient.timerDataTimer(Sender: TObject);
begin
  AtualizaDataUnix;

  AtualizaDataISO;

  AtualizaDataDelphi;
end;

procedure TfrmPrincipalClient.AtualizaDataDelphi;
begin
  labelDataDelphi.Caption := DateTimeToStr(ClientModule1.ServerMethods1Client.RetornaDataAtual);
end;

procedure TfrmPrincipalClient.AtualizaDataISO;
var
  lDataIso: string;
begin
  // Remoto
  lDataIso := ClientModule1.ServerMethods1Client.RetonaDataIso8601;
  labelDataIso8601.Caption := 'Iso 8601: ' + lDataIso + ' - ' + DateTimeToStr(ISO8601ToDate(lDataIso));
end;

procedure TfrmPrincipalClient.AtualizaDataUnix;
var
  lStm: TStringStream;
  lUnix: string;
begin
  lStm := TStringStream.Create;
  try
    // Local
    IdHTTP.Get('http://localhost:8080/datasnap/rest/TServerMethods1/RetonaDataUnix', lStm);
    //{"result":["1530958925"]}
    lUnix := StringReplace(StringReplace(lStm.DataString, '{"result":["', '', []), '"]}', '', []);
    labelDataUnix.Caption := 'Unix: ' + lUnix + ' - ' + DateTimeToStr(UnixToDateTime(StrToInt64(lUnix)));
  finally
    lStm.Free;
  end;
end;

end.
