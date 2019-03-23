unit Classe.Conversor;

interface

uses ClientModuleUnit1, System.SysUtils;

// Modelo OOP
type
  TConversor = class
  public
    const
      VALOR_INVALIDO = '-1';
  public
    class function DolarParaReal(pValorDolar: string): string; overload;
    class function DolarParaReal(pValorDolar: Currency): Currency; overload;
    class function RealParaDolar(pValorReal: Currency): Currency; overload;
    class function RealParaDolar(pValorReal: string): string; overload;
  end;

  //Modelo procedural
  function DolarParaReal(pValorDolar: Currency): Currency;



implementation

function DolarParaReal(pValorDolar: Currency): Currency;
begin
  Result := pValorDolar * ClientModule1.ServerMethods1Client.GetCotacao;
end;


{ TConversor }

class function TConversor.DolarParaReal(pValorDolar: Currency): Currency;
begin
  Result := pValorDolar * ClientModule1.ServerMethods1Client.GetCotacao;
end;

class function TConversor.RealParaDolar(pValorReal: string): string;
var
  lValor: Extended;
begin
  lValor := StrToFloatDef(pValorReal, -1);
  if lValor <> -1 then
  begin
    Result := FormatFloat('0.,00', TConversor.RealParaDolar(lValor));
  end else begin
    Result := '-1';
  end;
end;

class function TConversor.DolarParaReal(pValorDolar: string): string;
begin
  Result := FormatFloat('0.,00', TConversor.DolarParaReal(StrToFloat(pValorDolar)));
end;

class function TConversor.RealParaDolar(pValorReal: Currency): Currency;
begin
  Result := pValorReal / ClientModule1.ServerMethods1Client.GetCotacao;
end;

end.
