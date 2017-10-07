unit Classe.Pessoa;

interface

uses
  Data.DB;

type
  /// <summary>
  ///  Clase de Pessoa
  ///  </summary>
   { TODO 1 -oDion -cDevs : Implementar Config }
  TPessoa = class
  private
    FID: Integer;
    FCodigo: Integer;
    FNome: string;
    FDataNascimento: TDate;
    FDataCadastro: TDate;
  public
  /// <summary>
  ///  Carrega de TDadaSet
  ///  - Data set deve estar aberto
  ///  </summary>
    procedure Carregar(pDts: TDataSet);
    procedure Salvar(pDtsDestino: TDataSet);
//    procedure Carregar;

    function ToString: string; override;

    property ID: Integer read FID write FID;
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    property DataCadastro: TDate read FDataCadastro write FDataCadastro;
  end;

  Class1 = class
  public
    Pes: TPessoa;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TPessoa }

procedure TPessoa.Carregar(pDts: TDataSet);
begin
  if (not pDts.Active) or (pDts.IsEmpty) then
    raise Exception.Create('DataSet vazio');

  FID := pDts.FieldByName('ID').AsInteger;
  FCodigo := pDts.FieldByName('CODIGO').AsInteger;
  FNome := pDts.FieldByName('NOME').AsString;
  FDataNascimento := StrToDateDef(pDts.FieldByName('data_nascimento').AsString, IncYear(Now, - 20));
  FDataCadastro := StrToDateDef(pDts.FieldByName('data_cadastro').AsString, Now);

  // pDts.Fields[0] // evitar
end;

//procedure TPessoa.Carregar;
//begin
//  FID := dmdPessoa.cdsPessoa.FieldByName('ID').AsInteger;
//end;

procedure TPessoa.Salvar(pDtsDestino: TDataSet);
begin
  if not(pDtsDestino.State in dsEditModes) then
    raise Exception.Create('DataSet não está em edição');

  // Shift + Ctrl + J
  pDtsDestino.FieldByName('ID').AsInteger := FID;
  pDtsDestino.FieldByName('CODIGO').AsInteger := FCodigo;
  pDtsDestino.FieldByName('NOME').AsString := FNome;
  pDtsDestino.FieldByName('data_nascimento').AsString := DateToStr(FDataNascimento);
  pDtsDestino.FieldByName('data_cadastro').AsString := DateToStr(FDataCadastro);
end;

function TPessoa.ToString: string;
begin
  Result := ClassName + sLineBreak +
    'ID: ' + Fid.ToString + sLineBreak +
    'Código: ' + FCodigo.ToString + sLineBreak +
    'Nome: ' + FNome + sLineBreak +
    'Dt. Nasc.: ' + DateToStr(FDataNascimento) + sLineBreak +
    'Dt. Cadastro: ' + DateToStr(FDataCadastro);
end;

end.
