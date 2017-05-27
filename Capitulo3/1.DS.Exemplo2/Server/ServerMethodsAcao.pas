unit ServerMethodsAcao;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Status, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
{$METHODINFO ON}
  TSMAcao = class(TDataModule)
    fdmAcoes: TFDMemTable;
    fdmAcoesACAO: TStringField;
    fdmAcoesQUANTIDADE: TIntegerField;
    fdmAcoesVALOR: TCurrencyField;
    fdmAcoesTIPO_OPERACAO: TStringField;
  private
    function RegistraTransacao(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency; pTipoOp: string): TStatus;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function RegistraTransacaoCompra(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): TStatus;
    function RegistraTransacaoVenda(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): TStatus;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TSMAcao.EchoString(Value: string): string;
begin
  Result := Value;
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

  fdmAcoes.Append;
  fdmAcoes.FieldByName('ACAO').AsString := pAbreviatura;
  fdmAcoes.FieldByName('QUANTIDADE').AsInteger := pQuantidade;
  fdmAcoes.FieldByName('VALOR').AsCurrency := pValor;
  fdmAcoes.FieldByName('TIPO_OPERACAO').AsString := pTipoOp;
  fdmAcoes.Post;
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

function TSMAcao.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

