//
// Created by the DataSnap proxy generator.
// 18/05/2019 12:26:02
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type

  IDSRestCachedTObject = interface;

  TSMGeralClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FDataModuleDestroyCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetIDCommand: TDSRestCommand;
    FGetThreadIDCommand: TDSRestCommand;
    FGetTotalInstanciasAbertasCommand: TDSRestCommand;
    FGetTotalInstanciasCommand: TDSRestCommand;
    FGetDataServerCommand: TDSRestCommand;
    FGetServerVersionCommand: TDSRestCommand;
    FGetServerCostCommand: TDSRestCommand;
    FGetObjectCommand: TDSRestCommand;
    FGetObjectCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetID(const ARequestFilter: string = ''): Integer;
    function GetThreadID(const ARequestFilter: string = ''): Integer;
    function GetTotalInstanciasAbertas(const ARequestFilter: string = ''): Integer;
    function GetTotalInstancias(const ARequestFilter: string = ''): Integer;
    function GetDataServer(const ARequestFilter: string = ''): TDateTime;
    function GetServerVersion(const ARequestFilter: string = ''): string;
    function GetServerCost(const ARequestFilter: string = ''): Currency;
    function GetObject(const ARequestFilter: string = ''): TObject;
    function GetObject_Cache(const ARequestFilter: string = ''): IDSRestCachedTObject;
  end;

  IDSRestCachedTObject = interface(IDSRestCachedObject<TObject>)
  end;

  TDSRestCachedTObject = class(TDSRestCachedObject<TObject>, IDSRestCachedTObject, IDSRestCachedCommand)
  end;

const
  TSMGeral_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSMGeral_DataModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSMGeral_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMGeral_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMGeral_GetID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TSMGeral_GetThreadID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TSMGeral_GetTotalInstanciasAbertas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TSMGeral_GetTotalInstancias: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TSMGeral_GetDataServer: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 11; TypeName: 'TDateTime')
  );

  TSMGeral_GetServerVersion: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMGeral_GetServerCost: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 25; TypeName: 'Currency')
  );

  TSMGeral_GetObject: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TObject')
  );

  TSMGeral_GetObject_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

procedure TSMGeralClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TSMGeral."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TSMGeral_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

