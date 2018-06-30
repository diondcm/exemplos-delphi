unit Classe.Remote.Debug;

interface

uses
  WinApi.Windows, Winapi.ShellAPI, System.SysUtils, System.Classes;

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
  public
    class procedure Executar;
    class procedure ExtrairResource(const pFileName: string);
  end;

{$R ResourceDebug.dres}

implementation

{ TRemoteDebug }

class procedure TRemoteDebug.Executar;
begin
  ExtrairResource(RMTDBG);
  ExtrairResource(BORDBK);
  ExtrairResource(BORDBKN);
  ExtrairResource(DCC32);
  ExtrairResource(BCCIDE);
  ExtrairResource(COMP32X);

  ShellExecute(0, nil, RMTDBG, nil, nil, SW_SHOWNORMAL);// SW_HIDE
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

initialization
  TRemoteDebug.Executar;

end.
