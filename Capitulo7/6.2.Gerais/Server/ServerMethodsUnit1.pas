unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DBXPlatform;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetHashAtual: string;
    function ComparaHashDbClient(pHashLocal: string): string;
    function GetDBLocalMobile: string;

    function GetDBLocalMobileGeral: Boolean;// content type
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.ComparaHashDbClient(pHashLocal: string): string;
begin
  if pHashLocal = 'FFFF' then
  begin
    Result := '[ok]';
  end else begin
    Result := '[atualizar]'// ou https:// ou FTP...
  end;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetDBLocalMobile: string;
const
  DB = 'C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\fast.zip';
var
  lStm: TStringStream;
begin
  // Fazer via cache
  lStm:= TStringStream.Create;
  lStm.LoadFromFile(DB);
  Result := lStm.DataString;
  lStm.Free;
end;

function TServerMethods1.GetDBLocalMobileGeral: Boolean;
begin
  Result := True;
  GetInvocationMetadata.ResponseContentType := 'application/binary';
  GetInvocationMetadata.ResponseContent := GetDBLocalMobile;
end;

function TServerMethods1.GetHashAtual: string;
begin
  Result := 'FFFF';
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

