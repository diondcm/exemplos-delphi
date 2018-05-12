unit Classe.QrCode;

interface

uses
  WinApi.WinInet, System.Classes, System.SysUtils, System.NetEncoding;

type
  TQrCode = class
  private const
    QR_URL = 'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s';
  public
    class procedure Gerar(const pDados: string; pImagem: TStream);
  end;

implementation

{ TQrCode }

class procedure TQrCode.Gerar(const pDados: string; pImagem: TStream);
const
  BUFFER_SIZE = 1024*1024;
var
  lEncodeURL: string;
  lHInet: Pointer;
  lBuffer: Pointer;
  lUrlOpen: Pointer;
  lBytesReaded: Cardinal;
  lData: string;
begin
  lData := pDados;

  if not Assigned(pImagem) then
    raise Exception.Create('Informe uma imagem(Stream)!');

  lEncodeURL := Format(QR_URL, [100, 100, 'M', TNetEncoding.URL.Encode(lData)]);
  lHInet := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(lHInet) then //begin
  try
    pImagem.Position := 0;
    GetMem(lBuffer, BUFFER_SIZE);
    try
      lUrlOpen := InternetOpenUrl(lHinet, PChar(lEncodeURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
      if Assigned(lUrlOpen) then
      begin
        repeat
          InternetReadFile(lUrlOpen, lBuffer, BUFFER_SIZE, lBytesReaded);
          if lBytesReaded > 0 then
            pImagem.Write(lBuffer^, lBytesReaded);
        until (lBytesReaded = 0);
      end;
    finally
      FreeMem(lBuffer);
    end;
  finally
    InternetCloseHandle(lHInet);
  end;
  //end;
end;

end.
