unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, System.DateUtils;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function RetornaDataAtual: TDatetime;
    function RetornaDataAtual2: string;
    function RetonaDataIso8601: string;
    function RetonaDataUnix: string;

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.RetonaDataIso8601: string;
begin
  Result := DateToISO8601(Now);
end;

function TServerMethods1.RetonaDataUnix: string;
begin
  //UnixToDateTime()
  Result := IntToStr(DateTimeToUnix(Now))
end;

function TServerMethods1.RetornaDataAtual: TDatetime;
begin
  Result := Now;
end;

function TServerMethods1.RetornaDataAtual2: string;
begin
  Result := DateTimeToStr(Now);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

