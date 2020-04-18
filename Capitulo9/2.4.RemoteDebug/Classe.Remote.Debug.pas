unit Classe.Remote.Debug;

interface

uses System.SysUtils, System.Classes, System.Types, WinAPI.ShellAPI, System.IOUtils, WinAPI.Windows,
 WinApi.TlHelp32;

type
  TRemoteDebug = class
  const
    BCCIDE = 'bccide';
    BORDBK260 = 'bordbk260';
    BORDBK260N = 'bordbk260N';
    COMP32X = 'comp32x';
    DCC32260 = 'dcc32260';
    RMTDBG260 = 'rmtdbg260';
  public
    class procedure KillTask(pNomeProcesso: string);
  public
    class procedure Extrair;
    class procedure Finalizar;
//    class constructor Create;
//    class destructor Destroy;
  end;

implementation

{$R RemoteDebugRio.dres}

{ TRemoteDebug }

class procedure TRemoteDebug.Extrair;

  procedure ExtrairResource(pFileName, pExtensao: string);
  var
    lRes: TResourceStream;
  begin
    if not TFile.Exists(pFileName + '.' + pExtensao) then
    begin
      lRes := TResourceStream.Create(HInstance, pFileName, RT_RCDATA);
      try
        lRes.Position := 0;
        lRes.SaveToFile(pFileName + pExtensao);
      finally
        lRes.Free;
      end;
    end;
  end;

begin
  ExtrairResource(BCCIDE, '.dll');
  ExtrairResource(BORDBK260, '.dll');
  ExtrairResource(BORDBK260N, '.dll');
  ExtrairResource(COMP32X, '.dll');
  ExtrairResource(DCC32260, '.dll');
  ExtrairResource(RMTDBG260, '.exe');

  ShellExecute(0, nil, RMTDBG260 + '.exe', nil, nil, SW_SHOWNORMAL); // SH_HIDE
end;

class procedure TRemoteDebug.Finalizar;
begin
  KillTask(RMTDBG260 + '.exe');

  DeleteFile(BCCIDE + '.dll');
  DeleteFile(BORDBK260 + '.dll');
  DeleteFile(BORDBK260N + '.dll');
  DeleteFile(COMP32X + '.dll');
  DeleteFile(DCC32260 + '.dll');
  DeleteFile(RMTDBG260 + '.exe');
end;

class procedure TRemoteDebug.KillTask(pNomeProcesso: string);
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

        if (CompareStr(UpperCase(ExtractFileName(lProcessEntry.szExeFile)), UpperCase(pNomeProcesso)) = 0) or
         (CompareStr(UpperCase(lProcessEntry.szExeFile), UpperCase(pNomeProcesso)) = 0) then
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
  TRemoteDebug.Extrair;

finalization
  TRemoteDebug.Finalizar;

end.
