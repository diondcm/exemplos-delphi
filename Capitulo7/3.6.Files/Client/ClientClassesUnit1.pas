//
// Created by the DataSnap proxy generator.
// 21/07/2018 11:54:00
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classe.Pessoa, Data.DBXJSONReflect;

type

  IDSRestCachedTListaPessoa = interface;
  IDSRestCachedTPessoa = interface;
  IDSRestCachedTPessoaComOwner = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetPessoaCommand: TDSRestCommand;
    FGetPessoaCommand_Cache: TDSRestCommand;
    FGetPessoaComOwnerCommand: TDSRestCommand;
    FGetPessoaComOwnerCommand_Cache: TDSRestCommand;
    FSetPessoaCommand: TDSRestCommand;
    FGetListaPessoaCommand: TDSRestCommand;
    FGetListaPessoaCommand_Cache: TDSRestCommand;
    FGetCarroCommand: TDSRestCommand;
    FGetCarroSemTratamentoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetPessoa(pPessoaID: Integer; const ARequestFilter: string = ''): TPessoa;
    function GetPessoa_Cache(pPessoaID: Integer; const ARequestFilter: string = ''): IDSRestCachedTPessoa;
    function GetPessoaComOwner(const ARequestFilter: string = ''): TPessoaComOwner;
    function GetPessoaComOwner_Cache(const ARequestFilter: string = ''): IDSRestCachedTPessoaComOwner;
    function SetPessoa(pPessoa: TPessoa; const ARequestFilter: string = ''): Boolean;
    function GetListaPessoa(const ARequestFilter: string = ''): TListaPessoa;
    function GetListaPessoa_Cache(const ARequestFilter: string = ''): IDSRestCachedTListaPessoa;
    function GetCarro(pID: Integer; const ARequestFilter: string = ''): Boolean;
    function GetCarroSemTratamento(pID: Integer; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTListaPessoa = interface(IDSRestCachedObject<TListaPessoa>)
  end;

  TDSRestCachedTListaPessoa = class(TDSRestCachedObject<TListaPessoa>, IDSRestCachedTListaPessoa, IDSRestCachedCommand)
  end;
  IDSRestCachedTPessoa = interface(IDSRestCachedObject<TPessoa>)
  end;

  TDSRestCachedTPessoa = class(TDSRestCachedObject<TPessoa>, IDSRestCachedTPessoa, IDSRestCachedCommand)
  end;
  IDSRestCachedTPessoaComOwner = interface(IDSRestCachedObject<TPessoaComOwner>)
  end;

  TDSRestCachedTPessoaComOwner = class(TDSRestCachedObject<TPessoaComOwner>, IDSRestCachedTPessoaComOwner, IDSRestCachedCommand)
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

  TServerMethods1_GetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pPessoaID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPessoa')
  );

  TServerMethods1_GetPessoa_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pPessoaID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetPessoaComOwner: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPessoaComOwner')
  );

  TServerMethods1_GetPessoaComOwner_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetPessoa: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pPessoa'; Direction: 1; DBXType: 37; TypeName: 'TPessoa'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods1_GetListaPessoa: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TListaPessoa')
  );

  TServerMethods1_GetListaPessoa_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_GetCarro: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods1_GetCarroSemTratamento: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
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

