//
// Created by the DataSnap proxy generator.
// 17/02/2018 17:18:26
//

unit ClientClassesUnit;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TGetDadosClient = class(TDSAdminRestClient)
  private
    FGetListaTabelasCommand: TDSRestCommand;
    FGetTabelaCommand: TDSRestCommand;
    FCadastraCountryCommand: TDSRestCommand;
    FAutalizaCountryCommand: TDSRestCommand;
    FDeletaCountryCommand: TDSRestCommand;
    FSalvaImagemCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetListaTabelas(const ARequestFilter: string = ''): string;
    function GetTabela(pNomeTabela: string; const ARequestFilter: string = ''): string;
    function CadastraCountry(pCountry: string; pCurrency: string; const ARequestFilter: string = ''): Integer;
    function AutalizaCountry(pCountryID: string; pCurrency: string; const ARequestFilter: string = ''): Integer;
    function DeletaCountry(pCountryID: string; const ARequestFilter: string = ''): Integer;
    function SalvaImagem(pStm: TStream; const ARequestFilter: string = ''): string;
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

  TGetDados_CadastraCountry: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pCountry'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pCurrency'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TGetDados_AutalizaCountry: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pCountryID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pCurrency'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TGetDados_DeletaCountry: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pCountryID'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TGetDados_SalvaImagem: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pStm'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
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

function TGetDadosClient.CadastraCountry(pCountry: string; pCurrency: string; const ARequestFilter: string): Integer;
begin
  if FCadastraCountryCommand = nil then
  begin
    FCadastraCountryCommand := FConnection.CreateCommand;
    FCadastraCountryCommand.RequestType := 'GET';
    FCadastraCountryCommand.Text := 'TGetDados.CadastraCountry';
    FCadastraCountryCommand.Prepare(TGetDados_CadastraCountry);
  end;
  FCadastraCountryCommand.Parameters[0].Value.SetWideString(pCountry);
  FCadastraCountryCommand.Parameters[1].Value.SetWideString(pCurrency);
  FCadastraCountryCommand.Execute(ARequestFilter);
  Result := FCadastraCountryCommand.Parameters[2].Value.GetInt32;
end;

function TGetDadosClient.AutalizaCountry(pCountryID: string; pCurrency: string; const ARequestFilter: string): Integer;
begin
  if FAutalizaCountryCommand = nil then
  begin
    FAutalizaCountryCommand := FConnection.CreateCommand;
    FAutalizaCountryCommand.RequestType := 'GET';
    FAutalizaCountryCommand.Text := 'TGetDados.AutalizaCountry';
    FAutalizaCountryCommand.Prepare(TGetDados_AutalizaCountry);
  end;
  FAutalizaCountryCommand.Parameters[0].Value.SetWideString(pCountryID);
  FAutalizaCountryCommand.Parameters[1].Value.SetWideString(pCurrency);
  FAutalizaCountryCommand.Execute(ARequestFilter);
  Result := FAutalizaCountryCommand.Parameters[2].Value.GetInt32;
end;

function TGetDadosClient.DeletaCountry(pCountryID: string; const ARequestFilter: string): Integer;
begin
  if FDeletaCountryCommand = nil then
  begin
    FDeletaCountryCommand := FConnection.CreateCommand;
    FDeletaCountryCommand.RequestType := 'GET';
    FDeletaCountryCommand.Text := 'TGetDados.DeletaCountry';
    FDeletaCountryCommand.Prepare(TGetDados_DeletaCountry);
  end;
  FDeletaCountryCommand.Parameters[0].Value.SetWideString(pCountryID);
  FDeletaCountryCommand.Execute(ARequestFilter);
  Result := FDeletaCountryCommand.Parameters[1].Value.GetInt32;
end;

function TGetDadosClient.SalvaImagem(pStm: TStream; const ARequestFilter: string): string;
begin
  if FSalvaImagemCommand = nil then
  begin
    FSalvaImagemCommand := FConnection.CreateCommand;
    FSalvaImagemCommand.RequestType := 'POST';
    FSalvaImagemCommand.Text := 'TGetDados."SalvaImagem"';
    FSalvaImagemCommand.Prepare(TGetDados_SalvaImagem);
  end;
  FSalvaImagemCommand.Parameters[0].Value.SetStream(pStm, FInstanceOwner);
  FSalvaImagemCommand.Execute(ARequestFilter);
  Result := FSalvaImagemCommand.Parameters[1].Value.GetWideString;
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
  FCadastraCountryCommand.DisposeOf;
  FAutalizaCountryCommand.DisposeOf;
  FDeletaCountryCommand.DisposeOf;
  FSalvaImagemCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

end.

