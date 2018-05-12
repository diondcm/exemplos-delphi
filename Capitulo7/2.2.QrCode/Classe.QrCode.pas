unit Classe.QrCode;

interface

uses
  System.Classes;

type
  TQrCode = class
  private
    const
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


end;

end.
