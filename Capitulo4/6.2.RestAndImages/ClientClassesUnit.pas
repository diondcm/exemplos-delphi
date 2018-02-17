// 
// Created by the DataSnap proxy generator.
// 17/02/2018 10:48:36
// 

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TGetDadosClient = class(TDSAdminRestClient)
  private
    FGetListaTabelasCommand: TDSRestCommand;
    FGetTabelaCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetListaTabelas(const ARequestFilter: string = ''): string;
    function GetTabela(pNomeTabela: string; const ARequestFilter: string = ''): string;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

const
  TGetDados_GetListaTabelas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TGetDados_GetTabela: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pNomeTabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TGetDados_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TGetDados_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TGetDadosClient.GetListaTabelas(const ARequestFilter: string): string;
begin
  if FGetListaTabelasCommand = nil then
  begin
    FGetListaTabelasCommand := FConnection.CreateCommand;
    FGetListaTabelasCommand.RequestType := 'GET';
    FGetListaTabelasCommand.Text := 'TGetDados.GetListaTabelas';
    FGetListaTabelasCommand.Prepare(TGetDados_GetListaTabelas);
  end;
  FGetListaTabelasCommand.Execute(ARequestFilter);
  Result := FGetListaTabelasCommand.Parameters[0].Value.GetWideString;
end;

function TGetDadosClient.GetTabela(pNomeTabela: string; const ARequestFilter: string): string;
begin
  if FGetTabelaCommand = nil then
  begin
    FGetTabelaCommand := FConnection.CreateCommand;
    FGetTabelaCommand.RequestType := 'GET';
    FGetTabelaCommand.Text := 'TGetDados.GetTabela';
    FGetTabelaCommand.Prepare(TGetDados_GetTabela);
  end;
  FGetTabelaCommand.Parameters[0].Value.SetWideString(pNomeTabela);
  FGetTabelaCommand.Execute(ARequestFilter);
  Result := FGetTabelaCommand.Parameters[1].Value.GetWideString;
end;

function TGetDadosClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TGetDados.EchoString';
    FEchoStringCommand.Prepare(TGetDados_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TGetDadosClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TGetDados.ReverseString';
    FReverseStringCommand.Prepare(TGetDados_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TGetDadosClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TGetDadosClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TGetDadosClient.Destroy;
begin
  FGetListaTabelasCommand.DisposeOf;
  FGetTabelaCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

end.