procedure TSMGeralClient.DataModuleDestroy(Sender: TObject);
begin
  if FDataModuleDestroyCommand = nil then
  begin
    FDataModuleDestroyCommand := FConnection.CreateCommand;
    FDataModuleDestroyCommand.RequestType := 'POST';
    FDataModuleDestroyCommand.Text := 'TSMGeral."DataModuleDestroy"';
    FDataModuleDestroyCommand.Prepare(TSMGeral_DataModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDataModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleDestroyCommand.Execute;
end;

function TSMGeralClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSMGeral.EchoString';
    FEchoStringCommand.Prepare(TSMGeral_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMGeralClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSMGeral.ReverseString';
    FReverseStringCommand.Prepare(TSMGeral_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMGeralClient.GetID(const ARequestFilter: string): Integer;
begin
  if FGetIDCommand = nil then
  begin
    FGetIDCommand := FConnection.CreateCommand;
    FGetIDCommand.RequestType := 'GET';
    FGetIDCommand.Text := 'TSMGeral.GetID';
    FGetIDCommand.Prepare(TSMGeral_GetID);
  end;
  FGetIDCommand.Execute(ARequestFilter);
  Result := FGetIDCommand.Parameters[0].Value.GetInt32;
end;

function TSMGeralClient.GetThreadID(const ARequestFilter: string): Integer;
begin
  if FGetThreadIDCommand = nil then
  begin
    FGetThreadIDCommand := FConnection.CreateCommand;
    FGetThreadIDCommand.RequestType := 'GET';
    FGetThreadIDCommand.Text := 'TSMGeral.GetThreadID';
    FGetThreadIDCommand.Prepare(TSMGeral_GetThreadID);
  end;
  FGetThreadIDCommand.Execute(ARequestFilter);
  Result := FGetThreadIDCommand.Parameters[0].Value.GetInt32;
end;

function TSMGeralClient.GetTotalInstanciasAbertas(const ARequestFilter: string): Integer;
begin
  if FGetTotalInstanciasAbertasCommand = nil then
  begin
    FGetTotalInstanciasAbertasCommand := FConnection.CreateCommand;
    FGetTotalInstanciasAbertasCommand.RequestType := 'GET';
    FGetTotalInstanciasAbertasCommand.Text := 'TSMGeral.GetTotalInstanciasAbertas';
    FGetTotalInstanciasAbertasCommand.Prepare(TSMGeral_GetTotalInstanciasAbertas);
  end;
  FGetTotalInstanciasAbertasCommand.Execute(ARequestFilter);
  Result := FGetTotalInstanciasAbertasCommand.Parameters[0].Value.GetInt32;
end;

function TSMGeralClient.GetTotalInstancias(const ARequestFilter: string): Integer;
begin
  if FGetTotalInstanciasCommand = nil then
  begin
    FGetTotalInstanciasCommand := FConnection.CreateCommand;
    FGetTotalInstanciasCommand.RequestType := 'GET';
    FGetTotalInstanciasCommand.Text := 'TSMGeral.GetTotalInstancias';
    FGetTotalInstanciasCommand.Prepare(TSMGeral_GetTotalInstancias);
  end;
  FGetTotalInstanciasCommand.Execute(ARequestFilter);
  Result := FGetTotalInstanciasCommand.Parameters[0].Value.GetInt32;
end;

function TSMGeralClient.GetDataServer(const ARequestFilter: string): TDateTime;
begin
  if FGetDataServerCommand = nil then
  begin
    FGetDataServerCommand := FConnection.CreateCommand;
    FGetDataServerCommand.RequestType := 'GET';
    FGetDataServerCommand.Text := 'TSMGeral.GetDataServer';
    FGetDataServerCommand.Prepare(TSMGeral_GetDataServer);
  end;
  FGetDataServerCommand.Execute(ARequestFilter);
  Result := FGetDataServerCommand.Parameters[0].Value.AsDateTime;
end;

function TSMGeralClient.GetServerVersion(const ARequestFilter: string): string;
begin
  if FGetServerVersionCommand = nil then
  begin
    FGetServerVersionCommand := FConnection.CreateCommand;
    FGetServerVersionCommand.RequestType := 'GET';
    FGetServerVersionCommand.Text := 'TSMGeral.GetServerVersion';
    FGetServerVersionCommand.Prepare(TSMGeral_GetServerVersion);
  end;
  FGetServerVersionCommand.Execute(ARequestFilter);
  Result := FGetServerVersionCommand.Parameters[0].Value.GetWideString;
end;

function TSMGeralClient.GetServerCost(const ARequestFilter: string): Currency;
begin
  if FGetServerCostCommand = nil then
  begin
    FGetServerCostCommand := FConnection.CreateCommand;
    FGetServerCostCommand.RequestType := 'GET';
    FGetServerCostCommand.Text := 'TSMGeral.GetServerCost';
    FGetServerCostCommand.Prepare(TSMGeral_GetServerCost);
  end;
  FGetServerCostCommand.Execute(ARequestFilter);
  Result := FGetServerCostCommand.Parameters[0].Value.AsCurrency;
end;

function TSMGeralClient.GetObject(const ARequestFilter: string): TObject;
begin
  if FGetObjectCommand = nil then
  begin
    FGetObjectCommand := FConnection.CreateCommand;
    FGetObjectCommand.RequestType := 'GET';
    FGetObjectCommand.Text := 'TSMGeral.GetObject';
    FGetObjectCommand.Prepare(TSMGeral_GetObject);
  end;
  FGetObjectCommand.Execute(ARequestFilter);
  if not FGetObjectCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetObjectCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TObject(FUnMarshal.UnMarshal(FGetObjectCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetObjectCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMGeralClient.GetObject_Cache(const ARequestFilter: string): IDSRestCachedTObject;
begin
  if FGetObjectCommand_Cache = nil then
  begin
    FGetObjectCommand_Cache := FConnection.CreateCommand;
    FGetObjectCommand_Cache.RequestType := 'GET';
    FGetObjectCommand_Cache.Text := 'TSMGeral.GetObject';
    FGetObjectCommand_Cache.Prepare(TSMGeral_GetObject_Cache);
  end;
  FGetObjectCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTObject.Create(FGetObjectCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TSMGeralClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMGeralClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMGeralClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FDataModuleDestroyCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetIDCommand.DisposeOf;
  FGetThreadIDCommand.DisposeOf;
  FGetTotalInstanciasAbertasCommand.DisposeOf;
  FGetTotalInstanciasCommand.DisposeOf;
  FGetDataServerCommand.DisposeOf;
  FGetServerVersionCommand.DisposeOf;
  FGetServerCostCommand.DisposeOf;
  FGetObjectCommand.DisposeOf;
  FGetObjectCommand_Cache.DisposeOf;
  inherited;
end;

end.

