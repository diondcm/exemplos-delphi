unit Classe.FileTransfer;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, System.JSON;

type
  TStatusFileTransfer = class
  private
    FArquivo: TMemoryStream;
    FVersao: string;
    FFileName: string;
    FTesteArr: TJSONArray;
  public
    constructor Create;
    destructor Destroy; override;
    property TesteArr: TJSONArray read FTesteArr write FTesteArr;
    property Arquivo: TMemoryStream read FArquivo write FArquivo;
    property Versao: string read FVersao write FVersao;
    property FileName: string read FFileName write FFileName;
    class function GetFileVersion(const pFileName: string): string;
  end;

implementation

{ TStatusFileTransfer }

constructor TStatusFileTransfer.Create;
begin
  FArquivo := TMemoryStream.Create;
end;

destructor TStatusFileTransfer.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

class function TStatusFileTransfer.GetFileVersion(
  const pFileName: string): string;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(pFileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(pFileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('%d.%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

end.
