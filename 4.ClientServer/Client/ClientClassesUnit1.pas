//
// Created by the DataSnap proxy generator.
// 11/03/2017 10:59:00
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders,
  Classe.Produto, Classe.Retorno, Data.DBXJSONReflect;

type

  IDSRestCachedTRetorno = interface;
  IDSRestCachedTListaProduto = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FDataModuleDestroyCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetListaProdutosCommand: TDSRestCommand;
    FGetListaProdutosCommand_Cache: TDSRestCommand;
    FSetListaProdutoCommand: TDSRestCommand;
    FSetListaProdutoCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetListaProdutos(const ARequestFilter: string = ''): TListaProduto;
    function GetListaProdutos_Cache(const ARequestFilter: string = ''): IDSRestCachedTListaProduto;
    function SetListaProduto(pLista: TListaProduto; const ARequestFilter: string = ''): TRetorno;
    function SetListaProduto_Cache(pLista: TListaProduto; const ARequestFilter: string = ''): IDSRestCachedTRetorno;
  end;

  IDSRestCachedTRetorno = interface(IDSRestCachedObject<TRetorno>)
  end;

  TDSRestCachedTRetorno = class(TDSRestCachedObject<TRetorno>, IDSRestCachedTRetorno, IDSRestCachedCommand)
  end;
  IDSRestCachedTListaProduto = interface(IDSRestCachedObject<TListaProduto>)
  end;

  TDSRestCachedTListaProduto = class(TDSRestCachedObject<TListaProduto>, IDSRestCachedTListaProduto, IDSRestCachedCommand)
  end;

const
  TServerMethods1_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_DataModuleDestroy: array [0..0] of TDSRestParameterMetaData =
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

  TServerMethods1_GetListaProdutos: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TListaProduto')
  );

  TServerMethods1_GetListaProdutos_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetListaProduto: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pLista'; Direction: 1; DBXType: 37; TypeName: 'TListaProduto'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TRetorno')
  );

  TServerMethods1_SetListaProduto_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pLista'; Direction: 1; DBXType: 37; TypeName: 'TListaProduto'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

procedure TServerMethods1Client.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TServerMethods1."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TServerMethods1_DataModuleCreate);
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

procedure TServerMethods1Client.DataModuleDestroy(Sender: TObject);
begin
  if FDataModuleDestroyCommand = nil then
  begin
    FDataModuleDestroyCommand := FConnection.CreateCommand;
    FDataModuleDestroyCommand.RequestType := 'POST';
    FDataModuleDestroyCommand.Text := 'TServerMethods1."DataModuleDestroy"';
    FDataModuleDestroyCommand.Prepare(TServerMethods1_DataModuleDestroy);
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

function TServerMethods1Client.GetListaProdutos(const ARequestFilter: string): TListaProduto;
begin
  if FGetListaProdutosCommand = nil then
  begin
    FGetListaProdutosCommand := FConnection.CreateCommand;
    FGetListaProdutosCommand.RequestType := 'GET';
    FGetListaProdutosCommand.Text := 'TServerMethods1.GetListaProdutos';
    FGetListaProdutosCommand.Prepare(TServerMethods1_GetListaProdutos);
  end;
  FGetListaProdutosCommand.Execute(ARequestFilter);
  if not FGetListaProdutosCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaProdutosCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TListaProduto(FUnMarshal.UnMarshal(FGetListaProdutosCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaProdutosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetListaProdutos_Cache(const ARequestFilter: string): IDSRestCachedTListaProduto;
begin
  if FGetListaProdutosCommand_Cache = nil then
  begin
    FGetListaProdutosCommand_Cache := FConnection.CreateCommand;
    FGetListaProdutosCommand_Cache.RequestType := 'GET';
    FGetListaProdutosCommand_Cache.Text := 'TServerMethods1.GetListaProdutos';
    FGetListaProdutosCommand_Cache.Prepare(TServerMethods1_GetListaProdutos_Cache);
  end;
  FGetListaProdutosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTListaProduto.Create(FGetListaProdutosCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.SetListaProduto(pLista: TListaProduto; const ARequestFilter: string): TRetorno;
begin
  if FSetListaProdutoCommand = nil then
  begin
    FSetListaProdutoCommand := FConnection.CreateCommand;
    FSetListaProdutoCommand.RequestType := 'POST';
    FSetListaProdutoCommand.Text := 'TServerMethods1."SetListaProduto"';
    FSetListaProdutoCommand.Prepare(TServerMethods1_SetListaProduto);
  end;
  if not Assigned(pLista) then
    FSetListaProdutoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetListaProdutoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetListaProdutoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pLista), True);
      if FInstanceOwner then
        pLista.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetListaProdutoCommand.Execute(ARequestFilter);
  if not FSetListaProdutoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FSetListaProdutoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TRetorno(FUnMarshal.UnMarshal(FSetListaProdutoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FSetListaProdutoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.SetListaProduto_Cache(pLista: TListaProduto; const ARequestFilter: string): IDSRestCachedTRetorno;
begin
  if FSetListaProdutoCommand_Cache = nil then
  begin
    FSetListaProdutoCommand_Cache := FConnection.CreateCommand;
    FSetListaProdutoCommand_Cache.RequestType := 'POST';
    FSetListaProdutoCommand_Cache.Text := 'TServerMethods1."SetListaProduto"';
    FSetListaProdutoCommand_Cache.Prepare(TServerMethods1_SetListaProduto_Cache);
  end;
  if not Assigned(pLista) then
    FSetListaProdutoCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetListaProdutoCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetListaProdutoCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pLista), True);
      if FInstanceOwner then
        pLista.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetListaProdutoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTRetorno.Create(FSetListaProdutoCommand_Cache.Parameters[1].Value.GetString);
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
  FDataModuleCreateCommand.DisposeOf;
  FDataModuleDestroyCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetListaProdutosCommand.DisposeOf;
  FGetListaProdutosCommand_Cache.DisposeOf;
  FSetListaProdutoCommand.DisposeOf;
  FSetListaProdutoCommand_Cache.DisposeOf;
  inherited;
end;

end.
