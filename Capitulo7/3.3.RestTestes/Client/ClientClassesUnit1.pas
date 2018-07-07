//
// Created by the DataSnap proxy generator.
// 07/07/2018 18:03:59
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FDSServerModuleDestroyCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FExibeTickIDCommand: TDSRestCommand;
    FExibeThreadIDCommand: TDSRestCommand;
    FGetCountInstancesCommand: TDSRestCommand;
    FGetTotalCountInstancesCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function ExibeTickID(const ARequestFilter: string = ''): Integer;
    function ExibeThreadID(const ARequestFilter: string = ''): Integer;
    function GetCountInstances(const ARequestFilter: string = ''): Integer;
    function GetTotalCountInstances(const ARequestFilter: string = ''): Integer;
  end;

const
  TServerMethods1_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_DSServerModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

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

  TServerMethods1_ExibeTickID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_ExibeThreadID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetCountInstances: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetTotalCountInstances: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

implementation

procedure TServerMethods1Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'TServerMethods1."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(TServerMethods1_DSServerModuleCreate);
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.Execute;
end;

procedure TServerMethods1Client.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FConnection.CreateCommand;
    FDSServerModuleDestroyCommand.RequestType := 'POST';
    FDSServerModuleDestroyCommand.Text := 'TServerMethods1."DSServerModuleDestroy"';
    FDSServerModuleDestroyCommand.Prepare(TServerMethods1_DSServerModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.Execute;
end;

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

function TServerMethods1Client.ExibeTickID(const ARequestFilter: string): Integer;
begin
  if FExibeTickIDCommand = nil then
  begin
    FExibeTickIDCommand := FConnection.CreateCommand;
    FExibeTickIDCommand.RequestType := 'GET';
    FExibeTickIDCommand.Text := 'TServerMethods1.ExibeTickID';
    FExibeTickIDCommand.Prepare(TServerMethods1_ExibeTickID);
  end;
  FExibeTickIDCommand.Execute(ARequestFilter);
  Result := FExibeTickIDCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.ExibeThreadID(const ARequestFilter: string): Integer;
begin
  if FExibeThreadIDCommand = nil then
  begin
    FExibeThreadIDCommand := FConnection.CreateCommand;
    FExibeThreadIDCommand.RequestType := 'GET';
    FExibeThreadIDCommand.Text := 'TServerMethods1.ExibeThreadID';
    FExibeThreadIDCommand.Prepare(TServerMethods1_ExibeThreadID);
  end;
  FExibeThreadIDCommand.Execute(ARequestFilter);
  Result := FExibeThreadIDCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetCountInstances(const ARequestFilter: string): Integer;
begin
  if FGetCountInstancesCommand = nil then
  begin
    FGetCountInstancesCommand := FConnection.CreateCommand;
    FGetCountInstancesCommand.RequestType := 'GET';
    FGetCountInstancesCommand.Text := 'TServerMethods1.GetCountInstances';
    FGetCountInstancesCommand.Prepare(TServerMethods1_GetCountInstances);
  end;
  FGetCountInstancesCommand.Execute(ARequestFilter);
  Result := FGetCountInstancesCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetTotalCountInstances(const ARequestFilter: string): Integer;
begin
  if FGetTotalCountInstancesCommand = nil then
  begin
    FGetTotalCountInstancesCommand := FConnection.CreateCommand;
    FGetTotalCountInstancesCommand.RequestType := 'GET';
    FGetTotalCountInstancesCommand.Text := 'TServerMethods1.GetTotalCountInstances';
    FGetTotalCountInstancesCommand.Prepare(TServerMethods1_GetTotalCountInstances);
  end;
  FGetTotalCountInstancesCommand.Execute(ARequestFilter);
  Result := FGetTotalCountInstancesCommand.Parameters[0].Value.GetInt32;
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
  FDSServerModuleCreateCommand.DisposeOf;
  FDSServerModuleDestroyCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FExibeTickIDCommand.DisposeOf;
  FExibeThreadIDCommand.DisposeOf;
  FGetCountInstancesCommand.DisposeOf;
  FGetTotalCountInstancesCommand.DisposeOf;
  inherited;
end;

end.

