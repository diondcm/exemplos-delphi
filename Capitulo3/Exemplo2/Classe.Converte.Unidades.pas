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
  try
    Result := ClientModule1.ServerMethods1Client.GetValorDolarAtual;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao converter valor: ' + E.Message);
    end;
  end;
end;

class function TConversor.RealParaDolarStr(pValor: string): string;
var
  lValor: Currency;
begin
  //lValor := StrToCurr(pValor); // Gera erro em conversão inválida
  // lValor := StrToCurrDef(pValor, 0 { -1 }); // não gera erro


  if not TryStrToCurr(pValor, lValor) {= False - feio} then // retorna false caso não consiga
  begin
    //      5,6 >> não vai cair
    if (Pos(',', pValor) > 0) and (Pos('.', pValor) > 0) then
    begin
      if Pos(',', pValor) > Pos('.', pValor) then
      begin //  1.200,5 >> removo o ponto
        pValor := StringReplace(pValor, '.', '', [rfReplaceAll]); //1.000.000,3
        lValor := StrToCurr(pValor);
      end else if Pos('.', pValor) > Pos(',', pValor) then
      begin //  2,300.9 >>
        pValor := StringReplace(pValor, ',', '', [rfReplaceAll]);
        pValor := StringReplace(pValor, '.', ',', [rfReplaceAll]);
        lValor := StrToCurr(pValor);
      end;
    end else if (Pos('.', pValor) > 0) then
    begin
      pValor := StringReplace(pValor, '.', ',', [rfReplaceAll]);
      lValor := StrToCurr(pValor);
    end else begin
      // todo: melhorar exception
      raise Exception.Create('Valor inválido!');
    end;


    //     21.6 >> altera para ','

  end;




  lValor := TConversor.RealParaDolar(lValor);


  Result := CurrToStr(lValor);

//  RealParaDolarStr := Result; // Evitar


// Shift + Ctrl + A >> uses do Delphi
end;

end.
