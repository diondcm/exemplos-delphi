program ConversorUnidades;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ConverteValores in 'ConverteValores.pas',
  Classe.Converte.Unidades in '..\Classe.Converte.Unidades.pas';


var
  lTexto: string;
  lValorReal: Currency;
  lValorDolar: Currency;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Writeln('Exemplo de conversor.');
    Writeln('Digite um valor em reais:');
    Readln(lTexto);
    lValorReal := StrToCurr(lTexto);
    lValorDolar := ConverteRealParaDolar(lValorReal);
    Writeln('Valor Informado em Dollar: ' + CurrToStr(lValorDolar));

//    Writeln('Digite um valor em reais:');
//    Readln(lTexto);
//    lValorReal := StrToCurr(lTexto);
//    lValorDolar := lValorReal * 3.7;
//    Writeln('Valor Informado em Dollar: ' + CurrToStr(lValorDolar));

    Readln(lTexto);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
