unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Winapi.Windows;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    //  GetInvocationMetadata().ResponseContent => seria acessível de qualquer plataforma
    function GetFile(pAbreArq: string; out pSize: Int64): TStream;
    function SetFile(pAbrevArquivo, pOperacao: string; pStm: TStream): Int64;

  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetFile(pAbreArq: string; out pSize: Int64): TStream;
var
  lArq: string;
begin
  if pAbreArq = 'LOGO_CLIENTE' then
  begin
    lArq := 'C:\Users\Instrutor01\Downloads\delphi-logo.png'
  end;

  if lArq <> '' then
  begin
    Result := TStringStream.Create;
    (Result as TStringStream).LoadFromFile(lArq);

  end else begin
    pSize := -1;
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetFile(pAbrevArquivo, pOperacao: string; pStm: TStream): Int64;
var
  lStrStm: TStringStream;
begin
  if pAbrevArquivo = 'LOGO_CLIENTE' then
  begin
    lStrStm := TStringStream.Create;
    lStrStm.LoadFromStream(pStm);
    Result := lStrStm.Size;
    if Result > 0 then
    begin
      //lStrStm.Position := 0;
      lStrStm.SaveToFile('Logo_' + IntToStr(GetTickCount) + '.png');
    end;

    lStrStm.Free;
  end;
end;

end.

