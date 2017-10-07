unit Classe.Produto;

interface

uses
  System.Generics.Collections;

type
  TProduto = class
  private
    FID: Integer;
    FDescricao: string;
    FValor: Currency;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Valor: Currency read FValor write FValor;
  end;

  TListaProduto = class(TList<TProduto>)
  end;

implementation

end.
