unit Classe.Pessoa;

interface

uses
  System.SysUtils;

type
  TPessoa = class
  private
    FID: Integer;
    FNome: string;
    FCPF: string;
    function GetCPFFormatado: string;
    procedure SetCPFFormatado(const Value: string);
  public
    function ToString: string; override;

    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property CPFFormatado: string read GetCPFFormatado write SetCPFFormatado;
  end;


implementation

{ TPessoa }

function TPessoa.GetCPFFormatado: string;
begin
  Result := FormatFloat('000"."000"."000"-"00', StrToInt64Def(FCPF, 0));
end;

procedure TPessoa.SetCPFFormatado(const Value: string);
begin
  FCPF := StringReplace(Value, '.', '', [rfReplaceAll]);
  FCPF := StringReplace(FCPF, '-', '', [rfReplaceAll]);
  //FCPF := StringReplace(StringReplace(Value, '-', '', [rfReplaceAll]), '.', '', [rfReplaceAll]);
end;

function TPessoa.ToString: string;
begin
//  inherited
  Result := 'Nome: ' + FNome + sLineBreak + 'CPF: ' + GetCPFFormatado;
end;

end.
