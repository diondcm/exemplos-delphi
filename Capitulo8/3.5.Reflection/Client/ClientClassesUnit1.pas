//
// Created by the DataSnap proxy generator.
// 01/06/2019 10:55:52
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, ClasseStatus, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;
  IDSRestCachedTStatus = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetDadosCommand: TDSRestCommand;
    FGetDadosCommand_Cache: TDSRestCommand;
    FSetDadosCommand: TDSRestCommand;
    FSetDadosCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetDados(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetDados_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function SetDados(pDados: TFDJSONDataSets; const ARequestFilter: string = ''): TStatus;
    function SetDados_Cache(pDados: TFDJSONDataSets; const ARequestFilter: string = ''): IDSRestCachedTStatus;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;
  IDSRestCachedTStatus = interface(IDSRestCachedObject<TStatus>)
  end;

  TDSRestCachedTStatus = class(TDSRestCachedObject<TStatus>, IDSRestCachedTStatus, IDSRestCachedCommand)
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

  TServerMethods1_GetDados: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetDados_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetDados: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pDados'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatus')
  );

  TServerMethods1_SetDados_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pDados'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
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

function TServerMethods1Client.GetDados(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetDadosCommand = nil then
  begin
    FGetDadosCommand := FConnection.CreateCommand;
    FGetDadosCommand.RequestType := 'GET';
    FGetDadosCommand.Text := 'TServerMethods1.GetDados';
    FGetDadosCommand.Prepare(TServerMethods1_GetDados);
  end;
  FGetDadosCommand.Execute(ARequestFilter);
  if not FGetDadosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetDadosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetDadosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetDadosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetDados_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetDadosCommand_Cache = nil then
  begin
    FGetDadosCommand_Cache := FConnection.CreateCommand;
    FGetDadosCommand_Cache.RequestType := 'GET';
    FGetDadosCommand_Cache.Text := 'TServerMethods1.GetDados';
    FGetDadosCommand_Cache.Prepare(TServerMethods1_GetDados_Cache);
  end;
  FGetDadosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetDadosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.SetDados(pDados: TFDJSONDataSets; const ARequestFilter: string): TStatus;
begin
  if FSetDadosCommand = nil then
  begin
    FSetDadosCommand := FConnection.CreateCommand;
    FSetDadosCommand.RequestType := 'POST';
    FSetDadosCommand.Text := 'TServerMethods1."SetDados"';
    FSetDadosCommand.Prepare(TServerMethods1_SetDados);
  end;
  if not Assigned(pDados) then
    FSetDadosCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetDadosCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetDadosCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pDados), True);
      if FInstanceOwner then
        pDados.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetDadosCommand.Execute(ARequestFilter);
  if not FSetDadosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSetDadosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatus(FUnMarshal.UnMarshal(FSetDadosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSetDadosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.SetDados_Cache(pDados: TFDJSONDataSets; const ARequestFilter: string): IDSRestCachedTStatus;
begin
  if FSetDadosCommand_Cache = nil then
  begin
    FSetDadosCommand_Cache := FConnection.CreateCommand;
    FSetDadosCommand_Cache.RequestType := 'POST';
    FSetDadosCommand_Cache.Text := 'TServerMethods1."SetDados"';
    FSetDadosCommand_Cache.Prepare(TServerMethods1_SetDados_Cache);
  end;
  if not Assigned(pDados) then
    FSetDadosCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetDadosCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetDadosCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pDados), True);
      if FInstanceOwner then
        pDados.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetDadosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatus.Create(FSetDadosCommand_Cache.Parameters[1].Value.GetString);
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
  FGetDadosCommand.DisposeOf;
  FGetDadosCommand_Cache.DisposeOf;
  FSetDadosCommand.DisposeOf;
  FSetDadosCommand_Cache.DisposeOf;
  inherited;
end;

end.

