unit Debug.Remoto;

interface

uses
  System.Classes, WinApi.Windows, System.SysUtils, ShellAPI, System.IOUtils,
  WinApi.TlHelp32;

type
  // Link para debug:
  // http://docwiki.embarcadero.com/RADStudio/Berlin/en/Installing_a_Debugger_on_a_Remote_Machine
  // http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Conditional_compilation_(Delphi)
  TDebugRemoto = class
  private const
    RMTDBG240 =
      {$IF CompilerVersion = 30}
        'RMTDBG230.exe'
      {$ELSEIF CompilerVersion = 31}
        'RMTDBG240.exe'
      {$ENDIF};
    BORDBK240 = 'BORDBK240.dll';
    BORDBK240N = 'BORDBK240N.dll';
    DCC32240 = 'DCC32240.dll';
    BCCIDE = 'BCCIDE.dll';
    COMP32X = 'COMP32X.dll';
  private
    class procedure ExtrairResources(const pFileName: string);
    class procedure Extrair;
    class procedure Executar;

    class procedure KillTask(const pExeName: string);

  public
//    class constructor Create; // Se não tiver referência a classe, não inicializa

    class procedure Ativar;
    class destructor Destroy;

    class procedure RemoveArquivos;
  end;

{$DEFINE DEBUG_REMOTO}
//{$UNDEF DEBUG_REMOTO}

implementation


{$IFDEF DEBUG}
  {$IFDEF DEBUG_REMOTO}
  {$IF CompilerVersion = 31}// Berlin
    {$R DebugRemoto.Berlin.dres}
  {$ENDIF}
  {$ENDIF}
{$ENDIF}

{ TDebugRemoto }

class procedure TDebugRemoto.Ativar;
begin
{$IFDEF DEBUG}
  TDebugRemoto.Extrair;
  TDebugRemoto.Executar;
{$ENDIF}
end;

//class constructor TDebugRemoto.Create;
//begin
//  TDebugRemoto.Ativar;
//end;

class destructor TDebugRemoto.Destroy;
begin
{$IFDEF DEBUG}
  TDebugRemoto.RemoveArquivos;
{$ENDIF}
end;

class procedure TDebugRemoto.Executar;
begin
  ShellExecute(0, nil, RMTDBG240, nil, nil, SW_SHOWNORMAL); // SW_HIDE
end;

class procedure TDebugRemoto.Extrair;
begin
  ExtrairResources(RMTDBG240);
  ExtrairResources(BORDBK240);
  ExtrairResources(BORDBK240N);
  ExtrairResources(BCCIDE);
  ExtrairResources(COMP32X);
  ExtrairResources(DCC32240);
end;

class procedure TDebugRemoto.ExtrairResources(const pFileName: string);

  function RemoveExtensao(const pFile: string): string;
  begin
    Result := StringReplace(pFile, '.exe', '', []);
    Result := StringReplace(Result, '.dll', '', []);
  end;

var
  lRes: TResourceStream;
begin
  if not TFile.Exists(pFileName) then
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



class procedure TDebugRemoto.KillTask(const pExeName: string);
type
  TFunProcess = reference to function (pID: Cardinal): Boolean;
// CORE Win32 programming
// Tomes of Shell API
// todo: inicializar com ProcID, para não necessitar de Snapshot e Loop;
//
//      if (CompareStr(UpperCase(ExtractFileName(lProcessEntry32.szExeFile)), UpperCase(pExeName)) = 0)
//      or (CompareStr(UpperCase(lProcessEntry32.szExeFile), UpperCase(pExeName)) = 0) then
var
  lContinueLoop: Boolean;
  lCloseProc: Boolean;
  lFuncClose: TFunProcess;

  function LoopProcess(lFuncValidacao: TFunProcess): Boolean;
  var
    lCountLoop: Integer;
    lSnapshotHandle: Cardinal;
    lProcessEntry32: TProcessEntry32;
  begin
    Result := False;
    lSnapshotHandle := CreateToolhelp32SnapShot(TH32CS_SNAPPROCESS, 0);
    try
      lCountLoop := 0;
      lCloseProc := True;
      lProcessEntry32.dwSize := SizeOf(lProcessEntry32);
      lContinueLoop := Process32First(lSnapshotHandle, lProcessEntry32);
      while (lContinueLoop) and (lCloseProc) and (lCountLoop <= 100000) do
      begin
        Inc(lCountLoop);
        // verifica com e sem extensão, para garantir
        if (UpperCase(ExtractFileName(lProcessEntry32.szExeFile)) = UpperCase(pExeName))
        or (UpperCase(lProcessEntry32.szExeFile) = UpperCase(pExeName)) then
        begin
          lCloseProc := lFuncValidacao(lProcessEntry32.th32ProcessID);
          Result := True;
        end;

        lContinueLoop := Process32Next(lSnapshotHandle, lProcessEntry32);
      end;

      if lCountLoop > 100000 then
      begin
        raise Exception.Create('CountLoop excedido.');
      end;

    finally
      CloseHandle(lSnapshotHandle);
    end;
  end;

  procedure WaitProcessTerminate;
  var
    lCounterLoop: Integer;
    lFouded: Boolean;
    lFunc: TFunProcess;
  begin
    lCounterLoop := 0;

    lFunc :=
        function(pID: Cardinal): Boolean
        begin
          Result := True;
        end;

    repeat
      Inc(lCounterLoop);
      Sleep(50); // 40 * 50 >> 2.000 ms

      lFouded := LoopProcess(lFunc);
    until ((not lFouded) and (lCounterLoop < 40));
  end;

begin
  lCloseProc := False;

  lFuncClose :=
    function(pID: Cardinal) : Boolean
    begin
      Result :=
        TerminateProcess(
          OpenProcess(PROCESS_TERMINATE, BOOL(0), pID),
        0);
    end;

  LoopProcess(lFuncClose);

  if lCloseProc then
  begin
    WaitProcessTerminate;
  end;
end;

class procedure TDebugRemoto.RemoveArquivos;

  procedure VerificaArquivo(const pFileName: string);
  begin
    if TFile.Exists(pFileName) then
    begin
      try
        TFile.Delete(pFileName);
      except
        // Never, jamais, fazer isso, fora o ponto(?) em que a exceção não importa.
      end;
    end;
  end;

begin
  KillTask(RMTDBG240);
  VerificaArquivo(RMTDBG240);

  VerificaArquivo(BORDBK240);
  VerificaArquivo(BORDBK240N);
  VerificaArquivo(BCCIDE);
  VerificaArquivo(COMP32X);
  VerificaArquivo(DCC32240);
end;

initialization
   TDebugRemoto.Ativar;

finalization

end.
