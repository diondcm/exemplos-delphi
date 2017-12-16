unit Classe.Tratamento.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, Dialogs;

  procedure LibExit(Reason: Integer);

implementation

var
  lDllOriginalProc: TDLLProc;

procedure LibExit(Reason: Integer);
begin
  if Reason = DLL_PROCESS_DETACH then
  begin
    ShowMessage('Process Detach');
  end;

  lDllOriginalProc(Reason);
end;

initialization
  lDllOriginalProc := DllProc;
  DllProc := @LibExit;

end.
