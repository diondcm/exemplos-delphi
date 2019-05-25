//
// Created by the DataSnap proxy generator.
// 25/05/2019 14:37:47
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetFileCommand: TDSRestCommand;
    FGetFileCommand_Cache: TDSRestCommand;
    FSetFileCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetFile(pAbreArq: string; out pSize: Int64; const ARequestFilter: string = ''): TStream;
    function GetFile_Cache(pAbreArq: string; out pSize: Int64; const ARequestFilter: string = ''): IDSRestCachedStream;
    function SetFile(pAbrevArquivo: string; pOperacao: string; pStm: TStream; const ARequestFilter: string = ''): Int64;
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

  TServerMethods1_GetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pSize'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TServerMethods1_GetFile_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pSize'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetFile: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pAbrevArquivo'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pOperacao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pStm'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
    (Name: ''; Direction: 4; DBXType: 18; TypeName: 'Int64')
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

function TServerMethods1Client.GetFile(pAbreArq: string; out pSize: Int64; const ARequestFilter: string): TStream;
begin
  if FGetFileCommand = nil then
  begin
    FGetFileCommand := FConnection.CreateCommand;
    FGetFileCommand.RequestType := 'GET';
    FGetFileCommand.Text := 'TServerMethods1.GetFile';
    FGetFileCommand.Prepare(TServerMethods1_GetFile);
  end;
  FGetFileCommand.Parameters[0].Value.SetWideString(pAbreArq);
  FGetFileCommand.Execute(ARequestFilter);
  pSize := FGetFileCommand.Parameters[1].Value.GetInt64;
  Result := FGetFileCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;

function TServerMethods1Client.GetFile_Cache(pAbreArq: string; out pSize: Int64; const ARequestFilter: string): IDSRestCachedStream;
begin
  if FGetFileCommand_Cache = nil then
  begin
    FGetFileCommand_Cache := FConnection.CreateCommand;
    FGetFileCommand_Cache.RequestType := 'GET';
    FGetFileCommand_Cache.Text := 'TServerMethods1.GetFile';
    FGetFileCommand_Cache.Prepare(TServerMethods1_GetFile_Cache);
  end;
  FGetFileCommand_Cache.Parameters[0].Value.SetWideString(pAbreArq);
  FGetFileCommand_Cache.ExecuteCache(ARequestFilter);
  pSize := FGetFileCommand_Cache.Parameters[1].Value.GetInt64;
  Result := TDSRestCachedStream.Create(FGetFileCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethods1Client.SetFile(pAbrevArquivo: string; pOperacao: string; pStm: TStream; const ARequestFilter: string): Int64;
begin
  if FSetFileCommand = nil then
  begin
    FSetFileCommand := FConnection.CreateCommand;
    FSetFileCommand.RequestType := 'POST';
    FSetFileCommand.Text := 'TServerMethods1."SetFile"';
    FSetFileCommand.Prepare(TServerMethods1_SetFile);
  end;
  FSetFileCommand.Parameters[0].Value.SetWideString(pAbrevArquivo);
  FSetFileCommand.Parameters[1].Value.SetWideString(pOperacao);
  FSetFileCommand.Parameters[2].Value.SetStream(pStm, FInstanceOwner);
  FSetFileCommand.Execute(ARequestFilter);
  Result := FSetFileCommand.Parameters[3].Value.GetInt64;
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
  FGetFileCommand.DisposeOf;
  FGetFileCommand_Cache.DisposeOf;
  FSetFileCommand.DisposeOf;
  inherited;
end;

end.

