unit Classe.Gera.QRCode;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, WinApi.WinInet, System.NetEncoding, IdHashSha, IdHash, IdHashMessageDigest,
  System.Hash;

type
  TQRCode = class
    type
      TErrorCorrection = (Low, Medium, Normal, High);
      TDataEncode = (Base64, SHA1);
      TDataEncodes = set of TDataEncode;
  private const
    URL_GOOGLE_QR = 'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s';
  public
    class procedure Gerar(pWidth, pHeight: Integer; pErroCorr: TQRCode.TErrorCorrection; pEncode: TQRCode.TDataEncodes; const pData: string; pImageStream: TStream); overload;
  end;

implementation

var
  ErroCorrectionArr: array [TQRCode.TErrorCorrection] of string = ('L', 'M', 'Q', 'H');

{ TQRCode }

class procedure TQRCode.Gerar(pWidth, pHeight: Integer; pErroCorr: TQRCode.TErrorCorrection; pEncode: TQRCode.TDataEncodes; const pData: string;
  pImageStream: TStream);
const
  BUFFER_SIZE = 1024*1024;
var
  lEncodedURL: string;
  lHInet: Pointer;
  lBuffer: Pointer;
  lUrlOpen: Pointer;
  lBytesReaded: Cardinal;
  lData: string;
begin
  lData := pData;

  if TQRCode.TDataEncode.Base64 in pEncode then
  begin
    lData := TNetEncoding.Base64.Encode(lData);
  end;

  if TQRCode.TDataEncode.SHA1 in pEncode then
  begin
    lData := THashSHA1.GetHashString(lData);
  end;

  lEncodedURL := Format(URL_GOOGLE_QR, [pWidth, pHeight, ErroCorrectionArr[pErroCorr], TNetEncoding.URL.Encode(lData)]);
  lHInet := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(lHInet) then
    try
      pImageStream.Position := 0;
      GetMem(lBuffer, BUFFER_SIZE);
      try
        lUrlOpen := InternetOpenUrl(lHInet, PCHar(lEncodedURL), nil, 0, INTERNET_FLAG_RELOAD, 0);
        if Assigned(lUrlOpen) then
        begin
          repeat
            InternetReadFile(lUrlOpen, lBuffer, BUFFER_SIZE, lBytesReaded);
            if lBytesReaded  > 0 then
              pImageStream.Write(lBuffer^, lBytesReaded);
          until (lBytesReaded = 0);

          InternetCloseHandle(lUrlOpen);
        end;
      finally
        FreeMem(lBuffer);
      end;
    finally
      InternetCloseHandle(lHInet);
    end;
end;

end.
