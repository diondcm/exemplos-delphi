//
// Created by the DataSnap proxy generator.
// 03/08/2019 17:47:53
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetHashImagemLogoCommand: TDSRestCommand;
    FGetImagemLogoCommand: TDSRestCommand;
    FGetHashDBCommand: TDSRestCommand;
    FGetDBCommand: TDSRestCommand;
    FLimpaCacheServerCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetHashImagemLogo(const ARequestFilter: string = ''): string;
    function GetImagemLogo(const ARequestFilter: string = ''): string;
    function GetHashDB(const ARequestFilter: string = ''): string;
    function GetDB(const ARequestFilter: string = ''): string;
    procedure LimpaCacheServer;
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

  TServerMethods1_GetHashImagemLogo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetImagemLogo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetHashDB: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetDB: array [0..0] of TDSRestParameterMetaData =
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

function TServerMethods1Client.GetHashImagemLogo(const ARequestFilter: string): string;
begin
  if FGetHashImagemLogoCommand = nil then
  begin
    FGetHashImagemLogoCommand := FConnection.CreateCommand;
    FGetHashImagemLogoCommand.RequestType := 'GET';
    FGetHashImagemLogoCommand.Text := 'TServerMethods1.GetHashImagemLogo';
    FGetHashImagemLogoCommand.Prepare(TServerMethods1_GetHashImagemLogo);
  end;
  FGetHashImagemLogoCommand.Execute(ARequestFilter);
  Result := FGetHashImagemLogoCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetImagemLogo(const ARequestFilter: string): string;
begin
  if FGetImagemLogoCommand = nil then
  begin
    FGetImagemLogoCommand := FConnection.CreateCommand;
    FGetImagemLogoCommand.RequestType := 'GET';
    FGetImagemLogoCommand.Text := 'TServerMethods1.GetImagemLogo';
    FGetImagemLogoCommand.Prepare(TServerMethods1_GetImagemLogo);
  end;
  FGetImagemLogoCommand.Execute(ARequestFilter);
  Result := FGetImagemLogoCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetHashDB(const ARequestFilter: string): string;
begin
  if FGetHashDBCommand = nil then
  begin
    FGetHashDBCommand := FConnection.CreateCommand;
    FGetHashDBCommand.RequestType := 'GET';
    FGetHashDBCommand.Text := 'TServerMethods1.GetHashDB';
    FGetHashDBCommand.Prepare(TServerMethods1_GetHashDB);
  end;
  FGetHashDBCommand.Execute(ARequestFilter);
  Result := FGetHashDBCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetDB(const ARequestFilter: string): string;
begin
  if FGetDBCommand = nil then
  begin
    FGetDBCommand := FConnection.CreateCommand;
    FGetDBCommand.RequestType := 'GET';
    FGetDBCommand.Text := 'TServerMethods1.GetDB';
    FGetDBCommand.Prepare(TServerMethods1_GetDB);
  end;
  FGetDBCommand.Execute(ARequestFilter);
  Result := FGetDBCommand.Parameters[0].Value.GetWideString;
end;

procedure TServerMethods1Client.LimpaCacheServer;
begin
  if FLimpaCacheServerCommand = nil then
  begin
    FLimpaCacheServerCommand := FConnection.CreateCommand;
    FLimpaCacheServerCommand.RequestType := 'GET';
    FLimpaCacheServerCommand.Text := 'TServerMethods1.LimpaCacheServer';
  end;
  FLimpaCacheServerCommand.Execute;
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
  FGetHashImagemLogoCommand.DisposeOf;
  FGetImagemLogoCommand.DisposeOf;
  FGetHashDBCommand.DisposeOf;
  FGetDBCommand.DisposeOf;
  FLimpaCacheServerCommand.DisposeOf;
  inherited;
end;

end.