function TServerMethods1Client.GetPessoa(pPessoaID: Integer; const ARequestFilter: string): TPessoa;
begin
  if FGetPessoaCommand = nil then
  begin
    FGetPessoaCommand := FConnection.CreateCommand;
    FGetPessoaCommand.RequestType := 'GET';
    FGetPessoaCommand.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand.Prepare(TServerMethods1_GetPessoa);
  end;
  FGetPessoaCommand.Parameters[0].Value.SetInt32(pPessoaID);
  FGetPessoaCommand.Execute(ARequestFilter);
  if not FGetPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPessoa(FUnMarshal.UnMarshal(FGetPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoa_Cache(pPessoaID: Integer; const ARequestFilter: string): IDSRestCachedTPessoa;
begin
  if FGetPessoaCommand_Cache = nil then
  begin
    FGetPessoaCommand_Cache := FConnection.CreateCommand;
    FGetPessoaCommand_Cache.RequestType := 'GET';
    FGetPessoaCommand_Cache.Text := 'TServerMethods1.GetPessoa';
    FGetPessoaCommand_Cache.Prepare(TServerMethods1_GetPessoa_Cache);
  end;
  FGetPessoaCommand_Cache.Parameters[0].Value.SetInt32(pPessoaID);
  FGetPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPessoa.Create(FGetPessoaCommand_Cache.Parameters[1].Value.GetString);
end;

function TServerMethods1Client.GetPessoaComOwner(const ARequestFilter: string): TPessoaComOwner;
begin
  if FGetPessoaComOwnerCommand = nil then
  begin
    FGetPessoaComOwnerCommand := FConnection.CreateCommand;
    FGetPessoaComOwnerCommand.RequestType := 'GET';
    FGetPessoaComOwnerCommand.Text := 'TServerMethods1.GetPessoaComOwner';
    FGetPessoaComOwnerCommand.Prepare(TServerMethods1_GetPessoaComOwner);
  end;
  FGetPessoaComOwnerCommand.Execute(ARequestFilter);
  if not FGetPessoaComOwnerCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaComOwnerCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPessoaComOwner(FUnMarshal.UnMarshal(FGetPessoaComOwnerCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaComOwnerCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoaComOwner_Cache(const ARequestFilter: string): IDSRestCachedTPessoaComOwner;
begin
  if FGetPessoaComOwnerCommand_Cache = nil then
  begin
    FGetPessoaComOwnerCommand_Cache := FConnection.CreateCommand;
    FGetPessoaComOwnerCommand_Cache.RequestType := 'GET';
    FGetPessoaComOwnerCommand_Cache.Text := 'TServerMethods1.GetPessoaComOwner';
    FGetPessoaComOwnerCommand_Cache.Prepare(TServerMethods1_GetPessoaComOwner_Cache);
  end;
  FGetPessoaComOwnerCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPessoaComOwner.Create(FGetPessoaComOwnerCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.SetPessoa(pPessoa: TPessoa; const ARequestFilter: string): Boolean;
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
  Result := FSetPessoaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.GetListaPessoa(const ARequestFilter: string): TListaPessoa;
begin
  if FGetListaPessoaCommand = nil then
  begin
    FGetListaPessoaCommand := FConnection.CreateCommand;
    FGetListaPessoaCommand.RequestType := 'GET';
    FGetListaPessoaCommand.Text := 'TServerMethods1.GetListaPessoa';
    FGetListaPessoaCommand.Prepare(TServerMethods1_GetListaPessoa);
  end;
  FGetListaPessoaCommand.Execute(ARequestFilter);
  if not FGetListaPessoaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaPessoaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TListaPessoa(FUnMarshal.UnMarshal(FGetListaPessoaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetListaPessoa_Cache(const ARequestFilter: string): IDSRestCachedTListaPessoa;
begin
  if FGetListaPessoaCommand_Cache = nil then
  begin
    FGetListaPessoaCommand_Cache := FConnection.CreateCommand;
    FGetListaPessoaCommand_Cache.RequestType := 'GET';
    FGetListaPessoaCommand_Cache.Text := 'TServerMethods1.GetListaPessoa';
    FGetListaPessoaCommand_Cache.Prepare(TServerMethods1_GetListaPessoa_Cache);
  end;
  FGetListaPessoaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTListaPessoa.Create(FGetListaPessoaCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.GetCarro(pID: Integer; const ARequestFilter: string): Boolean;
begin
  if FGetCarroCommand = nil then
  begin
    FGetCarroCommand := FConnection.CreateCommand;
    FGetCarroCommand.RequestType := 'GET';
    FGetCarroCommand.Text := 'TServerMethods1.GetCarro';
    FGetCarroCommand.Prepare(TServerMethods1_GetCarro);
  end;
  FGetCarroCommand.Parameters[0].Value.SetInt32(pID);
  FGetCarroCommand.Execute(ARequestFilter);
  Result := FGetCarroCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.GetCarroSemTratamento(pID: Integer; const ARequestFilter: string): Boolean;
begin
  if FGetCarroSemTratamentoCommand = nil then
  begin
    FGetCarroSemTratamentoCommand := FConnection.CreateCommand;
    FGetCarroSemTratamentoCommand.RequestType := 'GET';
    FGetCarroSemTratamentoCommand.Text := 'TServerMethods1.GetCarroSemTratamento';
    FGetCarroSemTratamentoCommand.Prepare(TServerMethods1_GetCarroSemTratamento);
  end;
  FGetCarroSemTratamentoCommand.Parameters[0].Value.SetInt32(pID);
  FGetCarroSemTratamentoCommand.Execute(ARequestFilter);
  Result := FGetCarroSemTratamentoCommand.Parameters[1].Value.GetBoolean;
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
  FGetPessoaCommand.DisposeOf;
  FGetPessoaCommand_Cache.DisposeOf;
  FGetPessoaComOwnerCommand.DisposeOf;
  FGetPessoaComOwnerCommand_Cache.DisposeOf;
  FSetPessoaCommand.DisposeOf;
  FGetListaPessoaCommand.DisposeOf;
  FGetListaPessoaCommand_Cache.DisposeOf;
  FGetCarroCommand.DisposeOf;
  FGetCarroSemTratamentoCommand.DisposeOf;
  inherited;
end;

end.

