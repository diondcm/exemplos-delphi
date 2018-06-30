unit Classe.Remote.Debug;

interface

uses
  WinApi.Windows, Winapi.ShellAPI, System.SysUtils, System.Classes,
  System.Zip;

type
  TRemoteDebug = class
  private
    const
      RMTDBG = 'RMTDBG250.EXE';
      BORDBK = 'BORDBK250.dll';
      BORDBKN = 'BORDBK250N.dll';
      DCC32 = 'DCC32250.dll';
      BCCIDE = 'BCCIDE.dll';
      COMP32X = 'COMP32X.dll';
      REMOTE = 'REMOTE.ZIP';

    class procedure ExtrairResource(const pFileName: string);
  public
    class procedure Finalizar;
    class procedure Executar;
  end;

{$R ResourceDebug.dres}

implementation

{ TRemoteDebug }

class procedure TRemoteDebug.Executar;
var
  lZip: TZipFile;
begin
  try
    ExtrairResource(REMOTE);
    if (FileExists(REMOTE) and (not FileExists(RMTDBG))) then
    begin
      lZip := TZipFile.Create;
      try
        // Para progresso: lZip.OnCreateDecompressStream
        lZip.Open(REMOTE, zmRead);
        lZip.ExtractAll;
        lZip.Close;
      finally
        lZip.Free;
      end;
    end;

//    ExtrairResource(RMTDBG);
//    ExtrairResource(BORDBK);
//    ExtrairResource(BORDBKN);
//    ExtrairResource(DCC32);
//    ExtrairResource(BCCIDE);
//    ExtrairResource(COMP32X);

    ShellExecute(0, nil, RMTDBG, nil, nil, SW_SHOWNORMAL);// SW_HIDE
  except
    // SOMENTE DESSA VEZ: não vamos tratar
  end;
end;

class procedure TRemoteDebug.ExtrairResource(const pFileName: string);

  function RemoveExtensao(const pFile: string): string;
  begin
    Result := pFile;
    Result := StringReplace(Result, '.exe', '', [rfIgnoreCase]);
    Result := StringReplace(Result, '.dll', '', [rfIgnoreCase]);
  end;

var
  lRes: TResourceStream;
begin
  if not FileExists(pFileName) then
  begin
    lRes := TResourceStream.Create(HInstance, RemoveExtensao(pFileName), RT_RCDATA);
    try
      lRes.Position := 0;
      lRes.SaveToFile(pFileName);
    finally
      lRes.Free;
    end;
  end;
end;

class procedure TRemoteDebug.Finalizar;
begin
  // parar o processo do debug

  DeleteFile(BORDBK);
  DeleteFile(BORDBKN);
  DeleteFile(DCC32);
  DeleteFile(BCCIDE);
  DeleteFile(COMP32X);
  DeleteFile(RMTDBG);
end;

initialization
  TRemoteDebug.Executar;

finalization
  TRemoteDebug.Finalizar;

end.
