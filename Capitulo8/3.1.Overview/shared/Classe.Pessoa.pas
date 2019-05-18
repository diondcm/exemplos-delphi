unit Classe.Pessoa;

interface

type
  TPessoa = class
  strict private
    FNome: string;
    FID: Integer;
    FDataNascimento: TDateTime;
    FCredito: Currency;
  protected
    function GetNome: string;
    property NomeNaoSerealizadoEmJson: string read GetNome;
  public
    property Nome: string read FNome write FNome;
    property ID: Integer read FID write FID;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Credito: Currency read FCredito write FCredito;
  end;

implementation

{ TPessoa }

function TPessoa.GetNome: string;
begin
  Result := '';
end;

end.
