//
// Created by the DataSnap proxy generator.
// 23/05/2020 17:43:55
//

unit Client.Classes;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMFilesClient = class(TDSAdminRestClient)
  private
    FGetLogoCommand: TDSRestCommand;
    FGetFileCommand: TDSRestCommand;
    FGetFileCommand_Cache: TDSRestCommand;
    FSetFileCommand: TDSRestCommand;
    FGetHashAtualCommand: TDSRestCommand;
    FInvalidaCacheArqsCommand: TDSRestCommand;
    FAdicionaTransactionCommand: TDSRestCommand;
    FGetTransactionsCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetLogo(const ARequestFilter: string = ''): Boolean;
    function GetFile(pNomeArq: string; out pSize: Int64; const ARequestFilter: string = ''): TStream;
    function GetFile_Cache(pNomeArq: string; out pSize: Int64; const ARequestFilter: string = ''): IDSRestCachedStream;
    function SetFile(pArq: string; pFile: TStream; const ARequestFilter: string = ''): Int64;
    function GetHashAtual(pArq: string; const ARequestFilter: string = ''): string;
    function InvalidaCacheArqs(const ARequestFilter: string = ''): Boolean;
    function AdicionaTransaction(pTexto: string; const ARequestFilter: string = ''): string;
    function GetTransactions(const ARequestFilter: string = ''): string;
  end;

const
  TSMFiles_GetLogo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSMFiles_GetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pNomeArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pSize'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TSMFiles_GetFile_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pNomeArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pSize'; Direction: 2; DBXType: 18; TypeName: 'Int64'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMFiles_SetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pFile'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
    (Name: ''; Direction: 4; DBXType: 18; TypeName: 'Int64')
  );

  TSMFiles_GetHashAtual: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pArq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMFiles_InvalidaCacheArqs: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSMFiles_AdicionaTransaction: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pTexto'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMFiles_GetTransactions: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TSMFilesClient.GetLogo(const ARequestFilter: string): Boolean;
begin
  if FGetLogoCommand = nil then
  begin
    FGetLogoCommand := FConnection.CreateCommand;
    FGetLogoCommand.RequestType := 'GET';
    FGetLogoCommand.Text := 'TSMFiles.GetLogo';
    FGetLogoCommand.Prepare(TSMFiles_GetLogo);
  end;
  FGetLogoCommand.Execute(ARequestFilter);
  Result := FGetLogoCommand.Parameters[0].Value.GetBoolean;
end;

function TSMFilesClient.GetFile(pNomeArq: string; out pSize: Int64; const ARequestFilter: string): TStream;
begin
  if FGetFileCommand = nil then
  begin
    FGetFileCommand := FConnection.CreateCommand;
    FGetFileCommand.RequestType := 'GET';
    FGetFileCommand.Text := 'TSMFiles.GetFile';
    FGetFileCommand.Prepare(TSMFiles_GetFile);
  end;
  FGetFileCommand.Parameters[0].Value.SetWideString(pNomeArq);
  FGetFileCommand.Execute(ARequestFilter);
  pSize := FGetFileCommand.Parameters[1].Value.GetInt64;
  Result := FGetFileCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;

function TSMFilesClient.GetFile_Cache(pNomeArq: string; out pSize: Int64; const ARequestFilter: string): IDSRestCachedStream;
begin
  if FGetFileCommand_Cache = nil then
  begin
    FGetFileCommand_Cache := FConnection.CreateCommand;
    FGetFileCommand_Cache.RequestType := 'GET';
    FGetFileCommand_Cache.Text := 'TSMFiles.GetFile';
    FGetFileCommand_Cache.Prepare(TSMFiles_GetFile_Cache);
  end;
  FGetFileCommand_Cache.Parameters[0].Value.SetWideString(pNomeArq);
  FGetFileCommand_Cache.ExecuteCache(ARequestFilter);
  pSize := FGetFileCommand_Cache.Parameters[1].Value.GetInt64;
  Result := TDSRestCachedStream.Create(FGetFileCommand_Cache.Parameters[2].Value.GetString);
end;

