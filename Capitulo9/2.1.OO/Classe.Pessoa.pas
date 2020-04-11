unit Classe.Pessoa;

interface

uses
  System.SysUtils, System.DateUtils, System.Generics.Collections, Data.DB, System.StrUtils,
  System.Classes;

type
  TPessoa = class//(TObject)
  private
    FNome: string;
    FID: Integer;
    FCodigo: Integer;
    FCPF: string;
    FDataNascimento: TDateTime;
    FRenda: Currency;
    function GetCPF: string;
  public
    constructor Create(pRadom: Boolean = False);
    procedure GeraValoresRandom;
    function ToString(pSeparador: string{ = '='}; pQuebraLinha: Boolean = True; pCaptions: Boolean = True): string; reintroduce; overload;
    function ToString: string; overload; override;
    procedure CarregaDeDataSet(pDts: TDataSet);
    procedure PersisteNoDataSet(pDts: TDataSet);
    property Nome: string read FNome write FNome;
    property ID: Integer read FID write FID;
    property Codigo: Integer read FCodigo write FCodigo;
    property CPF: string read GetCPF write FCPF;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Renda: Currency read FRenda write FRenda;
    class constructor Create;
    class destructor Destroy;
  end;

//  TListaPessoa = class(TList<TPessoa>);
  TListaPessoa = class(TObjectList<TPessoa>)
    procedure CarregaDeDataSet(pDts: TDataSet);
    procedure PersisteNoDataSet(pDts: TDataSet);
    procedure ExportaCSV(pArqivo: string; pSeparador: string = ';');
  end;

implementation

{ TPessoa }

function TPessoa.ToString(pSeparador: string; pQuebraLinha: Boolean; pCaptions: Boolean): string;
var
  lQuebraLinha: string;
begin
  lQuebraLinha := '';
  if pQuebraLinha then
    lQuebraLinha := sLineBreak;

  Result :=
    IfThen(pCaptions, 'ID' + pSeparador) + Self.ID.ToString + lQuebraLinha +
    IfThen(pCaptions, 'Código') + pSeparador + Self.Codigo.ToString + lQuebraLinha +
    IfThen(pCaptions, 'Nome') + pSeparador + Self.Nome + lQuebraLinha +
    IfThen(pCaptions, 'Data nascimento') + pSeparador + DateToStr(Self.DataNascimento) + lQuebraLinha +
    IfThen(pCaptions, 'Renda') + pSeparador + FormatCurr('##0.,00', Self.Renda) + lQuebraLinha +
    IfThen(pCaptions, 'CPF') + pSeparador + Self.CPF;
end;

procedure TPessoa.CarregaDeDataSet(pDts: TDataSet);
begin
  if pDts.IsEmpty then
    raise Exception.Create('Sem informações para carregar do DataSet');

  Self.Nome := pDts.FieldByName('NOME').AsString;
  Self.ID := pDts.FieldByName('ID').AsInteger;
  Self.Codigo := pDts.FieldByName('CODIGO').AsInteger;
  Self.DataNascimento := pDts.FieldByName('DataNascimento').AsDateTime;
  Self.Renda := pDts.FieldByName('RENDA').AsCurrency;
  Self.CPF := pDts.FieldByName('CPF').AsString;
end;

constructor TPessoa.Create;
begin
  if pRadom then
    GeraValoresRandom;
end;

class constructor TPessoa.Create;
begin
  {$IFDEF CONSOLE}
  Writeln('Class Constructor Pessoa');
  {$ENDIF}
end;

class destructor TPessoa.Destroy;
begin
  {$IFDEF CONSOLE}
  Writeln('Class Destructor Pessoa');
  {$ENDIF}
end;

procedure TPessoa.GeraValoresRandom;
var
  lGuid: TGUID;
  lStrGuid: string;
begin
  CreateGUID(lGuid);
  lStrGuid := GUIDToString(lGuid);
  lStrGuid := StringReplace(lStrGuid, '{', '', [rfReplaceAll]);
  lStrGuid := StringReplace(lStrGuid, '-', ' ', [rfReplaceAll]);
  lStrGuid := Copy(lStrGuid, 1, 5 + Random(lStrGuid.Length -5));

  Self.Nome := lStrGuid;
  Self.ID := Random(1000000);
  Self.Codigo := Random(1000000);
  Self.DataNascimento := IncDay(IncYear(Now, - (18 + Random(50))), Random(365));
  Self.Renda := Random(10000) + 1047;
  Self.CPF := '00011122285';
end;

function TPessoa.GetCPF: string;
begin
  Result := FCPF;
//  Result := '000' + '.' + '111' + '.' + '222' + '-' + '85';
end;

procedure TPessoa.PersisteNoDataSet(pDts: TDataSet);
begin
  if not pDts.Active then
     raise Exception.Create('Dataset não ativo para persistência');

  pDts.Insert;// TODO: tratar update

  pDts.FieldByName('NOME').AsString := Self.Nome;
  pDts.FieldByName('ID').AsInteger := Self.ID;
  pDts.FieldByName('CODIGO').AsInteger := Self.Codigo;
  pDts.FieldByName('DataNascimento').AsDateTime := Self.DataNascimento;
  pDts.FieldByName('RENDA').AsCurrency := Self.Renda;
  pDts.FieldByName('CPF').AsString := Self.CPF;

  pDts.Post;
end;

function TPessoa.ToString: string;
begin
  Result := Self.ToString('=');
end;

{ TListaPessoa }

procedure TListaPessoa.CarregaDeDataSet(pDts: TDataSet);
var
  lPessoa: TPessoa;
begin
  if pDts.IsEmpty then
    raise Exception.Create('Dataset sem registros para Carregar');

  pDts.DisableControls;

  pDts.First;

  while not pDts.Eof do
  begin
    lPessoa := TPessoa.Create;
    lPessoa.CarregaDeDataSet(pDts);
    Self.Add(lPessoa);
    pDts.Next;
  end;

  pDts.First;

  pDts.EnableControls;
end;

procedure TListaPessoa.ExportaCSV(pArqivo, pSeparador: string);
var
  lPessoa: TPessoa;
  lStl: TStringList;
begin
  lStl := TStringList.Create;

  for lPessoa in Self do
  begin
    lStl.Add(lPessoa.ToString(pSeparador, False, False));
  end;

  lStl.SaveToFile(pArqivo);
  lStl.Free;
end;

procedure TListaPessoa.PersisteNoDataSet(pDts: TDataSet);
var
  lPessoa: TPessoa;
begin
  if not pDts.Active then
    raise Exception.Create('Dataset não está aberto para persistência');

  pDts.DisableControls;

  for lPessoa in Self do
  begin
    lPessoa.PersisteNoDataSet(pDts);
  end;

  pDts.EnableControls;
end;


initialization // obrigatório para o finalization
  {$IFDEF CONSOLE}
  Writeln('Initialization: Classe Pessoa');
  {$ENDIF}

finalization
  {$IFDEF CONSOLE}
  Writeln('Finalization: Classe Pessoa');
  {$ENDIF}

end.
