unit Classe.Remote.Debug;

interface

uses
  WinApi.Windows, Winapi.ShellAPI, System.SysUtils, System.Classes,
  System.Zip, WinApi.TlHelp32;

type
  TRemoteDebug = class
  private
    const
      REMOTE = 'REMOTE.ZIP';
      RMTDBG = 'RMTDBG250.EXE';
      BORDBK = 'BORDBK250.dll';
      BORDBKN = 'BORDBK250N.dll';
      DCC32 = 'DCC32250.dll';
      BCCIDE = 'BCCIDE.dll';
      COMP32X = 'COMP32X.dll';

    class procedure ExtrairResource(const pFileName: string);
    class procedure KillTask(const pFileName: string);
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
      DeleteFile(REMOTE);
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
  KillTask(RMTDBG);

  DeleteFile(BORDBK);
  DeleteFile(BORDBKN);
  DeleteFile(DCC32);
  DeleteFile(BCCIDE);
  DeleteFile(COMP32X);
  DeleteFile(RMTDBG);
end;

class procedure TRemoteDebug.KillTask(const pFileName: string);
type
  TFuncProcess = reference to function (pID: Cardinal): Boolean;

var
  lFunc: TFuncProcess;
  lCloseProc: Boolean;


  procedure LoopProcess(pFuncValidacao: TFuncProcess);
  var
    lSnapShot: Cardinal;
    lProcessEntry: TProcessEntry32;
    lCountLoop: Integer;
    lContinueLoop: Boolean;
  begin
    lSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    try
      lCountLoop := 0;
      lCloseProc := True;
      lProcessEntry.dwSize := SizeOf(lProcessEntry);
      lContinueLoop := Process32First(lSnapShot, lProcessEntry);
      while (lContinueLoop) and (lCloseProc) and (lCountLoop < 100010) do
      begin
        Inc(lCountLoop);

        if (CompareStr(UpperCase(ExtractFileName(lProcessEntry.szExeFile)), UpperCase(pFileName)) = 0) or
         (CompareStr(UpperCase(lProcessEntry.szExeFile), UpperCase(pFileName)) = 0) then
        begin
          lCloseProc := pFuncValidacao(lProcessEntry.th32ProcessID);
        end;

        lContinueLoop := Process32Next(lSnapShot, lProcessEntry)
      end;

      if lCountLoop > 100000 then
      begin
        raise Exception.Create('Count Loop excedido');
      end;
    finally
      CloseHandle(lSnapShot);
    end;
  end;

  procedure WaitProcessTerminate;
  var
    lCounterLoop: Integer;
    lFouded: Boolean;
    lFunc: TFuncProcess;
  begin
    lCounterLoop := 0;
    lFunc :=
        function(pID: Cardinal): Boolean
        begin
          lFouded := True;
          Result := True;
        end;

    repeat
      lFouded := False;
      Inc(lCounterLoop);
      Sleep(50); // 40 * 50 >> 2.000 ms

      LoopProcess(lFunc);

    until ((not lFouded) and (lCounterLoop < 40));
  end;

begin
  try
    lFunc :=
      function (pID: Cardinal): Boolean
      begin
        // colocar outras funções de interação com processos
        Result :=
          TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), pID), 0);
      end;

    lCloseProc := False;
    LoopProcess(lFunc);

    if lCloseProc then
    begin
      WaitProcessTerminate;
    end;
  except
    //
  end;
end;

initialization
  TRemoteDebug.Executar;

finalization
  TRemoteDebug.Finalizar;

end.
