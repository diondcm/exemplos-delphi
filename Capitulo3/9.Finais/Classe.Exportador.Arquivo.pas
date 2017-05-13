unit Classe.Exportador.Arquivo;

interface

uses Classe.Atributo.Campo;

type
  ///  <summary>
  ///    Classe para Header de CNAB 240
  ///  </summary>

  THeader = class
  public type
    TTeste = class
    end;
  private
  var
    FIdentificador: string;
    FCodEmpresa: Integer;
    FCodBanco: Integer;
    FCodAgencia: Integer;
    FCodConta: Integer;
    FNomeEmpresa: string;
  public
    function TotalArquivo: Currency;


    [TAtributoCampo(0, 1, TAlinhamentoCampo.Direita, TAtributoCampo.CARACTERE_ESPACO)]
    property Identificador: string read FIdentificador write FIdentificador;

    [TAtributoCampo(1, 10, TAlinhamentoCampo.Direita, TAtributoCampo.CARACTERE_ZERO)]
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;

    [TAtributoCampo(2, 40, TAlinhamentoCampo.Esquerda, TAtributoCampo.CARACTERE_ESPACO)]
    property NomeEmpresa: string read FNomeEmpresa write FNomeEmpresa;

    [TAtributoCampo(3, 3, TAlinhamentoCampo.Direita, TAtributoCampo.CARACTERE_ESPACO)]
    property CodBanco: Integer read FCodBanco write FCodBanco;

    [TAtributoCampo(4, 10, TAlinhamentoCampo.Direita, TAtributoCampo.CARACTERE_ESPACO)]
    property CodAgencia: Integer read FCodAgencia write FCodAgencia;

    [TAtributoCampo(5, 10, TAlinhamentoCampo.Direita,
      TAtributoCampo.CARACTERE_ESPACO)]
    property CodConta: Integer read FCodConta write FCodConta;
  end;

implementation

function THeader.TotalArquivo: Currency;
begin
end;

end.
