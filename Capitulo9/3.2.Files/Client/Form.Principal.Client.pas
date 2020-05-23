unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Imaging.pngimage, System.Hash,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.Imaging.jpeg;

type
  TfrmPrincipalClinet = class(TForm)
    PanelImagem: TPanel;
    ImageLogo: TImage;
    IdHTTPFiles: TIdHTTP;
    PanelUpLoad: TPanel;
    ImageUpload: TImage;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    ButtonGetLogo: TButton;
    ButtonGetFile: TButton;
    ButtonClear: TButton;
    Panel2: TPanel;
    ButtonCarrega: TButton;
    ButtonEnviar: TButton;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    MemoHash: TMemo;
    Panel4: TPanel;
    ButtonGerHash: TButton;
    ButtonHashServer: TButton;
    ButtonGetTrans: TButton;
    ButtonAdd: TButton;
    EditTrans: TEdit;
    procedure ButtonGetLogoClick(Sender: TObject);
    procedure ButtonGetFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonCarregaClick(Sender: TObject);
    procedure ButtonEnviarClick(Sender: TObject);
    procedure ButtonGerHashClick(Sender: TObject);
    procedure ButtonHashServerClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonGetTransClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalClinet: TfrmPrincipalClinet;

implementation

{$R *.dfm}

uses Client.Module;

procedure TfrmPrincipalClinet.ButtonAddClick(Sender: TObject);
begin
  MemoHash.Lines.Add(ClientModule1.SMFilesClient.AdicionaTransaction(EditTrans.Text));
end;

procedure TfrmPrincipalClinet.ButtonCarregaClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ImageUpload.Picture.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TfrmPrincipalClinet.ButtonClearClick(Sender: TObject);
begin
  ImageLogo.Picture.Assign(nil);
end;

procedure TfrmPrincipalClinet.ButtonEnviarClick(Sender: TObject);
var
  lSm: TStringStream;
  lSize: Int64;
begin
  lSm := TStringStream.Create ;
  TPngImage(ImageUpload.Picture.Graphic).SaveToStream(lSm);
  lSm.Position := 0;
  lSize :=  ClientModule1.SMFilesClient.SetFile('LOGO_CLIENTE', lSm);
  Caption := 'Size: ' + IntToStr(lSize div 1024) + ' KB';
end;

procedure TfrmPrincipalClinet.ButtonGerHashClick(Sender: TObject);
begin
  var lStm: TStringStream := TStringStream.Create;
  lStm.LoadFromFile('exemplo.dll');
  MemoHash.Lines.Insert(0, THashSHA1.GetHashString(lStm.DataString) + sLineBreak);
  lStm.Free;
end;

procedure TfrmPrincipalClinet.ButtonGetFileClick(Sender: TObject);
var
  lSm: TStream;
  lPng: TPngImage;
  lSize: Int64;
begin
  lSm := ClientModule1.SMFilesClient.GetFile('LOGO_CLIENTE', lSize);
  lPng := TPngImage.Create;
  lPng.LoadFromStream(lSm);
  Caption := 'Size: ' + IntToStr(lSize div 1024) + ' KB';
  ImageLogo.Picture.Assign(lPng);
  lPng.Free;
end;

procedure TfrmPrincipalClinet.ButtonGetLogoClick(Sender: TObject);
var
  lSm: TStringStream;
  lPng: TPngImage;
begin
  // ClientModule1.SMFilesClient.GetLogo

  lSm := TStringStream.Create;

  IdHTTPFiles.Get('http://localhost:8080/datasnap/rest/TSMFiles/GetLogo', lSM);

  lSm.Position := 0;

  lPng := Vcl.Imaging.pngimage.TPngImage.Create;
  lPng.LoadFromStream(lSm);
  ImageLogo.Picture.Assign(lPng);
  lSm.Free;
  lPng.Free;
end;

procedure TfrmPrincipalClinet.ButtonGetTransClick(Sender: TObject);
begin
  MemoHash.Text := ClientModule1.SMFilesClient.GetTransactions;
end;

procedure TfrmPrincipalClinet.ButtonHashServerClick(Sender: TObject);
begin
  var lHashServer: string := ClientModule1.SMFilesClient.GetHashAtual('DLL_EXEMPLO');
  var lHahsLocal: string := THashSHA1.GetHashStringFromFile('exemplo.dll');

  MemoHash.Lines.Insert(0, 'Server: ' + lHashServer + sLineBreak);
  MemoHash.Lines.Insert(0, 'Client: ' + lHahsLocal);
end;

procedure TfrmPrincipalClinet.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
