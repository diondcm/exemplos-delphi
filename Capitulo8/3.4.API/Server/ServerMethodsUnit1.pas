unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json, System.SyncObjs,
    Datasnap.DSServer, Datasnap.DSAuth, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Classe.Root, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    RESTRequest: TRESTRequest;
    RESTClient: TRESTClient;
    RESTResponse1: TRESTResponse;
    memBalance: TFDMemTable;
    memTrasactions: TFDMemTable;
    memBalancelegacyAddress: TStringField;
    memBalancecashAddress: TStringField;
    memBalanceslpAddress: TStringField;
    memBalancecurrentPage: TFloatField;
    memBalancepagesTotal: TFloatField;
    memBalancebalance: TFloatField;
    memBalancebalanceSat: TFloatField;
    memBalancetotalReceived: TFloatField;
    memBalancetotalReceivedSat: TFloatField;
    memBalancetotalSent: TFloatField;
    memBalancetotalSentSat: TFloatField;
    memBalanceunconfirmedBalance: TFloatField;
    memBalanceunconfirmedBalanceSat: TFloatField;
    memBalanceunconfirmedTxApperances: TFloatField;
    memBalancetxApperances: TFloatField;
    memTrasactionsidbalance: TIntegerField;
    memTrasactionstransaction: TStringField;
  private
    class var
      FBalanceCache: string;
      FBalanceTransactions: string;
      FCriticalSec: TCriticalSection;
    class procedure AtualizaCache(pCache: string);
  private
    procedure CarregaInfosBlockChain;
  public
    class constructor Create;
    class destructor Destroy;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetInfosBlockChain: string;
    function InvalidateCache: Boolean;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}

uses System.StrUtils;

class procedure TServerMethods1.AtualizaCache(pCache: string);
begin
  FCriticalSec.Acquire;
  try
    FBalanceCache := pCache;
  finally
    FCriticalSec.Release;
  end;
end;

procedure TServerMethods1.CarregaInfosBlockChain;
var
  lRetorno: string;
  lObjBlockChain: TRootClass;
  lStrStm: TStringStream;
begin
  // RESTClient.BaseURL => URL de acesso da API
//  Edit1.Text := FormatFloat('0.,00', lObjBlockChain.balance);
  RESTRequest.Execute;
  lRetorno := RESTResponse1.Content;
  lObjBlockChain := TRootClass.FromJsonString(lRetorno);

  memBalance.Close;
  memBalance.Open;

  memBalance.Append;
  memBalancelegacyAddress.AsString := lObjBlockChain.legacyAddress;
  memBalancecashAddress.AsString := lObjBlockChain.cashAddress;
  memBalanceslpAddress.AsString := lObjBlockChain.slpAddress;
  memBalancecurrentPage.AsFloat := lObjBlockChain.currentPage;
  memBalancepagesTotal.AsFloat:= lObjBlockChain.pagesTotal;
  memBalancebalance.AsFloat := lObjBlockChain.balance;
  memBalancebalanceSat.AsFloat := lObjBlockChain.balanceSat;
  memBalancetotalReceived.AsFloat := lObjBlockChain.totalReceived;
  memBalancetotalReceivedSat.AsFloat := lObjBlockChain.totalReceivedSat;
  memBalancetotalSent.AsFloat := lObjBlockChain.totalSent;
//  memBalancetotalSentSat.AsFloat := lObjBlockChain.totalSentSat;
  memBalanceunconfirmedBalance.AsFloat := lObjBlockChain.unconfirmedBalance;
  memBalanceunconfirmedBalanceSat.AsFloat := lObjBlockChain.unconfirmedBalanceSat;
  memBalanceunconfirmedTxApperances.AsFloat := lObjBlockChain.unconfirmedTxApperances;
  memBalancetxApperances.AsFloat := lObjBlockChain.txApperances;
  memBalance.Post;

  lStrStm := TStringStream.Create;
  memBalance.SaveToStream(lStrStm, TFDStorageFormat.sfJSON);

  AtualizaCache(lStrStm.DataString);

  lStrStm.Free;
end;

class constructor TServerMethods1.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TServerMethods1.Destroy;
begin
  FCriticalSec.Free;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetInfosBlockChain: string;
begin
  if FBalanceCache = '' then
  begin
    CarregaInfosBlockChain;
  end;
  Result := FBalanceCache;
end;

function TServerMethods1.InvalidateCache: Boolean;
begin
  AtualizaCache('');
  Result := True;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

