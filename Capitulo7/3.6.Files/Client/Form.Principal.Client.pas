unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClientModuleUnit1, Vcl.StdCtrls, Classe.Pessoa, Vcl.ExtCtrls,
  DateUtils, System.Zlib, Vcl.Samples.Gauges;

type
  TfrmPrincipal = class(TForm)
    buttonGetPessoa: TButton;
    buttonSetPessoa: TButton;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    buttonDownLoad: TButton;
    comboArquivos: TComboBox;
    buttonUpload: TButton;
    OpenDialog: TOpenDialog;
    editPasta: TEdit;
    buttonDownloadProgress: TButton;
    gauge: TGauge;
    labelStatus: TLabel;
    procedure buttonGetPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonSetPessoaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure buttonDownLoadClick(Sender: TObject);
    procedure editPastaClick(Sender: TObject);
    procedure buttonUploadClick(Sender: TObject);
    procedure buttonDownloadProgressClick(Sender: TObject);
  private
    const
      LOGO_CLIENTE = 'logo_cliente';
      DADOS_CLIENTE = 'dados_cliente';

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.SetPessoa(nil);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.GetCarro(4);
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.GetCarroSemTratamento(4);
end;

procedure TfrmPrincipal.buttonDownLoadClick(Sender: TObject);
var
  lArq: string;
  lStm: TStringStream;
  lTempoIni: TDateTime;

  LUnZip: TZDecompressionStream;
  lSize: Int64;
begin
  lArq := '';
  case comboArquivos.ItemIndex of
    0: lArq := LOGO_CLIENTE;
    1: lArq := DADOS_CLIENTE;
  end;

  if lArq <> '' then
  begin
    lTempoIni := Now;
    lStm := TStringStream.Create;
    lUnZip := TZDecompressionStream.Create(ClientModule1.ServerMethods1Client.GetFile(lArq, lSize));
    lStm.CopyFrom(LUnZip, 0);

    LUnZip.Free;
    lStm.SaveToFile(lArq);
    lStm.Free;

    Caption := TimeToStr(Now) + ' - ' + IntToStr(SecondsBetween(Now, lTempoIni));
    ShowMessage('Finalizado');
  end;
end;

procedure TfrmPrincipal.buttonDownloadProgressClick(Sender: TObject);
var
  lArq: string;
  lStm: TStringStream;
  lTempoIni: TDateTime;

  LUnZip: TZDecompressionStream;
  lStmTemp: TStringStream;
  lStreamRet: TStream;
  lBytesReaded: Int64;
  lBuff: PByte;
  lSize: Int64;
  lStrSize: string;
  lBufSize: Integer;
begin
  lArq := '';
  case comboArquivos.ItemIndex of
    0: lArq := LOGO_CLIENTE;
    1: lArq := DADOS_CLIENTE;
  end;

  if lArq <> '' then
  begin
    lTempoIni := Now;
    lStm := TStringStream.Create;
    lStmTemp := TStringStream.Create;

    lStreamRet := ClientModule1.ServerMethods1Client.GetFile(lArq, lSize);
    lStrSize := IntToStr(lSize);
    gauge.MaxValue := lSize;
    lBytesReaded := 0;
    lBufSize := 1024 * 4;
    GetMem( lBuff, lBufSize );

    while lBytesReaded < lSize do
    begin
      lBytesReaded := lStreamRet.Read(lBuff, lBufSize);
      if lBytesReaded > 0 then
      begin
        lStmTemp.Write(Pointer(lBuff)^, lBytesReaded);
      end;

      labelStatus.Caption := IntToStr(lStmTemp.Size) + '/' + lStrSize;
      gauge.Progress := lStmTemp.Size;
      Application.ProcessMessages;
    end;

    FreeMem(lBuff);

    lStmTemp.Position := 0;
    lUnZip := TZDecompressionStream.Create(lStmTemp);
    lStm.CopyFrom(LUnZip, 0);

    LUnZip.Free;
    lStm.SaveToFile(lArq);
    lStm.Free;

    Caption := TimeToStr(Now) + ' - ' + IntToStr(SecondsBetween(Now, lTempoIni));
    ShowMessage('Finalizado');
  end;
end;

procedure TfrmPrincipal.buttonGetPessoaClick(Sender: TObject);
//var
//  lPessoa: TPessoa;
begin
//  lPessoa := ClientModule1.ServerMethods1Client.GetPessoa(3);
//  lPessoa.Free;
end;

procedure TfrmPrincipal.buttonSetPessoaClick(Sender: TObject);
var
  lPess: TPessoa;
begin
  lPess := TPessoa.Create;
  ClientModule1.ServerMethods1Client.SetPessoa(lPess);
  // lPess.Free; >> não fazer, DataSnap destruirá
end;

procedure TfrmPrincipal.buttonUploadClick(Sender: TObject);
var
  lArq: string;
  lArqPAraZippar: TStringStream;
  LZip: TZCompressionStream;
  lStmDest: TStringStream;
  lSize: Int64;
begin


  lArq := '';
  case comboArquivos.ItemIndex of
    0: lArq := LOGO_CLIENTE;
    1: lArq := DADOS_CLIENTE;
  end;

  if FileExists(editPasta.Text) then
  begin
    lArqPAraZippar := TStringStream.Create;
    lStmDest := TStringStream.Create;
    lArqPAraZippar.LoadFromFile(editPasta.Text);
    LZip := TZCompressionStream.Create(clDefault, lStmDest);
    LZip.CopyFrom(lArqPAraZippar, lArqPAraZippar.Size);
    LZip.Free;
    lArqPAraZippar.Free;

    lSize := lStmDest.Size;
    ClientModule1.ServerMethods1Client.SetFile(lArq, 'upload', lSize, lStmDest);
  end;
end;

procedure TfrmPrincipal.editPastaClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    editPasta.Text := OpenDialog.FileName;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
