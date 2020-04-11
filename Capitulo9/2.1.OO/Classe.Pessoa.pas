unit Classe.Pessoa;

interface

uses
  System.SysUtils, System.DateUtils, System.Generics.Collections;

type
  TPessoa = class//(TObject)
  private
    FNome: string;
    FID: Integer;
    FCodigo: Integer;
    FCPF: string;
    FDataNascimento: TDateTime;
    FRenda: Currency;
  public
    constructor Create(pRadom: Boolean = False);
    procedure GeraValoresRandom;
    function ToString(pSeparador: string{ = '='}): string; reintroduce; overload;
    function ToString: string; overload; override;
    property Nome: string read FNome write FNome;
    property ID: Integer read FID write FID;
    property Codigo: Integer read FCodigo write FCodigo;
    property CPF: string read FCPF write FCPF;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Renda: Currency read FRenda write FRenda;
  end;

  TListaPessoa = class(TObjectList<TPessoa>);
//  TListaPessoa = class(TList<TPessoa>);

implementation



{ TPessoa }

function TPessoa.ToString(pSeparador: string): string;
begin
  Result :=
    'ID' + pSeparador + Self.ID.ToString + sLineBreak +
    'Código' + pSeparador + Self.Codigo.ToString + sLineBreak +
    'Nome' + pSeparador + Self.Nome + sLineBreak +
    'Data nascimento' + pSeparador + DateToStr(Self.DataNascimento) + sLineBreak +
    'Renda' + pSeparador + FormatCurr('##0.,00', Self.Renda) + sLineBreak +
    'CPF' + pSeparador + Self.CPF;
end;

constructor TPessoa.Create;
begin
  if pRadom then
    GeraValoresRandom;
end;

procedure TPessoa.GeraValoresRandom;
begin
  Self.Nome := 'Teste';
  Self.ID := Random(1000000);
  Self.Codigo := Random(1000000);
  Self.DataNascimento := IncYear(Now, - 27);
  Self.Renda := Random(10000) + 1047;
  Self.CPF := '00011122285';
end;

function TPessoa.ToString: string;
begin
  Result := Self.ToString('=');
end;

end.
