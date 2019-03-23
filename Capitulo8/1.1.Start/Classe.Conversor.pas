unit Classe.Conversor;

interface

uses ClientModuleUnit1, System.SysUtils;

// Modelo OOP
type
  TConversor = class
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
begin
  Result := FormatFloat('0.,00', TConversor.RealParaDolar(StrToFloat(pValorReal)));
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
