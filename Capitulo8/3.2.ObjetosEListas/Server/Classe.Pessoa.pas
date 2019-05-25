unit Classe.Pessoa;

interface

type
  TPessoa = class
  private
    FID: Integer;
    FNome: string;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
  end;

//  TArrayPessoa = TArray<TPessoa>;
//
//  TListaPessoa = class
//  private
//    FPessoas: TArrayPessoa;
//  public
//    procedure Add(pPessoa: TPessoa);
//    property Pessoas: TArrayPessoa read FPessoas write FPessoas;
//  end;


implementation


end.
