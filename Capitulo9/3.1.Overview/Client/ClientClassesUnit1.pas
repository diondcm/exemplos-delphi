//
// Created by the DataSnap proxy generator.
// 16/05/2020 17:48:23
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classes.Transporte.Pessoa, System.Generics.Collections, Data.DBXJSONReflect;

type

  IDSRestCachedTTransportePessoa = interface;
  IDSRestCachedTObjectList<TPessoa> = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FDSServerModuleDestroyCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FExpoCommand: TDSRestCommand;
    FGetPessoaCommand: TDSRestCommand;
    FGetPessoaCommand_Cache: TDSRestCommand;
    FSetPessoaCommand: TDSRestCommand;
    FGetPessoasCommand: TDSRestCommand;
    FGetPessoasCommand_Cache: TDSRestCommand;
    FGetLogCommand: TDSRestCommand;
    FGetDadosCommand: TDSRestCommand;
    FGetThreadIDCommand: TDSRestCommand;
    FGetQtdAtivosCommand: TDSRestCommand;
    FGetQtdGeralCommand: TDSRestCommand;
    FGetQtdMaxAtivosCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function Expo(pValor: Integer; const ARequestFilter: string = ''): Integer;
    function GetPessoa(pID: Integer; const ARequestFilter: string = ''): TTransportePessoa;
    function GetPessoa_Cache(pID: Integer; const ARequestFilter: string = ''): IDSRestCachedTTransportePessoa;
    function SetPessoa(pPessoa: TPessoa; const ARequestFilter: string = ''): Integer;
    function GetPessoas(const ARequestFilter: string = ''): TObjectList<Classes.Transporte.Pessoa.TPessoa>;
    function GetPessoas_Cache(const ARequestFilter: string = ''): IDSRestCachedTObjectList<Classes.Transporte.Pessoa.TPessoa>;
    function GetLog(const ARequestFilter: string = ''): string;
    function GetDados(pQtdReg: Integer; const ARequestFilter: string = ''): string;
    function GetThreadID(const ARequestFilter: string = ''): Integer;
    function GetQtdAtivos(const ARequestFilter: string = ''): Integer;
    function GetQtdGeral(const ARequestFilter: string = ''): Integer;
    function GetQtdMaxAtivos(const ARequestFilter: string = ''): Integer;
  end;

  IDSRestCachedTTransportePessoa = interface(IDSRestCachedObject<TTransportePessoa>)
  end;

  TDSRestCachedTTransportePessoa = class(TDSRestCachedObject<TTransportePessoa>, IDSRestCachedTTransportePessoa, IDSRestCachedCommand)
  end;
  IDSRestCachedTObjectList<TPessoa> = interface(IDSRestCachedObject<TObjectList<Classes.Transporte.Pessoa.TPessoa>>)
  end;

  TDSRestCachedTObjectList<TPessoa> = class(TDSRestCachedObject<TObjectList<Classes.Transporte.Pessoa.TPessoa>>, IDSRestCachedTObjectList<Classes.Transporte.Pessoa.TPessoa>, IDSRestCachedCommand)
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

  TServerMethods1_Expo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValor'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TTransportePessoa')
  );

  TServerMethods1_GetPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pPessoa'; Direction: 1; DBXType: 37; TypeName: 'TPessoa'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetPessoas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TObjectList<Classes.Transporte.Pessoa.TPessoa>')
  );

  TServerMethods1_GetPessoas_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetLog: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetDados: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pQtdReg'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetThreadID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetQtdAtivos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetQtdGeral: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetQtdMaxAtivos: array [0..0] of TDSRestParameterMetaData =
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

function TServerMethods1Client.Expo(pValor: Integer; const ARequestFilter: string): Integer;
begin
  if FExpoCommand = nil then
  begin
    FExpoCommand := FConnection.CreateCommand;
    FExpoCommand.RequestType := 'GET';
    FExpoCommand.Text := 'TServerMethods1.Expo';
    FExpoCommand.Prepare(TServerMethods1_Expo);
  end;
  FExpoCommand.Parameters[0].Value.SetInt32(pValor);
  FExpoCommand.Execute(ARequestFilter);
  Result := FExpoCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.GetPessoa(pID: Integer; const ARequestFilter: string): TTransportePessoa;
