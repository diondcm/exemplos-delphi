unit Classe.Converte.Unidades;

interface

function ConverteRealParaDolar(pValor: Currency): Currency;

implementation

function ConverteRealParaDolar(pValor: Currency): Currency;
begin
  Result := pValor * 3.5;
end;

end.
