unit Classe.Valor.Maximo;

interface

uses
  System.Math;

var
  VarGlobal: Integer;

type
  TValorMaximo = class
  class var
    valorClasse: Integer;

    class function GetMaximo(pValorA, pValorB: Integer): Integer;
  end;

  function ValorMaximo(pValorA, pValorB: Integer): Integer; stdcall;
  function getValorClasse: Integer; stdcall;
  procedure setValorClasse(pValor: Integer); stdcall;

  function getValorGlobal: Integer; stdcall;
  procedure setValorGlobal(pValor: Integer); stdcall;

exports
  ValorMaximo,
  getValorClasse,
  setValorClasse,
  getValorGlobal,
  setValorGlobal;

implementation

function getValorClasse: Integer;
begin
  Result := TValorMaximo.valorClasse;
end;

procedure setValorClasse(pValor: Integer);
begin
  TValorMaximo.valorClasse := pValor;
end;

function getValorGlobal: Integer;
begin
  Result := VarGlobal;
end;

procedure setValorGlobal(pValor: Integer);
begin
  VarGlobal := pValor;
end;

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
