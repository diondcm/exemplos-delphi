unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Math.Vectors, FMX.Edit, FMX.Layouts, FMX.Controls3D, FMX.Layers3D, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  FMX.StdCtrls;

type
  ///  Pessoa Física perde(abate/diminui) + 10 % do lime na compras
  ///  E Juridica perde + 5%
  TEndereco = class
  private
    FLogradouro: string;
    FNumero: string;
    FBairro: string;
    FCidade: string;
    FEstado: string;
  public
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
  end;

  TPessoa = class
  private
    FEndereco: TEndereco;
    FEmail: string;
    FTelefonePrincipal: string;
    FDataCadastro: TDateTime;
    FLimiteCredito: Currency;
    FSaldo: Currency;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure EnviaEmail(pAssunto, pTexto: string); // esse não é sobre escrito nos filhos
    procedure ComputaFatura(pValorCompra: Currency); virtual; // abstract

    property Endereco: TEndereco read FEndereco write FEndereco;
    property Email: string read FEmail write FEmail;
    property TelefonePrincipal: string read FTelefonePrincipal write FTelefonePrincipal;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    property LimiteCredito: Currency read FLimiteCredito write FLimiteCredito;
    property Saldo: Currency read FSaldo write FSaldo;
  end;

  TPessoaFisica = class(TPessoa)
  private
    FNome: string;
    FDataNascimento: TDate;
  public
    procedure ComputaFatura(pValorCompra: Currency); override;

    property Nome: string read FNome write FNome;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FNomeFantasia: string;
    FRazaoSocial: string;
    FDataFundacao: TDate;
  public
    procedure ComputaFatura(pValorCompra: Currency); override;

    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property DataFundacao: TDate read FDataFundacao write FDataFundacao;
  end;


  TfrmPrincipal = class(TForm)
    MemoLog: TMemo;
    Layout1: TLayout;
    EditNome: TEdit;
    ButtonAddPessoa: TButton;
    Switch1: TSwitch;
    Label1: TLabel;
    procedure ButtonAddPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.ButtonAddPessoaClick(Sender: TObject);
var
  lPessoa: TPessoa;
  lValorCompra: Integer;
  lValorLimiteAntesCompra: Currency;
begin
  if Switch1.IsChecked then
  begin
    lPessoa := TPessoaJuridica.Create;
    (lPessoa as TPessoaJuridica).RazaoSocial := EditNome.Text;
//  TPessoaJuridica(lPessoa).RazaoSocial := EditNome.Text; // igual ao anterior - menos "safe"

  end else begin
    lPessoa := TPessoaFisica.Create;
    (lPessoa as TPessoaFisica).Nome := EditNome.Text;
//    TPessoaFisica(lPessoa).Nome := EditNome.Text; // igual ao anterior - menos "safe"
  end;

  lPessoa.LimiteCredito := Random(1000) + 100;
  lValorLimiteAntesCompra := lPessoa.LimiteCredito;
  lValorCompra := Random(500);
  lPessoa.ComputaFatura(lValorCompra);

  MemoLog.Lines.Insert(0, 'Limite Crédito(pós-compra): ' + FormatFloat('R$ 0.,00', lPessoa.LimiteCredito));
  MemoLog.Lines.Insert(0, 'Valor compra: ' + FormatFloat('R$ 0.,00', lValorCompra));
  MemoLog.Lines.Insert(0, 'Limite Crédito: ' + FormatFloat('R$ 0.,00', lValorLimiteAntesCompra));

  if (lPessoa is TPessoaJuridica) then
  begin
    MemoLog.Lines.Insert(0, 'Razão social: ' + (lPessoa as TPessoaJuridica).RazaoSocial);
    MemoLog.Lines.Insert(0, 'Pessoa Jurídica');
  end else if (lPessoa is TPessoaFisica) then
  begin
    MemoLog.Lines.Insert(0, 'Nome: ' + (lPessoa as TPessoaFisica).Nome);
    MemoLog.Lines.Insert(0, 'Pessoa Física');
  end;

  MemoLog.Lines.Insert(0, '');
  lPessoa.Free;
end;

(*
var
  lPessoa: TPessoaJuridica;
  lValorCompra: Integer;
  lValorLimiteAntesCompra: Currency;
begin
  if Switch1.IsChecked then
  begin
    lPessoa := TPessoaJuridica.Create;
    try
      lPessoa.RazaoSocial := EditNome.Text;
      lPessoa.LimiteCredito := Random(1000) + 100;
      lValorLimiteAntesCompra := lPessoa.LimiteCredito;
      lValorCompra := Random(500);
      lPessoa.ComputaFatura(lValorCompra);
      MemoLog.Lines.Insert(0, 'Limite Crédito(pós-compra): ' + FormatFloat('R$ 0.,00', lPessoa.LimiteCredito));
      MemoLog.Lines.Insert(0, 'Valor compra: ' + FormatFloat('R$ 0.,00', lValorCompra));
      MemoLog.Lines.Insert(0, 'Limite Crédito: ' + FormatFloat('R$ 0.,00', lValorLimiteAntesCompra));
      MemoLog.Lines.Insert(0, 'Razão social: ' + lPessoa.RazaoSocial);
      MemoLog.Lines.Insert(0, 'Pessoa Jurídica');
      MemoLog.Lines.Insert(0, '');
    finally
      lPessoa.Free;
    end;
  end else begin
    lPessoa := TPessoaFisica.Create;
    try
      lPessoa.Nome := EditNome.Text;
      lPessoa.LimiteCredito := Random(1000) + 100;
      lValorLimiteAntesCompra := lPessoa.LimiteCredito;
      lValorCompra := Random(500);
      lPessoa.ComputaFatura(lValorCompra);
      MemoLog.Lines.Insert(0, 'Limite Crédito(pós-compra): ' + FormatFloat('R$ 0.,00', lPessoa.LimiteCredito));
      MemoLog.Lines.Insert(0, 'Valor compra: ' + FormatFloat('R$ 0.,00', lValorCompra));
      MemoLog.Lines.Insert(0, 'Limite Crédito: ' + FormatFloat('R$ 0.,00', lValorLimiteAntesCompra));
      MemoLog.Lines.Insert(0, 'Nome: ' + lPessoa.Nome);
      MemoLog.Lines.Insert(0, 'Pessoa Física');
      MemoLog.Lines.Insert(0, '');
    finally
      lPessoa.Free;
    end;
  end;
*)

{ TPessoa }

procedure TPessoa.ComputaFatura(pValorCompra: Currency);
begin
  if FLimiteCredito > 0  then
  begin
    FLimiteCredito := FLimiteCredito - pValorCompra;
  end;
end;

constructor TPessoa.Create;
begin
  FEndereco := TEndereco.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

procedure TPessoa.EnviaEmail(pAssunto, pTexto: string);
begin
  // todo
end;

{ TPessoaFisica }

procedure TPessoaFisica.ComputaFatura(pValorCompra: Currency);
begin
  inherited;
  if FLimiteCredito > 0 then
  begin
    FLimiteCredito := FLimiteCredito - (pValorCompra * 0.1); // * (10/100) = 10 %
  end;
end;

{ TPessoaJuridica }

procedure TPessoaJuridica.ComputaFatura(pValorCompra: Currency);
begin
  inherited;
  if FLimiteCredito > 0 then
  begin
    FLimiteCredito := FLimiteCredito - (pValorCompra * 0.05); // 5/100 = 5%
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
