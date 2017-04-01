unit Classe.Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FID: Integer;
  public
    property ID: Integer read FID write FID;
  end;

  TPessoaFisica = class(TPessoa)
  private
    FNome: string;
    FCPF: string;
    FDataNascimento: TDate;
  public
    function ExibePessoa: string;

    // propf
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FCNPJ: string;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataFundacao: TDate;
  public
    property CNPJ: string read FCNPJ write FCNPJ;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property DataFundacao: TDate read FDataFundacao write FDataFundacao;
  end;


implementation

{ TPessoa }

function TPessoaFisica.ExibePessoa: string;
begin
  Result :=
    'ID: ' + FID.ToString + sLineBreak + // #13#10
    'Nome: ' + FNome + sLineBreak +
    'CPF: ' + FCPF + sLineBreak +
    'Data Nascimento:' + DateToStr(FDataNascimento);
end;

end.
