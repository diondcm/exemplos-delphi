program ExemplosETipos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.ConversorMoeda in 'Classe.ConversorMoeda.pas';

//  function RealParaDolar(pValor: Currency): Currency;
//  begin
//    Result := pValor / 3.46;
//  end;
//
//  function DolarParaReal(pValor: Currency): Currency;
//  begin
//    Result := pValor * 3.46;
//  end;

var
  lValor: string;
  lDolarParaReal: Boolean;
begin
  try
    Writeln('Conversor de Moedas Power');
    Writeln(sLineBreak);
    Writeln('Informe D para dolar e R para real:');
    Readln(lValor);
    lDolarParaReal :=  Pos('D', lValor) > 0;
    Writeln('Informe um valor:');
    Readln(lValor);

    if lValor <> '' then
    begin
      if lDolarParaReal then
      begin
//        lValor := FloatToStr(DolarParaReal(StrToFloat(lValor)));
        lValor := TConversorMoeda.DolarParaReal(lValor);
        Writeln('');
        Writeln('Valor de ' + lValor + ' Reais');
      end else begin
//        lValor := FloatToStr(RealParaDolar(StrToFloat(lValor)));
        lValor := TConversorMoeda.RealParaDolar(lValor);
        Writeln('');
        Writeln('Valor de ' + lValor + ' Dolares');
      end;
    end else begin
      Writeln('Valor inválido');
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
