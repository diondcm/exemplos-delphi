unit Classe.Converte.Unidades;

interface

uses ClientModuleUnit1;

type
  TConversor = class
    class function GetValorDolar: Currency;
    class function RealParaDolar(pValor: Currency): Currency;
    class function DolarParaReal(pValor: Currency): Currency;

    class function RealParaDolarStr(pValor: string): string;
    class function DolarParaRealStr(pValor: string): string;

    // Shift + Ctrl + C
  end;

//function ConverteRealParaDolar(pValor: Currency): Currency;
//function COnverteDolarParaReal(pValor: Currency): Currency;

implementation

uses
  System.SysUtils;

// Modelo procedural > evitar utilizar >> preferir class functions
//function ConverteRealParaDolar(pValor: Currency): Currency;
//begin
//  Result := pValor * 3.5;
//end;

{ TConversor }

class function TConversor.DolarParaReal(pValor: Currency): Currency;
begin
  Result := pValor * GetValorDolar;
end;

class function TConversor.RealParaDolar(pValor: Currency): Currency;
begin
  Result := pValor / GetValorDolar;
end;

class function TConversor.DolarParaRealStr(pValor: string): string;
var
  lValorCurr: Currency;
begin
  lValorCurr := StrToCurr(pValor);
  lValorCurr := TConversor.DolarParaReal(lValorCurr);
  Result := CurrToStr(lValorCurr);
end;

class function TConversor.GetValorDolar: Currency;
begin
  Result := ClientModule1.ServerMethods1Client.GetValorDolarAtual;
end;

class function TConversor.RealParaDolarStr(pValor: string): string;
var
  lValor: Currency;
begin
  lValor := StrToCurr(pValor); // Shift + Ctrl + A
  lValor := TConversor.RealParaDolar(lValor);
  Result := CurrToStr(lValor);

//  RealParaDolarStr := Result; // Evitar
end;

end.
