unit Classe.Download.Imagem;

interface

uses
  System.IOUtils, System.Classes, System.SysUtils,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TDownloadImagem = class
    function BaixarImagemCarro: Boolean;
  end;


implementation

{ TDownloadImagem }

function TDownloadImagem.BaixarImagemCarro: Boolean;
var
  lStm: TMemoryStream;
  lIdHTTP: TIdHTTP;
  lIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  lIdHTTP := TIdHTTP.Create(nil);
  lIdSSLIOHandlerSocketOpenSSL :=  TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  lStm := TMemoryStream.Create;
  try
    lIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvSSLv23;
    lIdHTTP.IOHandler := lIdSSLIOHandlerSocketOpenSSL;

    lIdHTTP.Get('https://cdn.motor1.com/images/mgl/N3Kbn/s3/2019-audi-r8-onlocation.jpg', lStm);

    lStm.Position := 0;

    lStm.SaveToFile('teste.jpg');

    Result := FileExists('teste.jpg');

  finally
    lStm.Free;
    lIdHTTP.Free;
    lIdSSLIOHandlerSocketOpenSSL.Free;
  end;
end;

end.
