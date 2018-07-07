//
// Created by the DataSnap proxy generator.
// 07/07/2018 10:41:03
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FRetornaDataAtualCommand: TDSRestCommand;
    FRetornaDataAtual2Command: TDSRestCommand;
    FRetonaDataIso8601Command: TDSRestCommand;
    FRetonaDataUnixCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function RetornaDataAtual(const ARequestFilter: string = ''): TDateTime;
    function RetornaDataAtual2(const ARequestFilter: string = ''): string;
    function RetonaDataIso8601(const ARequestFilter: string = ''): string;
    function RetonaDataUnix(const ARequestFilter: string = ''): string;
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

  TServerMethods1_RetornaDataAtual: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 11; TypeName: 'TDateTime')
  );

  TServerMethods1_RetornaDataAtual2: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_RetonaDataIso8601: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_RetonaDataUnix: array [0..0] of TDSRestParameterMetaData =
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

function TServerMethods1Client.RetornaDataAtual(const ARequestFilter: string): TDateTime;
begin
  if FRetornaDataAtualCommand = nil then
  begin
    FRetornaDataAtualCommand := FConnection.CreateCommand;
    FRetornaDataAtualCommand.RequestType := 'GET';
    FRetornaDataAtualCommand.Text := 'TServerMethods1.RetornaDataAtual';
    FRetornaDataAtualCommand.Prepare(TServerMethods1_RetornaDataAtual);
  end;
  FRetornaDataAtualCommand.Execute(ARequestFilter);
  Result := FRetornaDataAtualCommand.Parameters[0].Value.AsDateTime;
end;

function TServerMethods1Client.RetornaDataAtual2(const ARequestFilter: string): string;
begin
  if FRetornaDataAtual2Command = nil then
  begin
    FRetornaDataAtual2Command := FConnection.CreateCommand;
    FRetornaDataAtual2Command.RequestType := 'GET';
    FRetornaDataAtual2Command.Text := 'TServerMethods1.RetornaDataAtual2';
    FRetornaDataAtual2Command.Prepare(TServerMethods1_RetornaDataAtual2);
  end;
  FRetornaDataAtual2Command.Execute(ARequestFilter);
  Result := FRetornaDataAtual2Command.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.RetonaDataIso8601(const ARequestFilter: string): string;
begin
  if FRetonaDataIso8601Command = nil then
  begin
    FRetonaDataIso8601Command := FConnection.CreateCommand;
    FRetonaDataIso8601Command.RequestType := 'GET';
    FRetonaDataIso8601Command.Text := 'TServerMethods1.RetonaDataIso8601';
    FRetonaDataIso8601Command.Prepare(TServerMethods1_RetonaDataIso8601);
  end;
  FRetonaDataIso8601Command.Execute(ARequestFilter);
  Result := FRetonaDataIso8601Command.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.RetonaDataUnix(const ARequestFilter: string): string;
begin
  if FRetonaDataUnixCommand = nil then
  begin
    FRetonaDataUnixCommand := FConnection.CreateCommand;
    FRetonaDataUnixCommand.RequestType := 'GET';
    FRetonaDataUnixCommand.Text := 'TServerMethods1.RetonaDataUnix';
    FRetonaDataUnixCommand.Prepare(TServerMethods1_RetonaDataUnix);
  end;
  FRetonaDataUnixCommand.Execute(ARequestFilter);
  Result := FRetonaDataUnixCommand.Parameters[0].Value.GetWideString;
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
  FRetornaDataAtualCommand.DisposeOf;
  FRetornaDataAtual2Command.DisposeOf;
  FRetonaDataIso8601Command.DisposeOf;
  FRetonaDataUnixCommand.DisposeOf;
  inherited;
end;

end.
