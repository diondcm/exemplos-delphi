unit Server.Methods.Geral;

interface

uses
  WinAPI.Windows, System.SysUtils, System.Classes, Datasnap.DSServer, System.DateUtils,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, System.SyncObjs, System.Hash;

type
  TSMGeral = class(TDSServerModule)
  private
    { Private declarations }
    class var
      FServerVersion: string;
      FCriticalSec: TCriticalSection;
  public
    function GetDataAtual: Int64;
    function Login(pUser, pSenha: string): string;
    function GerServerVersion: string;
    function GetClientVersion: string;
    class constructor Create;
    class destructor Destroy;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

{ TSMGeral }

class constructor TSMGeral.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TSMGeral.Destroy;
begin
  FCriticalSec.Free;
end;

function TSMGeral.GerServerVersion: string;
begin
  if FServerVersion = '' then
  begin
    FCriticalSec.Acquire;
    try
      FServerVersion := GetBuildInfoAsString;
    finally
      FCriticalSec.Release;
    end;
  end;

  Result := FServerVersion;
end;

function TSMGeral.GetClientVersion: string;
begin
  Result := '1.25.5454';
end;

function TSMGeral.GetDataAtual: Int64;
begin
  Result := DateTimeToUnix(Now);
end;

function TSMGeral.Login(pUser, pSenha: string): string;
begin
  Result := 'Falha ao logar';
  Result := THashSHA1.GetHashString('admin');
  if pUser = THashSHA1.GetHashString('admin') then
  begin
    Result := THashSHA1.GetHashString('teste');
    if pSenha = THashSHA1.GetHashString('teste') then
    begin
      Result := 'Logado com sucesso';
    end else begin
      Exit('Senha inválida');
    end;
  end else begin
    Exit('Usuário inválido');
  end;
end;

end.

