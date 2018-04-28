unit Classe.ConversorMoeda;

interface

uses
  System.SysUtils;

type
  TConversorMoeda = class//(TObject) // TObject
  private

    class function ConverteStrToCurr(const pValor: string): Currency;
  public
    // Shift + Ctrl + C
    class function RealParaDolar(const pValor: Currency): Currency; overload;
    class function DolarParaReal(const pValor: Currency): Currency; overload;

    class function RealParaDolar(const pValor: string): string; overload;
    class function DolarParaReal(const pValor: string): string; overload;
  end;

  function RealParaDolar(pValor: Currency): Currency;
  function DolarParaReal(pValor: Currency): Currency;

implementation

function RealParaDolar(pValor: Currency): Currency;
begin
  Result := pValor / 3.46;
end;

function DolarParaReal(pValor: Currency): Currency;
begin
  Result := pValor * 3.46;
end;

{ TConversorMoeda }

class function TConversorMoeda.DolarParaReal(const pValor: Currency): Currency;
begin
  Result := Classe.ConversorMoeda.DolarParaReal(pValor);
end;

class function TConversorMoeda.RealParaDolar(const pValor: Currency): Currency;
begin
  Result := Classe.ConversorMoeda.RealParaDolar(pValor);
end;

class function TConversorMoeda.ConverteStrToCurr(const pValor: string): Currency;
begin
//  StrToCurrDef(pValor, -1)
//  ConverteStrToCurr := -1;
  if not TryStrToCurr(pValor, Result) then
  begin
    Result := -1;
  end;
end;

class function TConversorMoeda.DolarParaReal(const pValor: string): string;
var
  lValorCurr: Currency;
begin
  lValorCurr := ConverteStrToCurr(pValor);
  if (lValorCurr = -1) then
  begin
    Exit('Valor "'+ pValor + '" inválido');
  end;

  Result := CurrToStr(TConversorMoeda.DolarParaReal(lValorCurr));
end;

class function TConversorMoeda.RealParaDolar(const pValor: string): string;
var
  lValorCurr: Currency;
begin
  lValorCurr := ConverteStrToCurr(pValor);
  if (lValorCurr = -1) then
  begin
    Result := 'Valor "'+ pValor + '" inválido';
  end else begin
    Result := CurrToStr(TConversorMoeda.RealParaDolar(lValorCurr));
  end;
end;

end.
