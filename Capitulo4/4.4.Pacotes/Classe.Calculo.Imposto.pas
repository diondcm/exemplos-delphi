unit Classe.Calculo.Imposto;

interface

type
  TCalculaImposto = class
  const
    RS = 0;
    BH = 1;
    SP = 2;
  public
    class function ICMS(pValorBase: Currency; pEstado: Integer): Currency;
  end;

  function CalculaICMS(pValorBase: Currency; pEstado: Integer): Currency;

exports
  CalculaICMS;

implementation


function CalculaICMS(pValorBase: Currency; pEstado: Integer): Currency;
begin
  Result := TCalculaImposto.ICMS(pValorBase, pEstado);
end;

{ TCalculaImposto }

class function TCalculaImposto.ICMS(pValorBase: Currency; pEstado: Integer): Currency;
begin
  case pEstado of
    RS: Result := pValorBase * 0.18;
    BH: Result := pValorBase * 0.11;
    SP: Result := pValorBase * 0.17;
  end;
end;

end.
