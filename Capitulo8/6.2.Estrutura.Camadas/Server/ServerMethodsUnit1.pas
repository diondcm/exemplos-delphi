unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, System.Hash,
    System.SyncObjs;


const
  IMAGEM = 'D:\Aqua\exemplos-delphi\Capitulo8\6.2.Estrutura.Camadas\Assets\logo360.jpg';
  DB = 'D:\Aqua\exemplos-delphi\Capitulo8\6.2.Estrutura.Camadas\Assets\fast.zip';

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  class var
    FCacheImagemLogo: string;
    FCacheHashImagemLogo: string;
    FCacheDB: string;
    FCacheHashDB: string;
    FCriticalSec: TCriticalSection;
    class procedure SetCacheImagemLogo(pCache: string);
    class procedure SetCacheDB(pCache: string);
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetHashImagemLogo: string;
    function GetImagemLogo: string;

    function GetHashDB: string;
    function GetDB: string;

    procedure LimpaCacheServer;
    class constructor Create;
    class destructor Destroy;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

class constructor TServerMethods1.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TServerMethods1.Destroy;
begin
  FCriticalSec.Free;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetDB: string;
var
  lStm: TStringStream;
begin
  if FCacheDB = '' then
  begin
    lStm := TStringStream.Create;
    try
      lStm.LoadFromFile(DB);
      SetCacheDB(lStm.DataString);
    finally
      lStm.Free;
    end;
  end;

  Result := FCacheDB;
end;

function TServerMethods1.GetHashDB: string;
begin
  GetDB;
  Result := FCacheHashDB;
end;

function TServerMethods1.GetHashImagemLogo: string;
begin
  GetImagemLogo;
  Result := FCacheHashImagemLogo;
end;

function TServerMethods1.GetImagemLogo: string;
var
  lStm: TStringStream;
begin
  if FCacheImagemLogo = '' then
  begin
    lStm := TStringStream.Create;
    try
      lStm.LoadFromFile(IMAGEM);
      SetCacheImagemLogo(lStm.DataString);
    finally
      lStm.Free;
    end;
  end;

  Result := FCacheImagemLogo;
end;

procedure TServerMethods1.LimpaCacheServer;
begin
  SetCacheImagemLogo('');
  SetCacheDB('');
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

class procedure TServerMethods1.SetCacheDB(pCache: string);
begin
  FCriticalSec.Acquire;
  try
    FCacheDB := pCache;
    if FCacheDB <> '' then
    begin
      FCacheHashDB := THashSHA1.GetHashString(FCacheDB);
    end else begin
      FCacheHashDB := '';
    end;
  finally // sempre Try - Finnaly
    FCriticalSec.Release;
  end;
end;

class procedure TServerMethods1.SetCacheImagemLogo(pCache: string);
begin
  FCriticalSec.Acquire;
  try
    FCacheImagemLogo := pCache;
    if FCacheImagemLogo <> '' then
    begin
      FCacheHashImagemLogo := THashSHA1.GetHashString(FCacheImagemLogo);
    end else begin
      FCacheHashImagemLogo := '';
    end;
  finally // sempre Try - Finnaly
    FCriticalSec.Release;
  end;
end;

end.

