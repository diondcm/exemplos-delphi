unit Classes.Transporte.Pessoa;

interface

uses Classe.Transporte, System.DateUtils;

type
  TPessoa = class
  private
    Fid: Integer;
    FNome: string;
    FDataNascimento: TDateTime;
    FRenda: Currency;
    FAtivo: Boolean;
    FDataUnix: Int64;
    FDataISO8601: string;
    procedure SetDataNascimento(const Value: TDateTime);
//    function GetSalarioEmDolar: Currency;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property Renda: Currency read FRenda write FRenda;
    property Ativo: Boolean read FAtivo write FAtivo;
    property DataUnix: Int64 read FDataUnix write FDataUnix;
    property DataISO8601: string read FDataISO8601 write FDataISO8601;
//    property SalarioEmDolar: Currency read GetSalarioEmDolar;
  end;

  TTransportePessoa = class(TTransporte<TPessoa>);

implementation

{ TPessoa }

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
  FDataUnix := DateTimeToUnix(FDataNascimento);
  FDataISO8601 := DateToISO8601(FDataNascimento);
end;

end.
