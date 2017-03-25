program ConversorUnidades;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ConverteValores in 'ConverteValores.pas',
  Classe.Converte.Unidades in '..\Classe.Converte.Unidades.pas',
  ClientClassesUnit1 in '..\ClientClassesUnit1.pas',
  ClientModuleUnit1 in '..\ClientModuleUnit1.pas' {ClientModule1: TDataModule};

var
  lTexto: string;
  lValorReal: Currency;
  lValorDolar: Currency;
begin
  ClientModule1 := TClientModule1.Create(nil);

  try
    { TODO -oUser -cConsole Main : Insert code here }

    Writeln('Exemplo de conversor.');
    Writeln('Digite um valor em reais:');
    Readln(lTexto);
    Writeln('Valor em Dollar: ' + TConversor.RealParaDolarStr(lTexto));

    // histórico:
    // lValorDolar := ConveteRealParaDolar(lValorReal);

    // passado esquecido
//    lValorReal := StrToCurr(lTexto);
//    lValorDolar := TConversor.RealParaDolar(lValorReal);
//    lTexto := CurrToStr(lValorDolar);
//
//    Writeln('Valor Informado em Dollar: ' + lTexto);


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln(lTexto);
end.
