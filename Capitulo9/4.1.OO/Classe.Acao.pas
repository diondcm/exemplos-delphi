unit Classe.Acao;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, Vcl.Dialogs, System.StrUtils, Data.DB;

type
  EExceptAcao = class(Exception);

  TValor = class
  strict private
    FValor: Currency;
    FData: TDateTime;
  public
    property Valor: Currency read FValor write FValor;
    property Data: TDateTime read FData write FData;
  end;

  TListaValores = class(TObjectList<TValor>);

  TAcao = class(TObject)
  private
    FNome: string;
    FAbreviatura: string;
    FValores: TListaValores;
    FArquivo: string;
    FListaAbreviaturas: string;

  type
    TInfosArq = record
      Dados: string;
      Abreviaturas: string;
      constructor Create(ADados: string; pAbrev: string);
    end;

  class var
     // Nome do arquivo
     // string dele
     // lista de abrevs

     FListaArquivos: TDictionary<string, TInfosArq>;
  protected
    class procedure CarregaDeArquivo(pAbrev, pArq: string; pDataSet: TDataSet; pGuardaCache: Boolean = False); virtual;
  public
    class constructor Create;
    class destructor Destraoy;
    constructor Create; overload;
    constructor Create(AAbrev: string; AArq: string; pGuardaCache: Boolean); overload;
    destructor Destroy; override;
    function ToString: string; override;
    procedure LoadFromString(pLinha: string);
    procedure LoadFormFile(pArq: string; pGuardaCache: Boolean = False);

    class function GetListaAbrevs(pArq: string): string;
    class function GetArq(pArq: string): string;

    property Nome: string read FNome write FNome;
    property Abreviatura: string read FAbreviatura write FAbreviatura;
    property Valores: TListaValores read FValores write FValores;
  end;

implementation

{ TAcao }

constructor TAcao.Create;
begin
  FValores := TListaValores.Create(True);
end;

class procedure TAcao.CarregaDeArquivo(pAbrev, pArq: string;
  pDataSet: TDataSet; pGuardaCache: Boolean);
begin

end;

constructor TAcao.Create(AAbrev, AArq: string; pGuardaCache: Boolean);
begin
  Create;

  Abreviatura := AAbrev;
  FArquivo := AArq;

  LoadFormFile(FArquivo, pGuardaCache);
end;

class constructor TAcao.Create;
begin
  FListaArquivos := TDictionary<string, TInfosArq>.Create;
end;

class destructor TAcao.Destraoy;
begin
  FListaArquivos.Free;
end;

destructor TAcao.Destroy;
begin
  FValores.Free;
  inherited;
end;

class function TAcao.GetArq(pArq: string): string;
begin
  Result := '';
  if FListaArquivos.ContainsKey(pArq) then
  begin
    Result := FListaArquivos[pArq].Dados;
  end;
end;

class function TAcao.GetListaAbrevs(pArq: string): string;
begin
  Result := '';
  if FListaArquivos.ContainsKey(pArq) then
  begin
    Result := FListaArquivos[pArq].Abreviaturas;
  end;
end;

procedure TAcao.LoadFormFile(pArq: string; pGuardaCache: Boolean);
const
  TAM_ABREV = 12;
begin
  if not FileExists(pArq) then
  begin
    raise EExceptAcao.Create('Arquivo inválido: "' + pArq + '"');
  end;

  if Abreviatura = '' then
  begin
    raise EExceptAcao.Create('Informe a abreviatura');
  end;

  var abrev: string := Abreviatura.ToUpper;
  abrev := abrev.PadRight(12, ' ');

  var procLinha: TProc<string> :=
    procedure (pLinha: string)
    begin
      if pLinha <> '' then
      begin
        if (pLinha[1] = '0') and (pLinha[2] = '1') then
        begin
          if Pos(abrev, pLinha) > 0 then
          begin
            LoadFromString(pLinha);
          end;

          if pGuardaCache then
          begin
            FListaAbreviaturas := FListaAbreviaturas + Trim(Copy(pLinha, 13, 12)) + sLineBreak;
          end;
        end;
      end;
    end;

  var dtIni: TDateTime := Now;
  var linha: string;

//  var arq: TextFile;
//  AssignFile(arq, pArq);
//  Reset(arq);
//
//  while not Eof(arq) do
//  begin
//    Readln(arq, linha);
//    procLinha(linha);
//  end;
//
//  CloseFile(arq);

  var stl: TStringList := TStringList.Create;

  if pGuardaCache then
  begin
    if FListaArquivos.ContainsKey(pArq) then
    begin
      stl.Text := FListaArquivos[pArq].Dados;
    end;
  end;

  if stl.Count = 0 then
  begin
    stl.LoadFromFile(pArq);
  end;

  for linha in stl do
  begin
    procLinha(linha);
  end;

  if pGuardaCache then
  begin
    if not FListaArquivos.ContainsKey(pArq) then
    begin
      FListaArquivos.Add(pArq, TInfosArq.Create(stl.Text, FListaAbreviaturas));
    end;
  end;

  stl.Free;

  ShowMessage('Tempo: ' + TimeToStr(Now - dtIni));
end;

procedure TAcao.LoadFromString(pLinha: string);

  procedure AlimentaValor(pValorDaLinha: string; var dataIni: TDateTime);
  begin
    var lcents: string := Copy(pValorDaLinha, 12, 2);
    var ldec: string := Copy(pValorDaLinha, 1, 11);
    var preco: Currency := StrToFloat(ldec);
    preco := preco + (StrToFloat(lcents)/ 100);
    var valor: TValor := TValor.Create;
    valor.Valor := preco;
    valor.Data := dataIni;
    Valores.Add(valor);
    dataIni := IncMonth(dataIni, 1);
  end;

begin
  if Abreviatura = '' then
  begin
    Abreviatura := Trim(Copy(pLinha, 13, 12));
  end;

  if Nome = '' then
  begin
    Nome := Trim(Copy(pLinha, 28, 12));
  end;

  var ldata: string := Copy(pLinha, 3, 8);
  var lano: string := Copy(ldata, 1, 4);
  var lmes: string := Copy(ldata, 5, 2);
  var ldia: string := Copy(ldata, 7, 2);
  var dataIni: TDateTime := EncodeDate(StrToInt(lano), StrToInt(lmes), StrToInt(ldia));

  // Valor
  AlimentaValor(Copy(pLinha, 57, 13), dataIni);

//  // Valor 2
//  AlimentaValor(Copy(pLinha, 70, 13), dataIni);
//
//  // Valor 3
//  AlimentaValor(Copy(pLinha, 83, 13), dataIni);
//
//  // Valor 4
//  AlimentaValor(Copy(pLinha, 96, 13), dataIni);
//
//  // Valor 5
//  AlimentaValor(Copy(pLinha, 109, 13), dataIni);
//
//  // Valor 6
//  AlimentaValor(Copy(pLinha, 122, 13), dataIni);
//
//  // Valor 7
//  AlimentaValor(Copy(pLinha, 135, 13), dataIni);
end;

function TAcao.ToString: string;
begin
  Result := 'Ação: ' + Nome + '(' + Abreviatura + ')';

  for var valor: TValor in Valores do
  begin
    Result := Result + sLineBreak + (DateTimeToStr(valor.Data) + ' - ' + FormatFloat('0.,00', valor.Valor));
  end;
end;

{ TAcao.TInfosArq }

constructor TAcao.TInfosArq.Create(ADados, pAbrev: string);
begin
  Dados := ADados;
  Abreviaturas := pAbrev;
end;

end.
