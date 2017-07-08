//
// Created by the DataSnap proxy generator.
// 27/05/2017 13:31:42
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classe.Status, Classe.Acao, Data.DBXJSONReflect;

type

  IDSRestCachedTStatusList<TAcao> = interface;
  IDSRestCachedTStatus = interface;

  TSMAcaoClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FRegistraTransacaoCompraCommand: TDSRestCommand;
    FRegistraTransacaoCompraCommand_Cache: TDSRestCommand;
    FRegistraTransacaoVendaCommand: TDSRestCommand;
    FRegistraTransacaoVendaCommand_Cache: TDSRestCommand;
    FRegistraVendaCommand: TDSRestCommand;
    FRegistraVendaCommand_Cache: TDSRestCommand;
    FRegistraCompraCommand: TDSRestCommand;
    FRegistraCompraCommand_Cache: TDSRestCommand;
    FGetTransacoesCompraCommand: TDSRestCommand;
    FGetTransacoesCompraCommand_Cache: TDSRestCommand;
    FGetTransacoesVendaCommand: TDSRestCommand;
    FGetTransacoesVendaCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function RegistraTransacaoCompra(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string = ''): TStatus;
    function RegistraTransacaoCompra_Cache(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string = ''): IDSRestCachedTStatus;
    function RegistraTransacaoVenda(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string = ''): TStatus;
    function RegistraTransacaoVenda_Cache(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string = ''): IDSRestCachedTStatus;
    function RegistraVenda(pAcao: TAcao; const ARequestFilter: string = ''): TStatus;
    function RegistraVenda_Cache(pAcao: TAcao; const ARequestFilter: string = ''): IDSRestCachedTStatus;
    function RegistraCompra(pAcao: TAcao; const ARequestFilter: string = ''): TStatus;
    function RegistraCompra_Cache(pAcao: TAcao; const ARequestFilter: string = ''): IDSRestCachedTStatus;
    function GetTransacoesCompra(const ARequestFilter: string = ''): TStatusList<Classe.Acao.TAcao>;
    function GetTransacoesCompra_Cache(const ARequestFilter: string = ''): IDSRestCachedTStatusList<Classe.Acao.TAcao>;
    function GetTransacoesVenda(const ARequestFilter: string = ''): TStatusList<Classe.Acao.TAcao>;
    function GetTransacoesVenda_Cache(const ARequestFilter: string = ''): IDSRestCachedTStatusList<Classe.Acao.TAcao>;
  end;

  IDSRestCachedTStatusList<TAcao> = interface(IDSRestCachedObject<TStatusList<TAcao>>)
  end;

  TDSRestCachedTStatusList<TAcao> = class(TDSRestCachedObject<TStatusList<TAcao>>, IDSRestCachedTStatusList<TAcao>, IDSRestCachedCommand)
  end;
  IDSRestCachedTStatus = interface(IDSRestCachedObject<TStatus>)
  end;

  TDSRestCachedTStatus = class(TDSRestCachedObject<TStatus>, IDSRestCachedTStatus, IDSRestCachedCommand)
  end;

