unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.ConversorMoeda;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function RealParaDolar(const pValor: string): string;
    function DolarParaReal(const pValor: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.DolarParaReal(const pValor: string): string;
begin
  Result := TConversorMoeda.DolarParaReal(pValor);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.RealParaDolar(const pValor: string): string;
begin
  Result := TConversorMoeda.RealParaDolar(pValor);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

