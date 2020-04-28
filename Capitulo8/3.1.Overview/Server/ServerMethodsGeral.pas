unit ServerMethodsGeral;

interface

uses Winapi.Windows, System.DateUtils, System.Generics.Collections,
    System.SysUtils, System.Classes, System.Json, System.SyncObjs,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Pessoa, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Classe.Log.Server;

type
  TListaPessoa = TObjectList<TPessoa>; // TObjectList<TPessoa> -> OwnsObjects := True
  TListaPessoaArr = TArray<TPessoa>;

{$METHODINFO ON}
  TSMGeral = class(TDataModule)
    qryPessoa: TFDQuery;
    qryPessoaid: TIntegerField;
    qryPessoanome: TWideStringField;
    qryPessoadata_nascimento: TSQLTimeStampField;
    qryPessoacredito: TFloatField;
    FDConnection: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  class var
    FTotalInstancias: Integer;
    FInstanciasAbertas: Integer;
    FPessoa: TPessoa;

  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetID: Integer;
    function GetThreadID: Integer;

    function GetTotalInstanciasAbertas: Integer;
    function GetTotalInstancias: Integer;

    function GetServerVersion: string;
    function GetServerCost: Currency;

    function GetObject: TObject;

    function GeraPessoa: TPessoa;
    function GetPessoa: TPessoa;
    procedure SetPessoa(pPessoa: TPessoa);

    { Datas }
    function GetDataServer: TDateTime;
    function GetDataAtual8601: string;
    function GetDataUnix: string;
    function GetDataUnixInt: Int64;

    function GetListaPessoasArr: TArray<TPessoa>; // Não funciona no DS

    function GetPessoas: TListaPessoa;
    function GetListaPessoa: TListaPessoaArr;
    function GetListaPessoaStr: string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TSMGeral.DataModuleCreate(Sender: TObject);
begin
  Tag := GetTickCount;
  InterlockedIncrement(FTotalInstancias); // inc não serve, pois não é thread-safe
  InterlockedIncrement(FInstanciasAbertas);
end;

procedure TSMGeral.DataModuleDestroy(Sender: TObject);
begin
  InterlockedDecrement(FInstanciasAbertas);
end;

function TSMGeral.EchoString(Value: string): string;
begin
  TLogServer.GravaLog('EchoString chamado');
  Result := Value;
end;

function TSMGeral.GetDataAtual8601: string;
begin
  Result := DateToISO8601(Now);
end;

function TSMGeral.GetDataServer: TDateTime;
begin
  Result := Now;
end;

function TSMGeral.GetDataUnix: string;
begin
  Result := GetDataUnixInt.ToString;
end;

function TSMGeral.GetDataUnixInt: Int64;
begin
  Result := DateTimeToUnix(Now);
end;

function TSMGeral.GetID: Integer;
begin
  Result := Tag;
end;

function TSMGeral.GetListaPessoa: TListaPessoaArr;
begin
  Result := GetListaPessoasArr;
end;

function TSMGeral.GetListaPessoasArr: TArray<TPessoa>;
begin
  qryPessoa.Close;
  qryPessoa.Open;

  qryPessoa.First;

//  qryPessoa.SaveToStream();

  while not qryPessoa.Eof do
  begin
    SetLength(Result, Length(Result) + 1);

    Result[Length(Result) -1] := TPessoa.Create;
    Result[Length(Result) -1].Nome := qryPessoanome.AsString;
    Result[Length(Result) -1].ID := qryPessoaid.AsInteger;
    Result[Length(Result) -1].DataNascimento := qryPessoadata_nascimento.AsDateTime;
    Result[Length(Result) -1].Credito := qryPessoacredito.AsFloat;

    qryPessoa.Next;
  end;
end;

function TSMGeral.GetListaPessoaStr: string;
var
  lStm: TStringStream;
begin
  qryPessoa.Close;
  qryPessoa.Open;

  qryPessoa.First;

  lStm := TStringStream.Create;
  qryPessoa.SaveToStream(lStm, TFDStorageFormat.sfJSON);
  Result := lStm.DataString;
  lStm.Free;
  qryPessoa.Close;
end;

function TSMGeral.GetObject: TObject;
begin
  Result := TObject.Create;
end;

function TSMGeral.GetPessoa: TPessoa;
begin
  Result := FPessoa;
end;

function TSMGeral.GetPessoas: TListaPessoa;
begin
  Result := TListaPessoa.Create;
  Result.Add(TPessoa.Create); //  AddRange(GetListaPessoasArr);
end;

function TSMGeral.GeraPessoa: TPessoa;
begin
  Result := TPessoa.Create;
  Result.Nome := 'Fulano de teste';
  Result.ID := GetTickCount;
  Result.DataNascimento := IncMonth(Now, -(12*20));
  Result.Credito := GetServerCost;
end;

function TSMGeral.GetServerCost: Currency;
begin
  Result := 10000 * Random(10000) /(1 + Random(100));
end;

function TSMGeral.GetServerVersion: string;
begin
  Result := '1.2.0';
end;

function TSMGeral.GetThreadID: Integer;
begin
  Result := GetCurrentThreadId;
end;

function TSMGeral.GetTotalInstancias: Integer;
begin
  Result := FTotalInstancias;
end;

function TSMGeral.GetTotalInstanciasAbertas: Integer;
begin
  Result := FInstanciasAbertas;
end;

function TSMGeral.ReverseString(Value: string): string;
begin
  Sleep(Random(1000));
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TSMGeral.SetPessoa(pPessoa: TPessoa);
begin
  FPessoa.Free;
  FPessoa := TPessoa.Create;
  FPessoa.Nome := pPessoa.Nome;
  FPessoa.ID := pPessoa.ID;
  FPessoa.DataNascimento := pPessoa.DataNascimento;
  FPessoa.Credito := pPessoa.Credito;
end;

end.

