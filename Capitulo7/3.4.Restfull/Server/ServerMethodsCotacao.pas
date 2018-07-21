unit ServerMethodsCotacao;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Rest.Json, System.DateUtils, System.Threading, System.SyncObjs,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageJSON, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Classe.Cotacao;

type
  TMethodsCotacao = class(TDSServerModule)
    memCotacao: TFDMemTable;
    memCotacaodescription: TStringField;
    memCotacaoperiod: TStringField;
    memCotacaounit: TStringField;
    memCotacaoname: TStringField;
    memCotacaodata: TDateTimeField;
    memCotacaovalor: TCurrencyField;
    RESTClient: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest: TRESTRequest;
  private
    class var
      FCotacaoCache: string;
      FCriticalSec: TCriticalSection;
    class procedure AlteraCache(const pCotacao: string);
  public
     class constructor Create;
     class destructor Destroy;
    function GetDataAtual: TDatetime;
    function GetCotacoes: string;
    procedure InvalidaCacheServer;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TMethodsCotacao }

class procedure TMethodsCotacao.AlteraCache(const pCotacao: string);
begin
  FCriticalSec.Acquire;
  try
    FCotacaoCache := pCotacao;
  finally
    FCriticalSec.Release;
  end;
end;

class constructor TMethodsCotacao.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TMethodsCotacao.Destroy;
begin
  FCriticalSec.Free;
end;

function TMethodsCotacao.GetCotacoes: string;
var
  lRetorno: string;
  lCotacao: TCotacao;
  lVal: TValor;
  lStm: TStringStream;
begin
  if FCotacaoCache = '' then
  begin
    memCotacao.Open;
    RESTRequest.Execute;
    lRetorno := RESTResponse1.Content;
    lCotacao := TJson.JsonToObject<TCotacao>(lRetorno);
    if Assigned(lCotacao) then
    begin
      for lVal in lCotacao.values do
      begin
        memCotacao.Append;
        memCotacaodescription.AsString := lCotacao.description;
        memCotacaoperiod.AsString := lCotacao.period;
        memCotacaounit.AsString := lCotacao.&unit;
        memCotacaoname.AsString := lCotacao.name;
        memCotacaodata.AsDateTime := UnixToDateTime(lVal.x);
        memCotacaovalor.AsCurrency := lVal.y;
        memCotacao.Post;
      end;
    end else begin
      // mostra status: sem result
    end;

    if not memCotacao.IsEmpty then
    begin
      lStm := TStringStream.Create;
      memCotacao.SaveToStream(lStm, TFDStorageFormat.sfJSON);

      AlteraCache(lStm.DataString);

      lStm.Free;
    end;
  end;

  Result := FCotacaoCache;
end;

function TMethodsCotacao.GetDataAtual: TDatetime;
begin
  Result := Now;
end;

procedure TMethodsCotacao.InvalidaCacheServer;
begin
  AlteraCache('');
end;

end.