const
  TSMAcao_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMAcao_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMAcao_RegistraTransacaoCompra: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreviatura'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pQuantidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'pValor'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatus')
  );

  TSMAcao_RegistraTransacaoCompra_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreviatura'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pQuantidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'pValor'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMAcao_RegistraTransacaoVenda: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreviatura'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pQuantidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'pValor'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatus')
  );

  TSMAcao_RegistraTransacaoVenda_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pAbreviatura'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pQuantidade'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: 'pValor'; Direction: 1; DBXType: 25; TypeName: 'Currency'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMAcao_RegistraVenda: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pAcao'; Direction: 1; DBXType: 37; TypeName: 'TAcao'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatus')
  );

  TSMAcao_RegistraVenda_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pAcao'; Direction: 1; DBXType: 37; TypeName: 'TAcao'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMAcao_RegistraCompra: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pAcao'; Direction: 1; DBXType: 37; TypeName: 'TAcao'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatus')
  );

  TSMAcao_RegistraCompra_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pAcao'; Direction: 1; DBXType: 37; TypeName: 'TAcao'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMAcao_GetTransacoesCompra: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatusList<Classe.Acao.TAcao>')
  );

  TSMAcao_GetTransacoesCompra_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMAcao_GetTransacoesVenda: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TStatusList<Classe.Acao.TAcao>')
  );

  TSMAcao_GetTransacoesVenda_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TSMAcaoClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSMAcao.EchoString';
    FEchoStringCommand.Prepare(TSMAcao_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMAcaoClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSMAcao.ReverseString';
    FReverseStringCommand.Prepare(TSMAcao_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMAcaoClient.RegistraTransacaoCompra(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string): TStatus;
begin
  if FRegistraTransacaoCompraCommand = nil then
  begin
    FRegistraTransacaoCompraCommand := FConnection.CreateCommand;
    FRegistraTransacaoCompraCommand.RequestType := 'GET';
    FRegistraTransacaoCompraCommand.Text := 'TSMAcao.RegistraTransacaoCompra';
    FRegistraTransacaoCompraCommand.Prepare(TSMAcao_RegistraTransacaoCompra);
  end;
  FRegistraTransacaoCompraCommand.Parameters[0].Value.SetWideString(pAbreviatura);
  FRegistraTransacaoCompraCommand.Parameters[1].Value.SetInt32(pQuantidade);
  FRegistraTransacaoCompraCommand.Parameters[2].Value.AsCurrency := pValor;
  FRegistraTransacaoCompraCommand.Execute(ARequestFilter);
  if not FRegistraTransacaoCompraCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRegistraTransacaoCompraCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatus(FUnMarshal.UnMarshal(FRegistraTransacaoCompraCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRegistraTransacaoCompraCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.RegistraTransacaoCompra_Cache(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string): IDSRestCachedTStatus;
begin
  if FRegistraTransacaoCompraCommand_Cache = nil then
  begin
    FRegistraTransacaoCompraCommand_Cache := FConnection.CreateCommand;
    FRegistraTransacaoCompraCommand_Cache.RequestType := 'GET';
    FRegistraTransacaoCompraCommand_Cache.Text := 'TSMAcao.RegistraTransacaoCompra';
    FRegistraTransacaoCompraCommand_Cache.Prepare(TSMAcao_RegistraTransacaoCompra_Cache);
  end;
  FRegistraTransacaoCompraCommand_Cache.Parameters[0].Value.SetWideString(pAbreviatura);
  FRegistraTransacaoCompraCommand_Cache.Parameters[1].Value.SetInt32(pQuantidade);
  FRegistraTransacaoCompraCommand_Cache.Parameters[2].Value.AsCurrency := pValor;
  FRegistraTransacaoCompraCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatus.Create(FRegistraTransacaoCompraCommand_Cache.Parameters[3].Value.GetString);
end;

function TSMAcaoClient.RegistraTransacaoVenda(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string): TStatus;
begin
  if FRegistraTransacaoVendaCommand = nil then
  begin
    FRegistraTransacaoVendaCommand := FConnection.CreateCommand;
    FRegistraTransacaoVendaCommand.RequestType := 'GET';
    FRegistraTransacaoVendaCommand.Text := 'TSMAcao.RegistraTransacaoVenda';
    FRegistraTransacaoVendaCommand.Prepare(TSMAcao_RegistraTransacaoVenda);
  end;
  FRegistraTransacaoVendaCommand.Parameters[0].Value.SetWideString(pAbreviatura);
  FRegistraTransacaoVendaCommand.Parameters[1].Value.SetInt32(pQuantidade);
  FRegistraTransacaoVendaCommand.Parameters[2].Value.AsCurrency := pValor;
  FRegistraTransacaoVendaCommand.Execute(ARequestFilter);
  if not FRegistraTransacaoVendaCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRegistraTransacaoVendaCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatus(FUnMarshal.UnMarshal(FRegistraTransacaoVendaCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRegistraTransacaoVendaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.RegistraTransacaoVenda_Cache(pAbreviatura: string; pQuantidade: Integer; pValor: Currency; const ARequestFilter: string): IDSRestCachedTStatus;
begin
  if FRegistraTransacaoVendaCommand_Cache = nil then
  begin
    FRegistraTransacaoVendaCommand_Cache := FConnection.CreateCommand;
    FRegistraTransacaoVendaCommand_Cache.RequestType := 'GET';
    FRegistraTransacaoVendaCommand_Cache.Text := 'TSMAcao.RegistraTransacaoVenda';
    FRegistraTransacaoVendaCommand_Cache.Prepare(TSMAcao_RegistraTransacaoVenda_Cache);
  end;
  FRegistraTransacaoVendaCommand_Cache.Parameters[0].Value.SetWideString(pAbreviatura);
  FRegistraTransacaoVendaCommand_Cache.Parameters[1].Value.SetInt32(pQuantidade);
  FRegistraTransacaoVendaCommand_Cache.Parameters[2].Value.AsCurrency := pValor;
  FRegistraTransacaoVendaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatus.Create(FRegistraTransacaoVendaCommand_Cache.Parameters[3].Value.GetString);
end;

function TSMAcaoClient.RegistraVenda(pAcao: TAcao; const ARequestFilter: string): TStatus;
begin
  if FRegistraVendaCommand = nil then
  begin
    FRegistraVendaCommand := FConnection.CreateCommand;
    FRegistraVendaCommand.RequestType := 'POST';
    FRegistraVendaCommand.Text := 'TSMAcao."RegistraVenda"';
    FRegistraVendaCommand.Prepare(TSMAcao_RegistraVenda);
  end;
  if not Assigned(pAcao) then
    FRegistraVendaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRegistraVendaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRegistraVendaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pAcao), True);
      if FInstanceOwner then
        pAcao.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRegistraVendaCommand.Execute(ARequestFilter);
  if not FRegistraVendaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRegistraVendaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatus(FUnMarshal.UnMarshal(FRegistraVendaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRegistraVendaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.RegistraVenda_Cache(pAcao: TAcao; const ARequestFilter: string): IDSRestCachedTStatus;
begin
  if FRegistraVendaCommand_Cache = nil then
  begin
    FRegistraVendaCommand_Cache := FConnection.CreateCommand;
    FRegistraVendaCommand_Cache.RequestType := 'POST';
    FRegistraVendaCommand_Cache.Text := 'TSMAcao."RegistraVenda"';
    FRegistraVendaCommand_Cache.Prepare(TSMAcao_RegistraVenda_Cache);
  end;
  if not Assigned(pAcao) then
    FRegistraVendaCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRegistraVendaCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRegistraVendaCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pAcao), True);
      if FInstanceOwner then
        pAcao.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRegistraVendaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatus.Create(FRegistraVendaCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMAcaoClient.RegistraCompra(pAcao: TAcao; const ARequestFilter: string): TStatus;
begin
  if FRegistraCompraCommand = nil then
  begin
    FRegistraCompraCommand := FConnection.CreateCommand;
    FRegistraCompraCommand.RequestType := 'POST';
    FRegistraCompraCommand.Text := 'TSMAcao."RegistraCompra"';
    FRegistraCompraCommand.Prepare(TSMAcao_RegistraCompra);
  end;
  if not Assigned(pAcao) then
    FRegistraCompraCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRegistraCompraCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRegistraCompraCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pAcao), True);
      if FInstanceOwner then
        pAcao.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRegistraCompraCommand.Execute(ARequestFilter);
  if not FRegistraCompraCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FRegistraCompraCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatus(FUnMarshal.UnMarshal(FRegistraCompraCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FRegistraCompraCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.RegistraCompra_Cache(pAcao: TAcao; const ARequestFilter: string): IDSRestCachedTStatus;
begin
  if FRegistraCompraCommand_Cache = nil then
  begin
    FRegistraCompraCommand_Cache := FConnection.CreateCommand;
    FRegistraCompraCommand_Cache.RequestType := 'POST';
    FRegistraCompraCommand_Cache.Text := 'TSMAcao."RegistraCompra"';
    FRegistraCompraCommand_Cache.Prepare(TSMAcao_RegistraCompra_Cache);
  end;
  if not Assigned(pAcao) then
    FRegistraCompraCommand_Cache.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FRegistraCompraCommand_Cache.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FRegistraCompraCommand_Cache.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pAcao), True);
      if FInstanceOwner then
        pAcao.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FRegistraCompraCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatus.Create(FRegistraCompraCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMAcaoClient.GetTransacoesCompra(const ARequestFilter: string): TStatusList<Classe.Acao.TAcao>;
begin
  if FGetTransacoesCompraCommand = nil then
  begin
    FGetTransacoesCompraCommand := FConnection.CreateCommand;
    FGetTransacoesCompraCommand.RequestType := 'GET';
    FGetTransacoesCompraCommand.Text := 'TSMAcao.GetTransacoesCompra';
    FGetTransacoesCompraCommand.Prepare(TSMAcao_GetTransacoesCompra);
  end;
  FGetTransacoesCompraCommand.Execute(ARequestFilter);
  if not FGetTransacoesCompraCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTransacoesCompraCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatusList<Classe.Acao.TAcao>(FUnMarshal.UnMarshal(FGetTransacoesCompraCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTransacoesCompraCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.GetTransacoesCompra_Cache(const ARequestFilter: string): IDSRestCachedTStatusList<Classe.Acao.TAcao>;
begin
  if FGetTransacoesCompraCommand_Cache = nil then
  begin
    FGetTransacoesCompraCommand_Cache := FConnection.CreateCommand;
    FGetTransacoesCompraCommand_Cache.RequestType := 'GET';
    FGetTransacoesCompraCommand_Cache.Text := 'TSMAcao.GetTransacoesCompra';
    FGetTransacoesCompraCommand_Cache.Prepare(TSMAcao_GetTransacoesCompra_Cache);
  end;
  FGetTransacoesCompraCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatusList<Classe.Acao.TAcao>.Create(FGetTransacoesCompraCommand_Cache.Parameters[0].Value.GetString);
end;

function TSMAcaoClient.GetTransacoesVenda(const ARequestFilter: string): TStatusList<Classe.Acao.TAcao>;
begin
  if FGetTransacoesVendaCommand = nil then
  begin
    FGetTransacoesVendaCommand := FConnection.CreateCommand;
    FGetTransacoesVendaCommand.RequestType := 'GET';
    FGetTransacoesVendaCommand.Text := 'TSMAcao.GetTransacoesVenda';
    FGetTransacoesVendaCommand.Prepare(TSMAcao_GetTransacoesVenda);
  end;
  FGetTransacoesVendaCommand.Execute(ARequestFilter);
  if not FGetTransacoesVendaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetTransacoesVendaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TStatusList<Classe.Acao.TAcao>(FUnMarshal.UnMarshal(FGetTransacoesVendaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetTransacoesVendaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMAcaoClient.GetTransacoesVenda_Cache(const ARequestFilter: string): IDSRestCachedTStatusList<Classe.Acao.TAcao>;
begin
  if FGetTransacoesVendaCommand_Cache = nil then
  begin
    FGetTransacoesVendaCommand_Cache := FConnection.CreateCommand;
    FGetTransacoesVendaCommand_Cache.RequestType := 'GET';
    FGetTransacoesVendaCommand_Cache.Text := 'TSMAcao.GetTransacoesVenda';
    FGetTransacoesVendaCommand_Cache.Prepare(TSMAcao_GetTransacoesVenda_Cache);
  end;
  FGetTransacoesVendaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTStatusList<Classe.Acao.TAcao>.Create(FGetTransacoesVendaCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TSMAcaoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMAcaoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMAcaoClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FRegistraTransacaoCompraCommand.DisposeOf;
  FRegistraTransacaoCompraCommand_Cache.DisposeOf;
  FRegistraTransacaoVendaCommand.DisposeOf;
  FRegistraTransacaoVendaCommand_Cache.DisposeOf;
  FRegistraVendaCommand.DisposeOf;
  FRegistraVendaCommand_Cache.DisposeOf;
  FRegistraCompraCommand.DisposeOf;
  FRegistraCompraCommand_Cache.DisposeOf;
  FGetTransacoesCompraCommand.DisposeOf;
  FGetTransacoesCompraCommand_Cache.DisposeOf;
  FGetTransacoesVendaCommand.DisposeOf;
  FGetTransacoesVendaCommand_Cache.DisposeOf;
  inherited;
end;

end.

