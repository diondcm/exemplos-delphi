unit Classe.Pessoa;

interface

uses
  System.SysUtils, Data.DB, Windows;


type
  TPessoa = class
  private
    FID: Integer;
    FNome: string;
    FCPF: string;
    function GetCPFFormatado: string;
    procedure SetCPFFormatado(const Value: string);
    procedure ValidaDataSet(pDataSet: TDataSet);
  public
    function ToString: string; override;

    procedure PessoaToDataSet(pDataSet: TDataSet);
    procedure DatasetToPessoa(pDataSet: TDataSet);

    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property CPFFormatado: string read GetCPFFormatado write SetCPFFormatado;
  end;


implementation

{ TPessoa }

procedure TPessoa.DatasetToPessoa(pDataSet: TDataSet);
begin
  ValidaDataSet(pDataSet);

  if pDataSet.IsEmpty then
    raise Exception.Create('Dataset(' + pDataSet.Name + ') Sem dados para carregar.');

  Self.FID := pDataSet.FieldByName('ID').AsInteger;
  Self.FNome := pDataSet.FieldByName('NOME').AsString;
  Self.FCPF := pDataSet.FieldByName('CPF').AsString;
end;

procedure TPessoa.ValidaDataSet(pDataSet: TDataSet);
begin
  if not Assigned(pDataSet) then
    raise Exception.Create('Dataset não informado.');

  if not pDataSet.Active then
    raise Exception.Create('Dataset(' + pDataSet.Name + ') fechado');
end;

function TPessoa.GetCPFFormatado: string;
begin
  Result := FormatFloat('000"."000"."000"-"00', StrToInt64Def(FCPF, 0));
end;

procedure TPessoa.PessoaToDataSet(pDataSet: TDataSet);
begin
  ValidaDataSet(pDataSet);

  if Self.FID = 0 then
  begin
    pDataSet.Append;
    pDataSet.FieldByName('ID').Value := GetTickCount;
  end else begin
    pDataSet.Edit;
    pDataSet.FieldByName('ID').Value := Self.FID;
  end;

  pDataSet.FieldByName('NOME').AsString := FNome;
  pDataSet.FieldByName('CPF').AsString := FCPF;
  pDataSet.Post;
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
