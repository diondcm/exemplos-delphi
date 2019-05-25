unit SMGeral;
{ Fake }

interface

uses Classe.Pessoa;

type
  TArrayPessoa = TArray<TPessoa>;

  TListaPessoa = class
  private
    FPessoas: TArrayPessoa;
  public
    property Pessoas: TArrayPessoa read FPessoas write FPessoas;
  end;


implementation

end.
