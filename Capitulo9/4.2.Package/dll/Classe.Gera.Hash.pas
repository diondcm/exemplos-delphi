unit Classe.Gera.Hash;

interface

  function GeraHashArquivo(pNomeArq: PChar): PChar; // Dephi >> PWideChar

  function GetDLLVersion: Integer;


exports
  GeraHashArquivo,
  GetDLLVersion;

implementation

uses System.Hash, System.SysUtils;

function GeraHashArquivo(pNomeArq: PChar): PChar;
begin
  Result := PChar(THashSHA1.GetHashStringFromFile(string(pNomeArq)));
end;

function GetDLLVersion: Integer;
begin
  Result := 123456;
end;

end.