function TSMFilesClient.SetFile(pArq: string; pFile: TStream; const ARequestFilter: string): Int64;
begin
  if FSetFileCommand = nil then
  begin
    FSetFileCommand := FConnection.CreateCommand;
    FSetFileCommand.RequestType := 'POST';
    FSetFileCommand.Text := 'TSMFiles."SetFile"';
    FSetFileCommand.Prepare(TSMFiles_SetFile);
  end;
  FSetFileCommand.Parameters[0].Value.SetWideString(pArq);
  FSetFileCommand.Parameters[1].Value.SetStream(pFile, FInstanceOwner);
  FSetFileCommand.Execute(ARequestFilter);
  Result := FSetFileCommand.Parameters[2].Value.GetInt64;
end;

function TSMFilesClient.GetHashAtual(pArq: string; const ARequestFilter: string): string;
begin
  if FGetHashAtualCommand = nil then
  begin
    FGetHashAtualCommand := FConnection.CreateCommand;
    FGetHashAtualCommand.RequestType := 'GET';
    FGetHashAtualCommand.Text := 'TSMFiles.GetHashAtual';
    FGetHashAtualCommand.Prepare(TSMFiles_GetHashAtual);
  end;
  FGetHashAtualCommand.Parameters[0].Value.SetWideString(pArq);
  FGetHashAtualCommand.Execute(ARequestFilter);
  Result := FGetHashAtualCommand.Parameters[1].Value.GetWideString;
end;

function TSMFilesClient.InvalidaCacheArqs(const ARequestFilter: string): Boolean;
begin
  if FInvalidaCacheArqsCommand = nil then
  begin
    FInvalidaCacheArqsCommand := FConnection.CreateCommand;
    FInvalidaCacheArqsCommand.RequestType := 'GET';
    FInvalidaCacheArqsCommand.Text := 'TSMFiles.InvalidaCacheArqs';
    FInvalidaCacheArqsCommand.Prepare(TSMFiles_InvalidaCacheArqs);
  end;
  FInvalidaCacheArqsCommand.Execute(ARequestFilter);
  Result := FInvalidaCacheArqsCommand.Parameters[0].Value.GetBoolean;
end;

function TSMFilesClient.AdicionaTransaction(pTexto: string; const ARequestFilter: string): string;
begin
  if FAdicionaTransactionCommand = nil then
  begin
    FAdicionaTransactionCommand := FConnection.CreateCommand;
    FAdicionaTransactionCommand.RequestType := 'GET';
    FAdicionaTransactionCommand.Text := 'TSMFiles.AdicionaTransaction';
    FAdicionaTransactionCommand.Prepare(TSMFiles_AdicionaTransaction);
  end;
  FAdicionaTransactionCommand.Parameters[0].Value.SetWideString(pTexto);
  FAdicionaTransactionCommand.Execute(ARequestFilter);
  Result := FAdicionaTransactionCommand.Parameters[1].Value.GetWideString;
end;

function TSMFilesClient.GetTransactions(const ARequestFilter: string): string;
begin
  if FGetTransactionsCommand = nil then
  begin
    FGetTransactionsCommand := FConnection.CreateCommand;
    FGetTransactionsCommand.RequestType := 'GET';
    FGetTransactionsCommand.Text := 'TSMFiles.GetTransactions';
    FGetTransactionsCommand.Prepare(TSMFiles_GetTransactions);
  end;
  FGetTransactionsCommand.Execute(ARequestFilter);
  Result := FGetTransactionsCommand.Parameters[0].Value.GetWideString;
end;

constructor TSMFilesClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMFilesClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMFilesClient.Destroy;
begin
  FGetLogoCommand.DisposeOf;
  FGetFileCommand.DisposeOf;
  FGetFileCommand_Cache.DisposeOf;
  FSetFileCommand.DisposeOf;
  FGetHashAtualCommand.DisposeOf;
  FInvalidaCacheArqsCommand.DisposeOf;
  FAdicionaTransactionCommand.DisposeOf;
  FGetTransactionsCommand.DisposeOf;
  inherited;
end;

end.

