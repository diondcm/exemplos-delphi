unit Debug.Remoto;

interface

uses
  System.Classes, Winapi.Windows, System.SysUtils, System.IOUtils, ShellAPI, Winapi.TlHelp32;

///  Links:
///  Arquivos:
///  http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Overview_of_Remote_Debugging
///  http://docwiki.embarcadero.com/RADStudio/Berlin/en/Installing_a_Debugger_on_a_Remote_Machine

{$IFDEF DEBUG}
{$R Debug.Remoto.Berlin.dres}
{$ENDIF}

type
  TDebugRemoto = class
  private const
    RMTDBG240 = 'rmtdbg240.exe';
    BORDBK240 = 'BORDBK240.dll';
    BORDBK240N = 'BORDBK240N.dll';
    DCC32240 = 'DCC32240.dll';
    BCCIDE = 'BCCIDE.dll';
    COMP32X = 'COMP32X.dll';
  private
    class procedure ExtrairResource(const pFileName: string);

    class procedure Extrair;
    class procedure Remover;
    class procedure Executar;

    class procedure KillTask(const pExeName: string);
//    class procedure KillTask2(const pExeName: string);
  public
//    class constructor Create;
    class procedure Ativar;
    class destructor Destroy;
  end;

implementation

{ TDebugRemoto }

class procedure TDebugRemoto.Ativar;
begin
//{$IFDEF DEBUG}
  TDebugRemoto.Extrair;
  TDebugRemoto.Executar;
//{$ENDIF}
end;

//class constructor TDebugRemoto.Create;
//begin
//  Extrair;
//end;

class destructor TDebugRemoto.Destroy;
begin
  Remover;
end;

class procedure TDebugRemoto.Executar;
begin
  ShellExecute(0, nil, RMTDBG240, nil, nil, SW_SHOWNORMAL); // SW_HIDE
end;

class procedure TDebugRemoto.Extrair;
begin
  ExtrairResource(RMTDBG240);
  ExtrairResource(BORDBK240);
  ExtrairResource(BORDBK240N);
  ExtrairResource(DCC32240);
  ExtrairResource(BCCIDE);
  ExtrairResource(COMP32X);
end;

class procedure TDebugRemoto.ExtrairResource(const pFileName: string);
var
  lRes: TResourceStream;
begin
  if not TFile.Exists(pFileName) then
  begin
    lRes := TResourceStream.Create(HInstance, ChangeFileExt(pFileName, ''), RT_RCDATA);
    try
      lRes.Position := 0;
      lRes.SaveToFile(pFileName);
    finally
      lRes.Free;
    end;
  end;
end;

class procedure TDebugRemoto.KillTask(const pExeName: string);
type
  TFuncProcess = reference to function (pID: Cardinal): Boolean;
var
  lContinueLoop: Boolean;
  lCloseProc: Boolean;
  lFunClose: TFuncProcess;

  function LoopProcess(pFuncValidacao: TFuncProcess): Boolean;
  var
    lSnapShotHandle: Cardinal;
    lCountLoop: Integer;
    lProcessEntry32: TProcessEntry32;
  begin
    Result := False;
    lSnapShotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    try
      lCountLoop := 0;
      lCloseProc := True;
      lProcessEntry32.dwSize := SizeOf(lProcessEntry32);
      lContinueLoop := Process32First(lSnapShotHandle, lProcessEntry32);
      while (lContinueLoop) and (lCloseProc) and (lCountLoop < 100000) do
      begin
        Inc(lCountLoop);

//        if (UpperCase(ExtractFileName(lProcessEntry32.szExeFile)) = UpperCase(pExeName)) or
//          (UpperCase(lProcessEntry32.szExeFile) = UpperCase(pExeName)) then
        if (CompareStr(UpperCase(ExtractFileName(lProcessEntry32.szExeFile)), UpperCase(pExeName)) = 0) then
        begin
          lCloseProc := lFunClose(lProcessEntry32.th32ProcessID);
          Result := True;
        end;

        lContinueLoop := Process32Next(lSnapShotHandle, lProcessEntry32);
      end;

      if lCountLoop > 100000 then
      begin
        raise Exception.Create('Count Loop Excedido');
      end;

    finally
      CloseHandle(lSnapShotHandle);
    end;
  end;

  procedure WaitProcessTerminate;
  var
    lCounterLoop: Integer;
    lFunc: TFuncProcess;
    lFouded: Boolean;
  begin
    lCounterLoop := 0;

    lFunc :=
      function (pID: Cardinal): Boolean
      begin
        Result := True;
      end;

    repeat
      Inc(lCounterLoop);

      Sleep(50); // 40 * 50 = 2.000 ms

      lFouded := LoopProcess(lFunc);
    until ((not lFouded) and (lCounterLoop < 40));
  end;

begin
  lCloseProc := False;

  lFunClose :=
    function (pID: Cardinal): Boolean
    begin
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), pID), 0);
    end;

  LoopProcess(lFunClose);

  if lCloseProc then
  begin
    WaitProcessTerminate;
  end;
end;

//class procedure TDebugRemoto.KillTask2(const pExeName: string);
//var
//  lStl: TStringList;
//begin
//  lStl := TStringList.Create;
//  try
//    lStl.Add('taskkill -f -im ' + pExeName + ' >> Result.txt');
//    lStl.SaveToFile('killremote.bat');
//
//    ShellExecute(0, nil, 'killremote.bat', nil, nil, SW_SHOWNORMAL); // SW_HIDE)
//
//    Sleep(2000);
//
//    if TFile.Exists('Result.txt') then
//    begin
//      lStl.LoadFromFile('Result.txt');
//      MessageBox(0, PChar(lStl.Text), 'Teste', MB_OK);
//    end;
//
//  finally
//     if TFile.Exists('Result.txt') then
//     DeleteFile('Result.txt');
//
//     if TFile.Exists('killremote.bat') then
//     DeleteFile('killremote.bat');
//
//    lStl.Free;
//  end;

  // WinExec(PAnsiChar('taskkill -f -im ' + pExeName), SW_SHOWNORMAL); //SW_HIDE
//end;

class procedure TDebugRemoto.Remover;

  procedure RemoveResource(const pFile: string);
  begin
    if TFile.Exists(pFile) then
    begin
      try
        TFile.Delete(pFile);
      except
        // Somente aqui, correto é sempre tratar
      end;
    end;
  end;

begin
  KillTask(RMTDBG240);
  RemoveResource(RMTDBG240);

  RemoveResource(BORDBK240);
  RemoveResource(BORDBK240N);
  RemoveResource(DCC32240);
  RemoveResource(BCCIDE);
  RemoveResource(COMP32X);
end;


initialization
{$IFDEF DEBUG}
  TDebugRemoto.Ativar;
{$ENDIF}

end.
