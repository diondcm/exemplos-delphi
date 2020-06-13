unit Classe.Gera.Hash;

interface

uses Form.Visualiza.Hash;

  function GeraHashArquivo(pNomeArq: PChar): PChar; // Dephi >> PWideChar
  function GetDLLVersion: Integer;

  function GetTokenExecucao: Integer;
  procedure SetTokenExecucao(pVal: Integer);

  procedure VisualizaHash(pHash: PChar);

var
  TokenExecucao: Integer;

exports
  GetTokenExecucao,
  SetTokenExecucao,
  GeraHashArquivo,
  VisualizaHash,
  GetDLLVersion;

implementation

uses System.Hash, System.SysUtils;

procedure VisualizaHash(pHash: PChar);
begin
  TfrmVisualizaHash.Executa(pHash);
end;

function GetTokenExecucao: Integer;
begin
  Result := TokenExecucao;
end;

procedure SetTokenExecucao(pVal: Integer);
begin
  TokenExecucao := pVal;
end;

function GeraHashArquivo(pNomeArq: PChar): PChar;
begin
  Result := PChar(THashSHA1.GetHashStringFromFile(string(pNomeArq)));
end;

function GetDLLVersion: Integer;
begin
  Result := 123456;
end;

end.
