unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetCotacaoAtual: Currency;
    function GetTest: Real;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCotacaoAtual: Currency;
var
  lCentavos: Integer;
begin
  //Result := 3.15;
  Randomize;
  lCentavos := Random(100);

  Result := 3.00 + lCentavos/100;
end;

function TServerMethods1.GetTest: Real;
begin
  Result := 42;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

