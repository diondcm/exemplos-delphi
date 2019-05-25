//
// Created by the DataSnap proxy generator.
// 25/05/2019 10:13:21
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect,
  SMGeral;

type

  IDSRestCachedTListaPessoa = interface;

  TServerMethodsGeralClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetListaPessoaCommand: TDSRestCommand;
    FGetListaPessoaCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetListaPessoa(const ARequestFilter: string = ''): TListaPessoa;
    function GetListaPessoa_Cache(const ARequestFilter: string = ''): IDSRestCachedTListaPessoa;
  end;

  IDSRestCachedTListaPessoa = interface(IDSRestCachedObject<TListaPessoa>)
  end;

  TDSRestCachedTListaPessoa = class(TDSRestCachedObject<TListaPessoa>, IDSRestCachedTListaPessoa, IDSRestCachedCommand)
  end;

const
  TServerMethodsGeral_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethodsGeral_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethodsGeral_GetListaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TListaPessoa')
  );

  TServerMethodsGeral_GetListaPessoa_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethodsGeralClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethodsGeral.EchoString';
    FEchoStringCommand.Prepare(TServerMethodsGeral_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsGeralClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethodsGeral.ReverseString';
    FReverseStringCommand.Prepare(TServerMethodsGeral_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethodsGeralClient.GetListaPessoa(const ARequestFilter: string): TListaPessoa;
begin
  if FGetListaPessoaCommand = nil then
  begin
    FGetListaPessoaCommand := FConnection.CreateCommand;
    FGetListaPessoaCommand.RequestType := 'GET';
    FGetListaPessoaCommand.Text := 'TServerMethodsGeral.GetListaPessoa';
    FGetListaPessoaCommand.Prepare(TServerMethodsGeral_GetListaPessoa);
  end;
  FGetListaPessoaCommand.Execute(ARequestFilter);
  if not FGetListaPessoaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaPessoaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TListaPessoa(FUnMarshal.UnMarshal(FGetListaPessoaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsGeralClient.GetListaPessoa_Cache(const ARequestFilter: string): IDSRestCachedTListaPessoa;
begin
  if FGetListaPessoaCommand_Cache = nil then
  begin
    FGetListaPessoaCommand_Cache := FConnection.CreateCommand;
    FGetListaPessoaCommand_Cache.RequestType := 'GET';
    FGetListaPessoaCommand_Cache.Text := 'TServerMethodsGeral.GetListaPessoa';
    FGetListaPessoaCommand_Cache.Prepare(TServerMethodsGeral_GetListaPessoa_Cache);
  end;
  FGetListaPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTListaPessoa.Create(FGetListaPessoaCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TServerMethodsGeralClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsGeralClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsGeralClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetListaPessoaCommand.DisposeOf;
  FGetListaPessoaCommand_Cache.DisposeOf;
  inherited;
end;

end.
