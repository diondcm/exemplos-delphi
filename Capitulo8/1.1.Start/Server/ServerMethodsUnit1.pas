unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FachadaWSSGS1, Soap.XSBuiltIns;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetCotacao: Double;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCotacao: Double;
var
  lWS: FachadaWSSGS;
  lResultado: TXSDecimal; // Soap.XSBuiltIns
begin
  lWS := GetFachadaWSSGS;
  lResultado := lWS.getValor(10813 { Dolar Venda }, FormatDateTime('dd/mm/yyyy', Now -1 ));
  Result := StrToFloat(StringReplace(lResultado.DecimalString, '.', FormatSettings.DecimalSeparator, []));
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

