unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Classe.Download.Imagem;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  lStm: TMemoryStream;
begin
  lStm := TMemoryStream.Create;

  IdHTTP1.Get('https://cdn.motor1.com/images/mgl/N3Kbn/s3/2019-audi-r8-onlocation.jpg', lStm);

  lStm.Position := 0;

  lStm.SaveToFile('teste.jpg');

  lStm.Free;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  lBx: TDownloadImagem;
begin
  lBx := TDownloadImagem.Create;
  if lBx.BaixarImagemCarro then
  begin
    Caption := TimeToStr(Now);
  end;
  lBx.Free;
end;

end.
