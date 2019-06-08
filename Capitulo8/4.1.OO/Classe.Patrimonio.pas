unit Classe.Patrimonio;

interface

uses
  System.Generics.Collections;

type
  IPatrimonio = interface(IInterface)
  ['{8B0DF087-4A27-498D-B731-25EE77398C17}']
    function GetValorCompra: Currency;
    function GetDataCompra: TDateTime;
    function GetDataDepreciacao: TDateTime;
  end;

  TListaPatrimonio = class(TList<IPatrimonio>)
    function GetValorTotal: Currency;
  end;

implementation

{ TListaPatrimonio }

function TListaPatrimonio.GetValorTotal: Currency;
var
  lPatrimonio: IPatrimonio;
begin
  Result := 0;
  for lPatrimonio in Self do
  begin
    Result := Result + lPatrimonio.GetValorCompra;
  end;
end;

end.
