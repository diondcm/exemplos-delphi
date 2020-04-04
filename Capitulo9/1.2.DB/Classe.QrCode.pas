unit Classe.QrCode;

interface

uses System.Classes;

type
  TQrCode = class
    class procedure Gerar(pData: string; pStm: TStream);
  end;

implementation

uses Winapi.WinInet, System.SysUtils, System.NetEncoding;

{ TQrCode }

class procedure TQrCode.Gerar(pData: string; pStm: TStream);
var
  lEncodeURL: string;
  lHInet: Pointer;
  lBuffer: Pointer;
  lUrlOpen: Pointer;
  lBytesReaded: Cardinal;
const
  QR_URL = 'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s';
  BUFFER_SIZE = 1024 * 1024;
begin
  lEncodeURL := Format(QR_URL, [200, 200, 'M', TNetEncoding.URL.Encode(pData)]);
  lHInet := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(lHInet) then
  try
    pStm.Position := 0;
    GetMem(lBuffer, BUFFER_SIZE);
    try
      lUrlOpen := InternetOpenUrl(lHinet, PChar(lEncodeURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
      if Assigned(lUrlOpen) then
      begin
        repeat
          InternetReadFile(lUrlOpen, lBuffer, BUFFER_SIZE, lBytesReaded);
          if lBytesReaded > 0 then
            pStm.Write(lBuffer^, lBytesReaded);
        until (lBytesReaded = 0);
      end;
    finally
      FreeMem(lBuffer);
    end;
  finally
    InternetCloseHandle(lHInet);
  end;
end;

end.
