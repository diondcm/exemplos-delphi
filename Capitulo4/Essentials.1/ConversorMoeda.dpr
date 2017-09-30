program ConversorMoeda;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uConversorMoeda in 'uConversorMoeda.pas';

var
  lValor: string;
  lValorReal: Currency;
  lValorResultado: Currency;
begin
  try
    Writeln('Valor da Cotação: ' + FloatToStr(TConversorMoeda.VALOR_COTACAO_REAL));
    Writeln('Informe um valor em Reais:');
    Readln(lValor);
    lValor.ToInteger; // Alt + Seta para cima

    lValorReal := StrtoFloat(lValor);

    lValorResultado := TConversorMoeda.RealParaDolar(lValorReal);
//    lValorResultado := ConverteRealParaDolar(lValorReal);


//    lValorResultado := lValorReal / 3.15; >> Espalha a regra pelo código >> evitar

    Writeln('Valor em reais: ' + lValor);
    Writeln('Valor em Dolar: ' + FloatToStr(lValorResultado));

    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln(lValor);
end.
