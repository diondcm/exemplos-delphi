unit ServerMethodsAcao;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Status, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Classe.Acao;

type
{$METHODINFO ON}
  TSMAcao = class(TDataModule)
    fdmAcoes: TFDMemTable;
    fdmAcoesACAO: TStringField;
    fdmAcoesQUANTIDADE: TIntegerField;
    fdmAcoesVALOR: TCurrencyField;
    fdmAcoesTIPO_OPERACAO: TStringField;
  // wireshark
  private const
    LIMITE_COMPRA = 10000;
  private
    function RegistraTransacao(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency; pTipoOp: string): TStatus;
    function GetOperacao(const pTipoOp: string): TStatusList<TAcao>;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function RegistraTransacaoCompra(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): TStatus;
    function RegistraTransacaoVenda(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): TStatus;

    function RegistraVenda(pAcao: TAcao): TStatus;
    function RegistraCompra(pAcao: TAcao): TStatus;

    function GetTransacoesCompra: TStatusList<TAcao>;
    function GetTransacoesVenda: TStatusList<TAcao>;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TSMAcao.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMAcao.GetTransacoesCompra: TStatusList<TAcao>;
begin
  Result := GetOperacao('C');
end;

function TSMAcao.GetTransacoesVenda: TStatusList<TAcao>;
begin
  Result := GetOperacao('V');
end;

function TSMAcao.GetOperacao(const pTipoOp: string): TStatusList<TAcao>;
var
  lAcao: TAcao;
begin
  Result := TStatusList<TAcao>.Create;
  fdmAcoes.IndexFieldNames := 'TIPO_OPERACAO';
  fdmAcoes.SetRange([pTipoOp], [pTipoOp]);
  if fdmAcoes.IsEmpty then
  begin
    Result.Erro := 'Sem transações';
  end
  else
  begin
    fdmAcoes.First;
    while not fdmAcoes.Eof do
    begin
      // no dia a dia, seria realizado por um ORM
      lAcao := TAcao.Create;
      lAcao.Abreviatura := fdmAcoes.FieldByName('ACAO').AsString;
      lAcao.Valor := fdmAcoes.FieldByName('VALOR').AsCurrency;
      lAcao.Quantidade := fdmAcoes.FieldByName('QUANTIDADE').AsInteger;
      Result.Add(lAcao);
      fdmAcoes.Next;
    end;
  end;
  fdmAcoes.CancelRange;
end;

function TSMAcao.RegistraCompra(pAcao: TAcao): TStatus;
begin
  Result := RegistraTransacao(pAcao.Abreviatura, pAcao.Quantidade, pAcao.Valor, 'C');
end;

function TSMAcao.RegistraTransacao(pAbreviatura: string; pQuantidade: Integer;
  pValor: Currency; pTipoOp: string): TStatus;
begin
  if not fdmAcoes.Active then
  begin
    fdmAcoes.Open;
  end;

  Result := TStatus.Create;
  Result.Erro := '';

  if pQuantidade > LIMITE_COMPRA then
  begin
    Result.Erro := '200;Limite de compra excedido';
  end else if pQuantidade <= 0 then
  begin
    Result.Erro := '201;Quantidade(' + IntToStr(pQuantidade) + ') tem de ser maior que 0';
  end else if pValor <= 0 then
  begin
    Result.Erro := '210;Valor(' + FormatFloat('0.,00', pValor) + ') deve ser maior do que zero';
  end else if (pAbreviatura = '') or (Length(pAbreviatura) > 5) then
  begin
    Result.Erro := '250;Abreviatura inválida';
  end else begin
    fdmAcoes.Append;
    fdmAcoes.FieldByName('ACAO').AsString := pAbreviatura;
    fdmAcoes.FieldByName('QUANTIDADE').AsInteger := pQuantidade;
    fdmAcoes.FieldByName('VALOR').AsCurrency := pValor;
    fdmAcoes.FieldByName('TIPO_OPERACAO').AsString := pTipoOp;
    fdmAcoes.Post;
  end;
end;

function TSMAcao.RegistraTransacaoCompra(pAbreviatura: string;
  pQuantidade: Integer; pValor: Currency): TStatus;
begin
  Result := RegistraTransacao(pAbreviatura, pQuantidade, pValor, 'C');
end;

function TSMAcao.RegistraTransacaoVenda(pAbreviatura: string;
  pQuantidade: Integer; pValor: Currency): TStatus;
begin
  Result := RegistraTransacao(pAbreviatura, pQuantidade, pValor, 'V');
end;

function TSMAcao.RegistraVenda(pAcao: TAcao): TStatus;
begin
  Result := RegistraTransacao(pAcao.Abreviatura, pAcao.Quantidade, pAcao.Valor, 'V');
end;

function TSMAcao.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

