unit Server.Methods.Files;

interface

uses System.SysUtils, System.Classes, System.Json, System.Generics.Collections,
    DataSnap.DSProviderDataModuleAdapter, WinAPI.Windows, System.SyncObjs,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DBXPlatform, System.Hash;

type
  TSMFiles = class(TDSServerModule)
  private
    class var
      FCacheArqs: TDictionary<string, string>;
      FCacheHash: TDictionary<string, string>;
      FCriticalSec: TCriticalSection;
      FTransactions: string;
    class procedure AddArq(pNomeArq, pContent: string);
  public
    // Funciona bem até 40 mb
    // 100 mb começa a dar erro
    // mais que isso pode não enviar/receber
    // >> FTP
    function GetLogo: Boolean;
    function GetFile(pNomeArq: string; out pSize: Int64): TStream;
    function SetFile(pArq: string; pFile: TStream): Int64;

    function GetHashAtual(pArq: string): string;

    [TRoleAuth('admin')]
    function InvalidaCacheArqs: Boolean;

    { Exemplo BlockChain }
    function AdicionaTransaction(pTexto: string): string;
    function GetTransactions: string;

    class constructor Create;
    class destructor Destroy;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

class procedure TSMFiles.AddArq(pNomeArq, pContent: string);
begin
  FCriticalSec.Enter;
  try
    if pContent = '' then
    begin
      FCacheArqs.Remove(pNomeArq);
    end else begin
      FCacheArqs.Add(pNomeArq, pContent);
    end;
  finally
    FCriticalSec.Leave;
  end;
end;

function TSMFiles.AdicionaTransaction(pTexto: string): string;
var
  lStl: TStringList;
begin
  lStl := TStringList.Create;
  lStl.Text := FTransactions;
  lStl.Add(pTexto + '=' + THashSHA2.GetHashString(lStl[lStl.Count -1]));
  Result := lStl[lStl.Count -1];
  FTransactions := lStl.Text;
  lStl.Free;
end;

class constructor TSMFiles.Create;
begin
  FCacheArqs := TDictionary<string, string>.Create;
  FCacheHash := TDictionary<string, string>.Create;
  FCriticalSec := TCriticalSection.Create;
  FTransactions := DateTimeToStr(Now);
end;

class destructor TSMFiles.Destroy;
begin
  FCacheArqs.Free;
  FCacheHash.Free;
  FCriticalSec.Free;
end;

function TSMFiles.GetFile(pNomeArq: string; out pSize: Int64): TStream;
var
  lArq: string;
  lStm: TStringStream;
begin
  Result := nil;

  if pNomeArq = 'LOGO_CLIENTE' then
  begin
    lArq := 'logo.png';
  end;

  if lArq <> '' then
  begin
     if not FCacheArqs.ContainsKey(lArq) then
     begin
       lStm := TStringStream.Create;
       lStm.LoadFromFile(lArq);
       AddArq(lArq, lStm.DataString);
       lStm.Free;
     end;

    Result := TStringStream.Create(FCacheArqs[lArq]);
    //(Result as TStringStream).LoadFromFile(lArq);
    pSize := Result.Size;
  end else begin
    pSize := -1;
  end;
end;

function TSMFiles.GetHashAtual(pArq: string): string;
var
  lArq: string;
  lHash: string;
begin
  if not FCacheHash.ContainsKey(pArq) then
  begin
    if pArq = 'LOGO_CLIENTE' then
    begin
      lArq := 'logo.png';
    end else if pArq = 'DLL_EXEMPLO' then
    begin
      lArq := 'exemplo.dll';
    end;

    if FileExists(lArq) then
    begin
      lHash := THashSHA1.GetHashStringFromFile(lArq);
      FCacheHash.Add(pArq, lHash);

//      var lStm: TStringStream := TStringStream.Create;
//      lStm.LoadFromFile(lArq);
//      lHash := THashSHA1.GetHashString(lStm.DataString);
    end;
  end;

  Result := FCacheHash[pArq];
end;

function TSMFiles.GetLogo: Boolean;
var
  lSM: TStringStream;
begin
  Result := True;

  lSM := TStringStream.Create;
  lSM.LoadFromFile('logo.png');

  GetInvocationMetadata().ResponseContentType := 'image/png';
  GetInvocationMetadata().ResponseContent := lSM.DataString;

  lSM.Free;
end;

function TSMFiles.GetTransactions: string;
begin
  Result := FTransactions;
end;

function TSMFiles.InvalidaCacheArqs: Boolean;
begin
  Result := True;
  FCacheHash.Clear;
end;

function TSMFiles.SetFile(pArq: string; pFile: TStream): Int64;
var
  lStm: TStringStream;
begin
  Result := 0;
  if pArq = 'LOGO_CLIENTE' then
  begin
    lStm := TStringStream.Create;
    lStm.LoadFromStream(pFile);
    Result := lStm.Size;
    if Result > 0 then
    begin
      lStm.SaveToFile('logo_' + IntToStr(GetTickCount) + '.png');
      AddArq('logo.png', '');
    end;
    lStm.Free;
  end;
end;

end.

