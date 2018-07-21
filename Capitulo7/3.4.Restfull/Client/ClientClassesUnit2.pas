// 
// Created by the DataSnap proxy generator.
// 14/07/2018 17:42:25
// 

unit ClientClassesUnit2;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetClientesCommand: TDSRestCommand;
    FGetClientesCommand_Cache: TDSRestCommand;
    FSetClientesCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetClientes(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetClientes_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SetClientes(pDeltaList: TFDJSONDeltas; const ARequestFilter: string = ''): Boolean;
  end;

  TMethodsCotacaoClient = class(TDSAdminRestClient)
  private
    FGetDataAtualCommand: TDSRestCommand;
    FGetCotacoesCommand: TDSRestCommand;
    FInvalidaCacheServerCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetDataAtual(const ARequestFilter: string = ''): TDateTime;
    function GetCotacoes(const ARequestFilter: string = ''): string;
    procedure InvalidaCacheServer;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetClientes: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetClientes_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetClientes: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pDeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TMethodsCotacao_GetDataAtual: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 11; TypeName: 'TDateTime')
  );

  TMethodsCotacao_GetCotacoes: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetClientes(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetClientesCommand = nil then
  begin
    FGetClientesCommand := FConnection.CreateCommand;
    FGetClientesCommand.RequestType := 'GET';
    FGetClientesCommand.Text := 'TServerMethods1.GetClientes';
    FGetClientesCommand.Prepare(TServerMethods1_GetClientes);
  end;
  FGetClientesCommand.Execute(ARequestFilter);
  if not FGetClientesCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetClientesCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetClientesCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetClientes_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetClientesCommand_Cache = nil then
  begin
    FGetClientesCommand_Cache := FConnection.CreateCommand;
    FGetClientesCommand_Cache.RequestType := 'GET';
    FGetClientesCommand_Cache.Text := 'TServerMethods1.GetClientes';
    FGetClientesCommand_Cache.Prepare(TServerMethods1_GetClientes_Cache);
  end;
  FGetClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetClientesCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.SetClientes(pDeltaList: TFDJSONDeltas; const ARequestFilter: string): Boolean;
begin
  if FSetClientesCommand = nil then
  begin
    FSetClientesCommand := FConnection.CreateCommand;
    FSetClientesCommand.RequestType := 'POST';
    FSetClientesCommand.Text := 'TServerMethods1."SetClientes"';
    FSetClientesCommand.Prepare(TServerMethods1_SetClientes);
  end;
  if not Assigned(pDeltaList) then
    FSetClientesCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetClientesCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetClientesCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pDeltaList), True);
      if FInstanceOwner then
        pDeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetClientesCommand.Execute(ARequestFilter);
  Result := FSetClientesCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetClientesCommand.DisposeOf;
  FGetClientesCommand_Cache.DisposeOf;
  FSetClientesCommand.DisposeOf;
  inherited;
end;

function TMethodsCotacaoClient.GetDataAtual(const ARequestFilter: string): TDateTime;
begin
  if FGetDataAtualCommand = nil then
  begin
    FGetDataAtualCommand := FConnection.CreateCommand;
    FGetDataAtualCommand.RequestType := 'GET';
    FGetDataAtualCommand.Text := 'TMethodsCotacao.GetDataAtual';
    FGetDataAtualCommand.Prepare(TMethodsCotacao_GetDataAtual);
  end;
  FGetDataAtualCommand.Execute(ARequestFilter);
  Result := FGetDataAtualCommand.Parameters[0].Value.AsDateTime;
end;

function TMethodsCotacaoClient.GetCotacoes(const ARequestFilter: string): string;
begin
  if FGetCotacoesCommand = nil then
  begin
    FGetCotacoesCommand := FConnection.CreateCommand;
    FGetCotacoesCommand.RequestType := 'GET';
    FGetCotacoesCommand.Text := 'TMethodsCotacao.GetCotacoes';
    FGetCotacoesCommand.Prepare(TMethodsCotacao_GetCotacoes);
  end;
  FGetCotacoesCommand.Execute(ARequestFilter);
  Result := FGetCotacoesCommand.Parameters[0].Value.GetWideString;
end;

procedure TMethodsCotacaoClient.InvalidaCacheServer;
begin
  if FInvalidaCacheServerCommand = nil then
  begin
    FInvalidaCacheServerCommand := FConnection.CreateCommand;
    FInvalidaCacheServerCommand.RequestType := 'GET';
    FInvalidaCacheServerCommand.Text := 'TMethodsCotacao.InvalidaCacheServer';
  end;
  FInvalidaCacheServerCommand.Execute;
end;

constructor TMethodsCotacaoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TMethodsCotacaoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TMethodsCotacaoClient.Destroy;
begin
  FGetDataAtualCommand.DisposeOf;
  FGetCotacoesCommand.DisposeOf;
  FInvalidaCacheServerCommand.DisposeOf;
  inherited;
end;

end.
