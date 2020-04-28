unit Classe.Log.Server;

interface

uses
  System.SyncObjs, System.SysUtils, System.Classes;

type
  TLogServer = class
  private
    const
      ARQ_LOG = 'C:\temp\log.txt';
    class var
      FCriticalSec: TCriticalSection;
  public
    class constructor Create;
    class destructor Destroy;
    class procedure GravaLog(pTexto: string);
  end;

implementation

{ TLogServer }

class constructor TLogServer.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TLogServer.Destroy;
begin
  FCriticalSec.Free;
end;

class procedure TLogServer.GravaLog(pTexto: string);
begin
  FCriticalSec.Acquire;
  try
    var lStl: TStringList := TStringList.Create; // pode ser utilizado TextFile para arquivos de log maiores
    try
      if FileExists(ARQ_LOG) then
      begin
        lStl.LoadFromFile(ARQ_LOG);
      end;

      lStl.Add(DateTimeToStr(Now) + ' - ' + pTexto);
      lStl.SaveToFile(ARQ_LOG);
    finally
      lStl.Free;
    end;
  finally
    FCriticalSec.Leave;
  end;
end;

end.
