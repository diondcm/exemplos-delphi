unit Classe.Valor.Maximo;

interface

uses
  System.Math;


type
  TValorMaximo = class
    class function GetMaximo(pValorA, pValorB: Integer): Integer;
  end;


  function ValorMaximo(pValorA, pValorB: Integer): Integer; stdcall;


exports
  ValorMaximo;


implementation

function ValorMaximo(pValorA, pValorB: Integer): Integer;
begin
  Result := TValorMaximo.GetMaximo(pValorA, pValorB);
end;


{ TValorMaximo }

class function TValorMaximo.GetMaximo(pValorA, pValorB: Integer): Integer;
begin
  Result := Max(pValorA, pValorB);
end;

end.
