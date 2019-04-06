unit Classe.Pessoa;

interface

uses
  System.SysUtils, Vcl.StdCtrls;

type
  TTipoPessoa = (Fisica = 78, Juridica = 10); // TTipoPessoa.Fisica

  TPessoa = class
  strict private
    FNome: string;
    FDataNascimento: TDate;
    FID: Integer;
    procedure SetDataNascimento(const Value: TDate);
  private
    FCredito: Currency;
    FTipo: TTipoPessoa;
  public
    procedure ToMemo(pMemo: TMemo);

    function ToString: string; override;

    function ToCSV: string;

    property Nome: string read FNome write FNome;
    property DataNascimento: TDate read FDataNascimento write SetDataNascimento;
    property ID: Integer read FID write FID;
    property Credito: Currency read FCredito write FCredito;
    property Tipo: TTipoPessoa read FTipo write FTipo;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetDataNascimento(const Value: TDate);
begin
  if Value > Now then
  begin
    raise Exception.Create('Data de nascimento(' + DateToStr(Value) + ') não pode ser maior que a data atual(' + DateToStr(Now) + ').');
  end;

  FDataNascimento := Value;
end;

function TPessoa.ToCSV: string;
begin
  Result :=
    Self.Nome + ';' +
    Self.ID.ToString + ';' +
    DateToStr(FDataNascimento) + ';' +
    FormatCurr('0.,00', FCredito) + ';';
end;

procedure TPessoa.ToMemo(pMemo: TMemo){ Self: TPessoa };
begin
  pMemo.Lines.Insert(0, 'Crédito: ' + FormatCurr('0.,00', FCredito));
  pMemo.Lines.Insert(0, 'DtNascimento: ' + DateToStr(FDataNascimento));
  pMemo.Lines.Insert(0, 'ID: ' + Self.ID.ToString);
  pMemo.Lines.Insert(0, 'Nome: ' + Self.Nome);
  pMemo.Lines.Insert(0, TimeToStr(Now));
end;

function TPessoa.ToString: string;
begin
  Result :=
    TimeToStr(Now) + sLineBreak +
    'Nome: ' + Self.Nome + sLineBreak +
    'ID: ' + Self.ID.ToString + sLineBreak +
    'DtNascimento: ' + DateToStr(FDataNascimento) + sLineBreak +
    'Crédito: ' + FormatCurr('0.,00', FCredito) + sLineBreak;
end;

end.