begin
  if FGetPessoaCommand = nil then
  begin
    FGetPessoaCommand := FConnection.CreateCommand;
    FGetPessoaCommand.RequestType := 'GET';
    FGetPessoaCommand.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand.Prepare(TServerMethods1_GetPessoa);
  end;
  FGetPessoaCommand.Parameters[0].Value.SetInt32(pID);
  FGetPessoaCommand.Execute(ARequestFilter);
  if not FGetPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TTransportePessoa(FUnMarshal.UnMarshal(FGetPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoa_Cache(pID: Integer; const ARequestFilter: string): IDSRestCachedTTransportePessoa;
begin
  if FGetPessoaCommand_Cache = nil then
  begin
    FGetPessoaCommand_Cache := FConnection.CreateCommand;
    FGetPessoaCommand_Cache.RequestType := 'GET';
    FGetPessoaCommand_Cache.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand_Cache.Prepare(TServerMethods1_GetPessoa_Cache);
  end;
  FGetPessoaCommand_Cache.Parameters[0].Value.SetInt32(pID);
  FGetPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTTransportePessoa.Create(FGetPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.SetPessoa(pPessoa: TPessoa; const ARequestFilter: string): Integer;
begin
  if FSetPessoaCommand = nil then
  begin
    FSetPessoaCommand := FConnection.CreateCommand;
    FSetPessoaCommand.RequestType := 'POST';
    FSetPessoaCommand.Text := 'TServerMethods1."SetPessoa"';
    FSetPessoaCommand.Prepare(TServerMethods1_SetPessoa);
  end;
  if not Assigned(pPessoa) then
    FSetPessoaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetPessoaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetPessoaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pPessoa), True);
      if FInstanceOwner then
        pPessoa.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetPessoaCommand.Execute(ARequestFilter);
  Result := FSetPessoaCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.GetPessoas(const ARequestFilter: string): TObjectList<Classes.Transporte.Pessoa.TPessoa>;
begin
  if FGetPessoasCommand = nil then
  begin
    FGetPessoasCommand := FConnection.CreateCommand;
    FGetPessoasCommand.RequestType := 'GET';
    FGetPessoasCommand.Text := 'TServerMethods1.GetPessoas';
    FGetPessoasCommand.Prepare(TServerMethods1_GetPessoas);
  end;
  FGetPessoasCommand.Execute(ARequestFilter);
  if not FGetPessoasCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoasCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TObjectList<Classes.Transporte.Pessoa.TPessoa>(FUnMarshal.UnMarshal(FGetPessoasCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoas_Cache(const ARequestFilter: string): IDSRestCachedTObjectList<Classes.Transporte.Pessoa.TPessoa>;
begin
  if FGetPessoasCommand_Cache = nil then
  begin
    FGetPessoasCommand_Cache := FConnection.CreateCommand;
    FGetPessoasCommand_Cache.RequestType := 'GET';
    FGetPessoasCommand_Cache.Text := 'TServerMethods1.GetPessoas';
    FGetPessoasCommand_Cache.Prepare(TServerMethods1_GetPessoas_Cache);
  end;
  FGetPessoasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTObjectList<Classes.Transporte.Pessoa.TPessoa>.Create(FGetPessoasCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.GetLog(const ARequestFilter: string): string;
begin
  if FGetLogCommand = nil then
  begin
    FGetLogCommand := FConnection.CreateCommand;
    FGetLogCommand.RequestType := 'GET';
    FGetLogCommand.Text := 'TServerMethods1.GetLog';
    FGetLogCommand.Prepare(TServerMethods1_GetLog);
  end;
  FGetLogCommand.Execute(ARequestFilter);
  Result := FGetLogCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetDados(pQtdReg: Integer; const ARequestFilter: string): string;
begin
  if FGetDadosCommand = nil then
  begin
    FGetDadosCommand := FConnection.CreateCommand;
    FGetDadosCommand.RequestType := 'GET';
    FGetDadosCommand.Text := 'TServerMethods1.GetDados';
    FGetDadosCommand.Prepare(TServerMethods1_GetDados);
  end;
  FGetDadosCommand.Parameters[0].Value.SetInt32(pQtdReg);
  FGetDadosCommand.Execute(ARequestFilter);
  Result := FGetDadosCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetThreadID(const ARequestFilter: string): Integer;
begin
  if FGetThreadIDCommand = nil then
  begin
    FGetThreadIDCommand := FConnection.CreateCommand;
    FGetThreadIDCommand.RequestType := 'GET';
    FGetThreadIDCommand.Text := 'TServerMethods1.GetThreadID';
    FGetThreadIDCommand.Prepare(TServerMethods1_GetThreadID);
  end;
  FGetThreadIDCommand.Execute(ARequestFilter);
  Result := FGetThreadIDCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetQtdAtivos(const ARequestFilter: string): Integer;
begin
  if FGetQtdAtivosCommand = nil then
  begin
    FGetQtdAtivosCommand := FConnection.CreateCommand;
    FGetQtdAtivosCommand.RequestType := 'GET';
    FGetQtdAtivosCommand.Text := 'TServerMethods1.GetQtdAtivos';
    FGetQtdAtivosCommand.Prepare(TServerMethods1_GetQtdAtivos);
  end;
  FGetQtdAtivosCommand.Execute(ARequestFilter);
  Result := FGetQtdAtivosCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetQtdGeral(const ARequestFilter: string): Integer;
begin
  if FGetQtdGeralCommand = nil then
  begin
    FGetQtdGeralCommand := FConnection.CreateCommand;
    FGetQtdGeralCommand.RequestType := 'GET';
    FGetQtdGeralCommand.Text := 'TServerMethods1.GetQtdGeral';
    FGetQtdGeralCommand.Prepare(TServerMethods1_GetQtdGeral);
  end;
  FGetQtdGeralCommand.Execute(ARequestFilter);
  Result := FGetQtdGeralCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetQtdMaxAtivos(const ARequestFilter: string): Integer;
begin
  if FGetQtdMaxAtivosCommand = nil then
  begin
    FGetQtdMaxAtivosCommand := FConnection.CreateCommand;
    FGetQtdMaxAtivosCommand.RequestType := 'GET';
    FGetQtdMaxAtivosCommand.Text := 'TServerMethods1.GetQtdMaxAtivos';
    FGetQtdMaxAtivosCommand.Prepare(TServerMethods1_GetQtdMaxAtivos);
  end;
  FGetQtdMaxAtivosCommand.Execute(ARequestFilter);
  Result := FGetQtdMaxAtivosCommand.Parameters[0].Value.GetInt32;
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
  FExpoCommand.DisposeOf;
  FGetPessoaCommand.DisposeOf;
  FGetPessoaCommand_Cache.DisposeOf;
  FSetPessoaCommand.DisposeOf;
  FGetPessoasCommand.DisposeOf;
  FGetPessoasCommand_Cache.DisposeOf;
  FGetLogCommand.DisposeOf;
  FGetDadosCommand.DisposeOf;
  FGetThreadIDCommand.DisposeOf;
  FGetQtdAtivosCommand.DisposeOf;
  FGetQtdGeralCommand.DisposeOf;
  FGetQtdMaxAtivosCommand.DisposeOf;
  inherited;
end;

end.

