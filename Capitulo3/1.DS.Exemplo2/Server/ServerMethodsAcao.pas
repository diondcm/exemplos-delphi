unit ServerMethodsAcao;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth;

type
{$METHODINFO ON}
  TSMAcao = class(TDataModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function RegistraTransacaoCompra(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): Boolean;
    function RegistraTransacaoVenda(pAbreviatura: string;
      pQuantidade: Integer; pValor: Currency): Boolean;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TSMAcao.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMAcao.RegistraTransacaoCompra(pAbreviatura: string;
  pQuantidade: Integer; pValor: Currency): Boolean;
begin

end;

function TSMAcao.RegistraTransacaoVenda(pAbreviatura: string;
  pQuantidade: Integer; pValor: Currency): Boolean;
begin

end;

function TSMAcao.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

