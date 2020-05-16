unit ServerMethodsUnit1;

interface

uses WinAPI.Windows, REST.JSON,
    System.SysUtils, System.Classes, System.Json, System.SyncObjs,
    DataSnap.DSProviderDataModuleAdapter, Classes.Transporte.Pessoa,
    Datasnap.DSServer, Datasnap.DSAuth, System.Math, System.Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TListaPessoa = TObjectList<TPessoa>;

  TServerMethods1 = class(TDSServerModule)
    qryDados: TFDQuery;
    FDConnection: TFDConnection;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    class var
      FID: Integer;
      FQtdAtivos: Integer;
      FQtdGeral: Integer;
      FMaxQtdAtivos: Integer;
      FLogStr: string;
      FListaPessoa: TDictionary<Integer, TPessoa>;
      FCriaticalSection: TCriticalSection;
  protected
    class procedure GravaLog(pMsg: string);
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Expo(pValor: Integer): Integer;
    function GetPessoa(pID: Integer): TTransportePessoa;
    function SetPessoa(pPessoa: TPessoa): Integer;
    function GetPessoas: TListaPessoa; // TArray<TPessoa> -> não funciona
    function GetLog: string;

    function GetDados(pQtdReg: Integer): string;

    function GetThreadID: Integer;
    function GetQtdAtivos: Integer;
    function GetQtdGeral: Integer;
    function GetQtdMaxAtivos: Integer;

    class constructor Create;
    class destructor Destroy;
  end;


implementation


{$R *.dfm}


uses System.StrUtils;

class constructor TServerMethods1.Create;
begin
//  GravaLog('Create Server Methods');
  FListaPessoa := TDictionary<Integer, TPessoa>.Create;
  FCriaticalSection := TCriticalSection.Create;;
end;

class destructor TServerMethods1.Destroy;
begin
//  GravaLog('Destroy Server Methods');
  FListaPessoa.Free;
  FCriaticalSection.Free;
end;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  InterlockedIncrement(FQtdAtivos);
  InterlockedIncrement(FQtdGeral);

  if FQtdAtivos > FMaxQtdAtivos then
  begin
    InterlockedExchange(FMaxQtdAtivos, FQtdAtivos);
  end;
end;

procedure TServerMethods1.DSServerModuleDestroy(Sender: TObject);
begin
  InterlockedDecrement(FQtdAtivos);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.Expo(pValor: Integer): Integer;
begin
  Result := Trunc(Exp(pValor));
end;

function TServerMethods1.GetDados(pQtdReg: Integer): string;
begin
  if pQtdReg < 1 then
  begin
    pQtdReg := 100;
  end;

  qryDados.Close;
  qryDados.ParamByName('QTD').AsInteger := pQtdReg;
  qryDados.Open;

  var lStrStm: TStringStream := TStringStream.Create;
  qryDados.SaveToStream(lStrStm, sfJSON);
  Result := lStrStm.DataString;
  lStrStm.Free;
end;

function TServerMethods1.GetLog: string;
begin
  Result := FLogStr;
end;

function TServerMethods1.GetPessoa(pID: Integer): TTransportePessoa;
begin
//  GravaLog('GetPessoa');
  Result := TTransportePessoa.Create;
  try
    FCriaticalSection.Acquire;
    try
      if FListaPessoa.ContainsKey(pID) then
      begin
        Result.retorno := TJson.ObjectToJsonString(FListaPessoa[pID]);

  //      Result.instancia := TPessoa.Create;
  //      Result.instancia.Nome := FListaPessoa[pID].Nome;
  //      Result.instancia.ID := FListaPessoa[pID].ID;
  //      Result.instancia.DataNascimento := FListaPessoa[pID].DataNascimento;
  //      Result.instancia.Renda := FListaPessoa[pID].Renda;
  //      Result.instancia.Ativo := FListaPessoa[pID].Ativo;
      end;
    finally
      FCriaticalSection.Release;
    end;

    if pID = -1 then
    begin
      Result.instancia := TPessoa.Create;
      Result.instancia.Nome := 'Teste';
      Result.instancia.ID := -1;
    end;
  except
    on E: Exception do
    begin
      Result.erro := E.Message;
    end;
  end;
end;

function TServerMethods1.GetPessoas: TListaPessoa;
var
  lPes: TPessoa;
begin
  Result := TListaPessoa.Create;
  FCriaticalSection.Acquire;
  try
    for lPes in FListaPessoa.Values do
    begin
      var lPessoa: TPessoa := TPessoa.Create;
      lPessoa.ID := lPes.ID;
      lPessoa.Nome := lPes.Nome;
      lPessoa.DataNascimento := lPes.DataNascimento;
      lPessoa.Renda := lPes.Renda;
      lPessoa.Ativo := lPes.Ativo;
      Result.Add(lPessoa);
    end;
  finally
    FCriaticalSection.Release;
  end;
end;

function TServerMethods1.GetQtdAtivos: Integer;
begin
  Result := FQtdAtivos;
end;

function TServerMethods1.GetQtdGeral: Integer;
begin
  Result := FQtdGeral;
end;

function TServerMethods1.GetQtdMaxAtivos: Integer;
begin
  Result := FMaxQtdAtivos;
end;

function TServerMethods1.GetThreadID: Integer;
begin
  Result := GetCurrentThreadId;
end;

class procedure TServerMethods1.GravaLog(pMsg: string);
begin
  FLogStr := FLogStr + sLineBreak + TimeToStr(Now) + ' - ' + pMsg;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetPessoa(pPessoa: TPessoa): Integer;
var
  lPess: TPessoa;
begin
//  GravaLog('SetPessoa');
  FCriaticalSection.Acquire;
  try
    if FListaPessoa.ContainsKey(pPessoa.ID) then
    begin
      FListaPessoa[pPessoa.ID] := pPessoa;
    end else begin
      Inc(FID);
      pPessoa.ID := FID;//GetTickCount;
      lPess := TPessoa.Create;
      lPess.ID := pPessoa.ID;
      lPess.Nome := pPessoa.Nome;
      lPess.DataNascimento := pPessoa.DataNascimento;
      lPess.Renda := pPessoa.Renda;
      lPess.Ativo := pPessoa.Ativo;

      FListaPessoa.Add(pPessoa.ID, lPess);
    end;
  finally
    FCriaticalSection.Release;
  end;
  Result := pPessoa.ID;
end;

end.

