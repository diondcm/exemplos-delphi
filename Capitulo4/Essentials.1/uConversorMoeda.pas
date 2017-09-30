unit uConversorMoeda;

interface // Declaração

uses
  System.SysUtils;

//uses System.SysUtils;

type
  TConversorMoeda = class /// Shift Tab >> D7: Shift + Ctrl + I - U
  const
     VALOR_COTACAO_REAL = 3.15;

  ///  Sift + Ctrl + C
    class function RealParaDolar(pValorReal: Currency): Currency; overload;
    class function RealParaDolar(pValorReal: string): string; overload;

    class function DolarParaReal(pValorDolar: Currency): Currency; overload;
    class function DolarParaReal(pValorDolar: string): string; overload;
  end;


//function ConverteRealParaDolar(pValorReal: Currency): Currency;
//function ConverteDolarParaReal(pValorDolar: Currency): Currency;

implementation // Código

function ConverteRealParaDolar(pValorReal: Currency): Currency;
begin
  Result := pValorReal / TConversorMoeda.VALOR_COTACAO_REAL;
end;

function ConverteDolarParaReal(pValorDolar: Currency): Currency;
begin
  Result := pValorDolar * TConversorMoeda.VALOR_COTACAO_REAL;
end;


{ TConversor }

class function TConversorMoeda.DolarParaReal(pValorDolar: Currency): Currency;
begin
  Result := ConverteDolarParaReal(pValorDolar);
end;

class function TConversorMoeda.RealParaDolar(pValorReal: Currency): Currency;
begin
  Result := ConverteRealParaDolar(pValorReal);
end;

class function TConversorMoeda.DolarParaReal(pValorDolar: string): string;
begin
  try
    Result := FloatToStr(TConversorMoeda.DolarParaReal(StrToFloat(pValorDolar)));
  except
    on E: Exception do // EConvertError
    begin
      raise Exception.Create('Valor "' + pValorDolar +'" inválido para a conversão.' + sLineBreak + sLineBreak +
        'Erro Técnico:' + E.Message);
    end;
  end;
end;

class function TConversorMoeda.RealParaDolar(pValorReal: string): string;
begin
  try
    Result := FloatToStr(TConversorMoeda.RealParaDolar(StrToFloat(pValorReal)));
  except
    on E: Exception do // EConvertError
    begin
      raise Exception.Create('Valor "' + pValorReal +'" inválido para a conversão.' + sLineBreak + sLineBreak +
        'Erro Técnico:' + E.Message);
    end;
  end;
end;

end.
