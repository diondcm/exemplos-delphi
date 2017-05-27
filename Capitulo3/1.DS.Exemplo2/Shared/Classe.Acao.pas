unit Classe.Acao;

interface

type
  TAcao = class
  private
    FAbreviatura: string;
    FValor: Currency;
    FQuantidade: Integer;
  public
    property Abreviatura: string read FAbreviatura write FAbreviatura;
    property Valor: Currency read FValor write FValor;
    property Quantidade: Integer read FQuantidade write FQuantidade;
  end;

implementation

end.
