// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8080/wsdl/ITConversorMoeda
// Version  : 1.0
// (28/03/2020 14:46:25 - - $Rev: 93209 $)
// ************************************************************************ //

unit ITConversorMoeda1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:ConversorMoedaIntf-ITConversorMoeda
  // soapAction: urn:ConversorMoedaIntf-ITConversorMoeda#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : ITConversorMoedabinding
  // service   : ITConversorMoedaservice
  // port      : ITConversorMoedaPort
  // URL       : http://localhost:8080/soap/ITConversorMoeda
  // ************************************************************************ //
  ITConversorMoeda = interface(IInvokable)
  ['{BC6DA302-317D-8334-E602-E8C28A458C9A}']
    function  ConverteRealParaDolar(const pValorMoeda: string): string; stdcall;
    function  ConverteDolarParaReal(const pValorMoeda: string): string; stdcall;
    function GetCotacaoAtual: string; stdcall;
    function GetHistorico: string; stdcall;
  end;

function GetITConversorMoeda(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITConversorMoeda;


implementation
  uses System.SysUtils;

function GetITConversorMoeda(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITConversorMoeda;
const
  defWSDL = 'http://localhost:8080/wsdl/ITConversorMoeda';
  defURL  = 'http://localhost:8080/soap/ITConversorMoeda';
  defSvc  = 'ITConversorMoedaservice';
  defPrt  = 'ITConversorMoedaPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ITConversorMoeda);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { ITConversorMoeda }
  InvRegistry.RegisterInterface(TypeInfo(ITConversorMoeda), 'urn:ConversorMoedaIntf-ITConversorMoeda', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITConversorMoeda), 'urn:ConversorMoedaIntf-ITConversorMoeda#%operationName%');

end.