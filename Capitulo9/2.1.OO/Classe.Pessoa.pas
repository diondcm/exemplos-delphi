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
    FSaldo: Currency;
    function GetCPF: string;
  public
    constructor Create(pRadom: Boolean = False);
    procedure GeraValoresRandom;
    function ToString(pSeparador: string{ = '='}; pQuebraLinha: Boolean = True; pCaptions: Boolean = True): string; reintroduce; overload;
    function ToString: string; overload; override;
    procedure CarregaDeDataSet(pDts: TDataSet);
    procedure PersisteNoDataSet(pDts: TDataSet);
    class function GeraCPF(Ponto: Boolean = False): string;
    property Nome: string read FNome write FNome;
    property ID: Integer read FID write FID;
    property Codigo: Integer read FCodigo write FCodigo;
    property CPF: string read GetCPF write FCPF;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Renda: Currency read FRenda write FRenda;
    property Saldo: Currency read FSaldo write FSaldo;
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

constructor TPessoa.Create(pRadom: Boolean = False);
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

class function TPessoa.GeraCPF(Ponto: Boolean): string;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, d1, d2: LongInt;
begin
   n1 := Trunc(Random(10));

         n2 := Trunc(Random(10));

         n3 := Trunc(Random(10));

         n4 := Trunc(Random(10));

         n5 := Trunc(Random(10));

         n6 := Trunc(Random(10));

         n7 := Trunc(Random(10));

         n8 := Trunc(Random(10));

         n9 := Trunc(Random(10));

         d1 := (n9 * 2) + (n8 * 3) + (n7 * 4) + (n6 *  5) + (n5 * 6) +

        (n4 * 7) + (n3 * 8) + (n2 * 9) + (n1 * 10);

         d1 := 11 - (d1 mod 11);

         if (d1 >= 10) then d1 := 0;

         d2 := (d1 * 2) + (n9 * 3) + (n8 * 4) + (n7 *  5) + (n6 *  6) +

        (n5 * 7) + (n4 * 8) + (n3 * 9) + (n2 * 10) + (n1 * 11);

         d2 := 11 - (d2 mod 11);

         if (d2>=10) then d2 := 0;

 Result := IntToStr(n1) + IntToStr(n2) + IntToStr(n3) + IntToStr(n4) + IntToStr(n5) + IntToStr(n6) +

            IntToStr(n7) + IntToStr(n8) + IntToStr(n9) + IntToStr(d1) + IntToStr(d2);

 if Ponto then

    Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' + Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);
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
  Self.Saldo := Random(20000 - 200) + 200;
  Self.Renda := Random(10000) + 1047;;
  Self.CPF :=  GeraCPF; //'00011122285';
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
