unit Classe.Processa.Texto;

interface

uses
  System.Classes, System.SysUtils;

type
  TProcessaTexto = class
    function MetadeDoTexto(pTexto: string): string;
  end;


implementation

{ TProcessaTexto }

function TProcessaTexto.MetadeDoTexto(pTexto: string): string;
begin
  Result := Copy(pTexto, 1, pTexto.Length div 2);
  Result := UpperCase(Result[1]) + Copy(Result, 2, Result.Length -1);
end;

end.
