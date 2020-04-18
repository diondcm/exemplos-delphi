unit Classe.Performance;

interface

uses System.Generics.Collections, WinApi.Windows, System.DateUtils, System.SysUtils;

type
  TRegistroTempo = record
  private
    FTempoIni: Int64;
    FDecorrido: TTime;
  public
    constructor Create(pTempoIni: Int64; pDecorrido: TTime);
    property TempoIni: Int64 read FTempoIni write FTempoIni;
    property Decorrido: TTime read FDecorrido write FDecorrido;
  end;

  TTempos = class(TDictionary<string, TRegistroTempo>);

  TPerformance = class
  class var
    FUltimoIdentificador: string;
    FCounterFreq: Int64;
    FTempos: TTempos;
  public
    class constructor Create;
    class destructor Destroy;
    class procedure RegistraPeriodo(pIdentificador: string);
    class function Tempos(pLimpar: Boolean = True): string;
  end;

implementation

{ TPerformance }

class constructor TPerformance.Create;
begin
  TPerformance.FTempos := TTempos.Create;
  QueryPerformanceFrequency(TPerformance.FCounterFreq);
end;

class destructor TPerformance.Destroy;
begin
  TPerformance.FTempos.Free;
end;

class procedure TPerformance.RegistraPeriodo(pIdentificador: string);
var
  lContador: Int64;
  lTime: TTime;
begin
  QueryPerformanceCounter(lContador);
  if FUltimoIdentificador <> '' then
  begin
    lTime := IncMilliSecond(0, (MSecsPerSec * (lContador - FTempos[FUltimoIdentificador].FTempoIni)) div TPerformance.FCounterFreq);
    FTempos[FUltimoIdentificador] := TRegistroTempo.Create(FTempos[FUltimoIdentificador].FTempoIni, lTime);
  end;

  FTempos.Add(pIdentificador, TRegistroTempo.Create(lContador, 0));
  FUltimoIdentificador := pIdentificador;
end;

class function TPerformance.Tempos(pLimpar: Boolean): string;
var
  lPair: TPair<string, TRegistroTempo>;
  lContFinal: Int64;
  lTime: TTime;
begin
  QueryPerformanceCounter(lContFinal);

  for lPair in FTempos do
  begin
    lTime := IncMilliSecond(0, (MSecsPerSec * (lContFinal - lPair.Value.FTempoIni)) div TPerformance.FCounterFreq);
    Result := Result + lPair.Key + ' - ' +  FormatDateTime('HH:MM:SS.ZZZ', lPair.Value.Decorrido) + '  -- ' + FormatDateTime('HH:MM:SS.ZZZ', lTime) + sLineBreak;
  end;

  if pLimpar then
  begin
    FTempos.Clear;
    FUltimoIdentificador := '';
  end;
end;


{ TRegistroTempo }

constructor TRegistroTempo.Create(pTempoIni: Int64; pDecorrido: TTime);
begin
  Self.FTempoIni := pTempoIni;
  Self.FDecorrido := pDecorrido;
end;

end.
