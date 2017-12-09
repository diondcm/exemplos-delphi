unit Classe.Pessoa.Juridica;

interface

uses
  Classes.Pessoa;

type
  TPessoaJuridica = class(TPessoa)
  private
    FCNPJ: string;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataFundacao: TDate;
  public
    function ToString: string; override;
    property CNPJ: string read FCNPJ write FCNPJ;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property DataFundacao: TDate read FDataFundacao write FDataFundacao;
  end;

implementation

{ TPessoaJuridica }

function TPessoaJuridica.ToString: string;
begin
  Result := inherited;
  Result := Result + sLineBreak + 'CNPJ: ' + FCNPJ;
end;

end.
