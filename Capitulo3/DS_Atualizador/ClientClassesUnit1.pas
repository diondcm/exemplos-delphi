// 
// Created by the DataSnap proxy generator.
// 27/05/2017 16:19:18
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classe.FileTransfer, Data.DBXJSONReflect;

type

  IDSRestCachedTStatusFileTransfer = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetVersaoAtualCommand: TDSRestCommand;
    FGetVersaoAtualCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetVersaoAtual(pFileName: string; pVersao: string; const ARequestFilter: string = ''): TStatusFileTransfer;
    function GetVersaoAtual_Cache(pFileName: string; pVersao: string; const ARequestFilter: string = ''): IDSRestCachedTStatusFileTransfer;
  end;

  IDSRestCachedTStatusFileTransfer = interface(IDSRestCachedObject<TStatusFileTransfer>)
  end;

  TDSRestCachedTStatusFileTransfer = class(TDSRestCachedObject<TStatusFileTransfer>, IDSRestCachedTStatusFileTransfer, IDSRestCachedCommand)
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

  TServerMethods1_GetVersaoAtual: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pFileName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pVersao'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatusFileTransfer')
  );

  TServerMethods1_GetVersaoAtual_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pFileName'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pVersao'; Direction: 1; DBXType: 26; TypeName: 'string'),
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

function TServerMethods1Client.GetVersaoAtual(pFileName: string; pVersao: string; const ARequestFilter: string): TStatusFileTransfer;
begin
  if FGetVersaoAtualCommand = nil then
  begin
    FGetVersaoAtualCommand := FConnection.CreateCommand;
    FGetVersaoAtualCommand.RequestType := 'GET';
    FGetVersaoAtualCommand.Text := 'TServerMethods1.GetVersaoAtual';
    FGetVersaoAtualCommand.Prepare(TServerMethods1_GetVersaoAtual);
  end;
  FGetVersaoAtualCommand.Parameters[0].Value.SetWideString(pFileName);
  FGetVersaoAtualCommand.Parameters[1].Value.SetWideString(pVersao);
  FGetVersaoAtualCommand.Execute(ARequestFilter);
  if not FGetVersaoAtualCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetVersaoAtualCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatusFileTransfer(FUnMarshal.UnMarshal(FGetVersaoAtualCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetVersaoAtualCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetVersaoAtual_Cache(pFileName: string; pVersao: string; const ARequestFilter: string): IDSRestCachedTStatusFileTransfer;
begin
  if FGetVersaoAtualCommand_Cache = nil then
  begin
    FGetVersaoAtualCommand_Cache := FConnection.CreateCommand;
    FGetVersaoAtualCommand_Cache.RequestType := 'GET';
    FGetVersaoAtualCommand_Cache.Text := 'TServerMethods1.GetVersaoAtual';
    FGetVersaoAtualCommand_Cache.Prepare(TServerMethods1_GetVersaoAtual_Cache);
  end;
  FGetVersaoAtualCommand_Cache.Parameters[0].Value.SetWideString(pFileName);
  FGetVersaoAtualCommand_Cache.Parameters[1].Value.SetWideString(pVersao);
  FGetVersaoAtualCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatusFileTransfer.Create(FGetVersaoAtualCommand_Cache.Parameters[2].Value.GetString);
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
  FGetVersaoAtualCommand.DisposeOf;
  FGetVersaoAtualCommand_Cache.DisposeOf;
  inherited;
end;

end.
