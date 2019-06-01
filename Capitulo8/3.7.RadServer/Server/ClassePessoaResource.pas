unit ClassePessoaResource;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON, REST.Json,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.BatchMove.JSON,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ClassePessoa;

type
  [ResourceName('Pessoa')]
  TPessoaResource = class(TDataModule)
    FDConnection: TFDConnection;
    qryPessoa: TFDQuery;
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveJSONWriter1: TFDBatchMoveJSONWriter;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TPessoaResource.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  lStm: TStringStream;
begin
  lStm := TStringStream.Create;

  FDBatchMoveJSONWriter1.Stream := lStm;

  qryPessoa.Close;
  qryPessoa.Open;

  FDBatchMove1.Execute;

  AResponse.Body.SetStream(lStm,'application/json', True);
end;

procedure TPessoaResource.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: Integer;
  lStm: TStringStream;
begin
  LItem := StrToInt(ARequest.Params.Values['item']);

  lStm := TStringStream.Create;

  FDBatchMoveJSONWriter1.Stream := lStm;

  qryPessoa.Close;
  qryPessoa.Open('select * from pessoa where id = :id', [LItem]);

  FDBatchMove1.Execute;

  AResponse.Body.SetStream(lStm,'application/json', True);
end;

procedure TPessoaResource.Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  lStm: TStringStream;
  lLista: TListaPessoa;
  lPessoa: TPessoa;
  lQtdIncluido: Integer;
  lObj: string;
begin
  lQtdIncluido := 0;
  lStm := TStringStream.Create;
  lStm.LoadFromStream(ARequest.Body.GetStream);
  lLista := TListaPessoa.FromJsonString(lStm.DataString);

//  lObj := TEncoding.UTF8.GetString(ARequest.Body.GetBytes);
//  lLista := TListaPessoa.FromJsonString(lObj);

  qryPessoa.Close;
  qryPessoa.Open('select * from pessoa where id = :id', [0]);

  for lPessoa in lLista.Items do
  begin
    qryPessoa.Append;
    qryPessoa.FieldByName('id').AsInteger := Trunc(lPessoa.id);
    qryPessoa.FieldByName('nome').AsString := lPessoa.nome;
    qryPessoa.FieldByName('data_nascimento').AsDateTime := lPessoa.data_nascimento;
    qryPessoa.FieldByName('credito').AsCurrency := lPessoa.credito;
    qryPessoa.Post;
    Inc(lQtdIncluido);
  end;

  AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('RowsAff', lQtdIncluido.ToString)), True);
  lStm.Free;
  lLista.Free;
end;

procedure TPessoaResource.PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: Integer;
  lStm: TStringStream;
  lLista: TListaPessoa;
  lPessoa: TPessoa;
  lQtdIncluido: Integer;
  lObj: string;
begin
  LItem := StrToInt(ARequest.Params.Values['item']);

  lQtdIncluido := 0;

  lObj := TEncoding.UTF8.GetString(ARequest.Body.GetBytes);
  lPessoa := TPessoa.FromJsonString(lObj);

  qryPessoa.Close;
  qryPessoa.Open('select * from pessoa where id = :id', [lItem]);

  if not qryPessoa.IsEmpty then
  begin
    qryPessoa.Edit;
    qryPessoa.FieldByName('nome').AsString := lPessoa.nome;
    qryPessoa.FieldByName('data_nascimento').AsDateTime := lPessoa.data_nascimento;
    qryPessoa.FieldByName('credito').AsCurrency := lPessoa.credito;
    qryPessoa.Post;
    Inc(lQtdIncluido);
  end;

  AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('RowsAff', lQtdIncluido.ToString)), True);
//  lStm.Free;
end;

procedure TPessoaResource.DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: Integer;
begin
  LItem := StrToInt(ARequest.Params.Values['item']);

  qryPessoa.Close;
  qryPessoa.ExecSQL('delete from pessoa where id = :id', [LItem]);

  AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('RowsAff', qryPessoa.RowsAffected.ToString)), True);
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TPessoaResource));
end;

initialization
  Register;
end.


