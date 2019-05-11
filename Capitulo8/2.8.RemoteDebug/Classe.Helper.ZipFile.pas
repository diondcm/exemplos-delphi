unit Classe.Helper.ZipFile;

interface

uses
  System.Classes, System.Zip, System.SysUtils;

type
  TZipFileHelper = class helper for TZipFile
  private
//    Acessível via -> Fake properties
//    FNomeArquivo: string;
//    procedure SetNomeArquivo(const Value: string);
  public
//    property NomeArquivo: string read FNomeArquivo write SetNomeArquivo;
  public
    class procedure ZippaArquivos(pArquivoZip: string; pListaArq: TStrings); overload;
    class procedure ZippaArquivos(pArquivoZip: string; pListaArq: TArray<string>); overload;

    class procedure DeszippaArquivos(pArquivoZip: string; pCriarPasta: Boolean = False);
  end;

implementation

{ TZipFileHelper }

class procedure TZipFileHelper.ZippaArquivos(pArquivoZip: string; pListaArq: TStrings);
begin
  TZipFile.ZippaArquivos(pArquivoZip, pListaArq.ToStringArray);
end;

class procedure TZipFileHelper.DeszippaArquivos(pArquivoZip: string; pCriarPasta: Boolean);
var
  lZip: TZipFile;
  lOutPutDir: string;
begin
  lZip := TZipFile.Create;

  lZip.Open(pArquivoZip, zmRead);

  lOutPutDir := IncludeTrailingPathDelimiter(ExtractFilePath(pArquivoZip));
  if pCriarPasta then
  begin
    lOutPutDir := IncludeTrailingPathDelimiter(lOutPutDir + ChangeFileExt(ExtractFileName(pArquivoZip), ''));
    ForceDirectories(lOutPutDir);
  end;

  lZip.ExtractAll(lOutPutDir);

  lZip.Free;
end;

class procedure TZipFileHelper.ZippaArquivos(pArquivoZip: string; pListaArq: TArray<string>);
var
  lZip: TZipFile;
  lArq: string;
begin
  DeleteFile(pArquivoZip);

  lZip := TZipFile.Create;
  try
    lZip.Open(pArquivoZip, zmWrite);

    for lArq in pListaArq do
    begin
      lZip.Add(lArq);
    end;

  finally
    lZip.Free;
  end;
end;

end.
