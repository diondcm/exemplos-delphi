//
// Created by the DataSnap proxy generator.
// 05/08/2017 15:58:24
// 

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, System.Generics.Collections, Data.DBXJSONReflect,
  Classe.Configuracao;

type

  IDSRestCachedTList<TConfiguracao> = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FFDConnectionBeforeConnectCommand: TDSRestCommand;
    FFDConnectionAfterConnectCommand: TDSRestCommand;
    FGravaConfigCommand: TDSRestCommand;
    FGetConfigCommand: TDSRestCommand;
    FGetConfigCommand_Cache: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    function GravaConfig(pConfigList: TList<Classe.Configuracao.TConfiguracao>; const ARequestFilter: string = ''): string;
    function GetConfig(pUsuario: string; pEmpresa: string; const ARequestFilter: string = ''): TList<Classe.Configuracao.TConfiguracao>;
    function GetConfig_Cache(pUsuario: string; pEmpresa: string; const ARequestFilter: string = ''): IDSRestCachedTList<Classe.Configuracao.TConfiguracao>;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  IDSRestCachedTList<TConfiguracao> = interface(IDSRestCachedObject<TList<TConfiguracao>>)
  end;

  TDSRestCachedTList<TConfiguracao> = class(TDSRestCachedObject<TList<TConfiguracao>>, IDSRestCachedTList<TConfiguracao>, IDSRestCachedCommand)
  end;

const
  TServerMethods1_FDConnectionBeforeConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_FDConnectionAfterConnect: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_GravaConfig: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pConfigList'; Direction: 1; DBXType: 37; TypeName: 'TList<Classe.Configuracao.TConfiguracao>'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetConfig: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pUsuario'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pEmpresa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TList<Classe.Configuracao.TConfiguracao>')
  );

  TServerMethods1_GetConfig_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pUsuario'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pEmpresa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
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

implementation

procedure TServerMethods1Client.FDConnectionBeforeConnect(Sender: TObject);
begin
  if FFDConnectionBeforeConnectCommand = nil then
  begin
    FFDConnectionBeforeConnectCommand := FConnection.CreateCommand;
    FFDConnectionBeforeConnectCommand.RequestType := 'POST';
    FFDConnectionBeforeConnectCommand.Text := 'TServerMethods1."FDConnectionBeforeConnect"';
    FFDConnectionBeforeConnectCommand.Prepare(TServerMethods1_FDConnectionBeforeConnect);
  end;
  if not Assigned(Sender) then
    FFDConnectionBeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDConnectionBeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnectionBeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnectionBeforeConnectCommand.Execute;
end;

procedure TServerMethods1Client.FDConnectionAfterConnect(Sender: TObject);
begin
  if FFDConnectionAfterConnectCommand = nil then
  begin
    FFDConnectionAfterConnectCommand := FConnection.CreateCommand;
    FFDConnectionAfterConnectCommand.RequestType := 'POST';
    FFDConnectionAfterConnectCommand.Text := 'TServerMethods1."FDConnectionAfterConnect"';
    FFDConnectionAfterConnectCommand.Prepare(TServerMethods1_FDConnectionAfterConnect);
  end;
  if not Assigned(Sender) then
    FFDConnectionAfterConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FFDConnectionAfterConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnectionAfterConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnectionAfterConnectCommand.Execute;
end;

function TServerMethods1Client.GravaConfig(pConfigList: TList<Classe.Configuracao.TConfiguracao>; const ARequestFilter: string): string;
begin
  if FGravaConfigCommand = nil then
  begin
    FGravaConfigCommand := FConnection.CreateCommand;
    FGravaConfigCommand.RequestType := 'POST';
    FGravaConfigCommand.Text := 'TServerMethods1."GravaConfig"';
    FGravaConfigCommand.Prepare(TServerMethods1_GravaConfig);
  end;
  if not Assigned(pConfigList) then
    FGravaConfigCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FGravaConfigCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FGravaConfigCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pConfigList), True);
      if FInstanceOwner then
        pConfigList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FGravaConfigCommand.Execute(ARequestFilter);
  Result := FGravaConfigCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetConfig(pUsuario: string; pEmpresa: string; const ARequestFilter: string): TList<Classe.Configuracao.TConfiguracao>;
begin
  if FGetConfigCommand = nil then
  begin
    FGetConfigCommand := FConnection.CreateCommand;
    FGetConfigCommand.RequestType := 'GET';
    FGetConfigCommand.Text := 'TServerMethods1.GetConfig';
    FGetConfigCommand.Prepare(TServerMethods1_GetConfig);
  end;
  FGetConfigCommand.Parameters[0].Value.SetWideString(pUsuario);
  FGetConfigCommand.Parameters[1].Value.SetWideString(pEmpresa);
  FGetConfigCommand.Execute(ARequestFilter);
  if not FGetConfigCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetConfigCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TList<Classe.Configuracao.TConfiguracao>(FUnMarshal.UnMarshal(FGetConfigCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetConfigCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetConfig_Cache(pUsuario: string; pEmpresa: string; const ARequestFilter: string): IDSRestCachedTList<Classe.Configuracao.TConfiguracao>;
begin
  if FGetConfigCommand_Cache = nil then
  begin
    FGetConfigCommand_Cache := FConnection.CreateCommand;
    FGetConfigCommand_Cache.RequestType := 'GET';
    FGetConfigCommand_Cache.Text := 'TServerMethods1.GetConfig';
    FGetConfigCommand_Cache.Prepare(TServerMethods1_GetConfig_Cache);
  end;
  FGetConfigCommand_Cache.Parameters[0].Value.SetWideString(pUsuario);
  FGetConfigCommand_Cache.Parameters[1].Value.SetWideString(pEmpresa);
  FGetConfigCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTList<Classe.Configuracao.TConfiguracao>.Create(FGetConfigCommand_Cache.Parameters[2].Value.GetString);
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
  FFDConnectionBeforeConnectCommand.DisposeOf;
  FFDConnectionAfterConnectCommand.DisposeOf;
  FGravaConfigCommand.DisposeOf;
  FGetConfigCommand.DisposeOf;
  FGetConfigCommand_Cache.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

end.
