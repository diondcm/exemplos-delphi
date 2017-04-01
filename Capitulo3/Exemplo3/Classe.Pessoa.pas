unit Classe.Pessoa;

interface

uses
  System.SysUtils;

type
  TStatusComercialPessoa = (ClienteAtivo, ExCliente, NaoContatado, Devendo);
  // TStatusComercialPessoa = (scpClienteAtivo, scpExCliente, scpNaoContatado, scpDevendo);

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
    FStatusComercial: TStatusComercialPessoa;
  public const
    CLIENTE_ATIVO = 'Cliente Ativo';
    EX_CLIENTE = 'Ex CLiente';
    NAO_CONTATADO = 'Não Contatado';
    DEVENDO = 'Devendo';
  public
    function ExibePessoa: string;
    function StatusComecialToString(pStatus: TStatusComercialPessoa): string;
    function StringToStatusComercial(pStatus: string): TStatusComercialPessoa;

    // propf
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property StatusComercial: TStatusComercialPessoa read FStatusComercial write FStatusComercial;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FCNPJ: string;
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataFundacao: TDate;
  public
    function ExibePessoa: string;

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
    'Data Nascimento:' + DateToStr(FDataNascimento) + sLineBreak +
    'Status Comercial: ' + StatusComecialToString(FStatusComercial);
end;

{ TPessoaJuridica }

function TPessoaJuridica.ExibePessoa: string;
begin
  Result :=
    'CNPJ: ' + FCNPJ + sLineBreak +
    'Nome Fantasia: ' + FNomeFantasia + sLineBreak +
    'Razão social: ' + FRazaoSocial + sLineBreak +
    'Data fundação: ' + DateToStr(FDataFundacao);
end;

function TPessoaFisica.StatusComecialToString(
  pStatus: TStatusComercialPessoa): string;
begin
//  if pStatus = ClienteAtivo then
//    Result := 'Cliente Ativo';

  case pStatus of
    ClienteAtivo: Result := CLIENTE_ATIVO;
    ExCliente: Result := EX_CLIENTE;
    NaoContatado: Result := NAO_CONTATADO;
    Devendo: Result := DEVENDO;
  end;
end;

function TPessoaFisica.StringToStatusComercial(
  pStatus: string): TStatusComercialPessoa;
begin
  if pStatus = CLIENTE_ATIVO then
    Result := ClienteAtivo;

  if pStatus = EX_CLIENTE then
    Result := ExCliente;

  if pStatus = NAO_CONTATADO then
    Result := NaoContatado;

  if pStatus = DEVENDO then
    Result := Devendo;
end;

end.
