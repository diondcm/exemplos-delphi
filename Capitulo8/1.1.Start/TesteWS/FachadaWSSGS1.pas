// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl
//  >Import : https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl>0
//  >Import : https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl>1
//  >Import : https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl>2
// Encoding : UTF-8
// Version  : 1.0
// (23/03/2019 16:08:16 - - $Rev: 90173 $)
// ************************************************************************ //

unit FachadaWSSGS1;

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
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  WSValorSerieVO       = class;                 { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br"[GblCplx] }
  WSSerieVO            = class;                 { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br"[GblCplx] }

  ArrayOffWSSerieVO = array of WSSerieVO;       { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br"[GblCplx] }
  ArrayOf_tns2_WSValorSerieVO = array of WSValorSerieVO;   { "https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS"[GblCplx] }
  ArrayOfflong = array of Int64;                { "http://DefaultNamespace"[GblCplx] }


  // ************************************************************************ //
  // XML       : WSValorSerieVO, global, <complexType>
  // Namespace : http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br
  // ************************************************************************ //
  WSValorSerieVO = class(TRemotable)
  private
    Fano: Integer;
    FanoFim: Integer;
    Fbloqueado: Boolean;
    FbloqueioLiberado: Boolean;
    Fdia: Integer;
    FdiaFim: Integer;
    Fmes: Integer;
    FmesFim: Integer;
    Foid: Int64;
    FoidSerie: Int64;
    Fsvalor: string;
    Fvalor: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property ano:              Integer     read Fano write Fano;
    property anoFim:           Integer     read FanoFim write FanoFim;
    property bloqueado:        Boolean     read Fbloqueado write Fbloqueado;
    property bloqueioLiberado: Boolean     read FbloqueioLiberado write FbloqueioLiberado;
    property dia:              Integer     read Fdia write Fdia;
    property diaFim:           Integer     read FdiaFim write FdiaFim;
    property mes:              Integer     read Fmes write Fmes;
    property mesFim:           Integer     read FmesFim write FmesFim;
    property oid:              Int64       read Foid write Foid;
    property oidSerie:         Int64       read FoidSerie write FoidSerie;
    property svalor:           string      read Fsvalor write Fsvalor;
    property valor:            TXSDecimal  read Fvalor write Fvalor;
  end;



  // ************************************************************************ //
  // XML       : WSSerieVO, global, <complexType>
  // Namespace : http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br
  // ************************************************************************ //
  WSSerieVO = class(TRemotable)
  private
    FanoFim: Integer;
    FanoInicio: Integer;
    Faviso: string;
    FdiaFim: Integer;
    FdiaInicio: Integer;
    Fespecial: Boolean;
    Ffonte: string;
    FfullName: string;
    FgestorProprietario: string;
    FmesFim: Integer;
    FmesInicio: Integer;
    FnomeAbreviado: string;
    FnomeCompleto: string;
    Foid: Int64;
    Fperiodicidade: string;
    FperiodicidadeSigla: string;
    FpossuiBloqueios: Boolean;
    Fpublica: Boolean;
    FshortName: string;
    FultimoValor: WSValorSerieVO;
    FunidadePadrao: string;
    FunidadePadraoIngles: string;
    FvalorDiaNaoUtil: Boolean;
    Fvalores: ArrayOf_tns2_WSValorSerieVO;
  public
    destructor Destroy; override;
  published
    property anoFim:              Integer                      read FanoFim write FanoFim;
    property anoInicio:           Integer                      read FanoInicio write FanoInicio;
    property aviso:               string                       read Faviso write Faviso;
    property diaFim:              Integer                      read FdiaFim write FdiaFim;
    property diaInicio:           Integer                      read FdiaInicio write FdiaInicio;
    property especial:            Boolean                      read Fespecial write Fespecial;
    property fonte:               string                       read Ffonte write Ffonte;
    property fullName:            string                       read FfullName write FfullName;
    property gestorProprietario:  string                       read FgestorProprietario write FgestorProprietario;
    property mesFim:              Integer                      read FmesFim write FmesFim;
    property mesInicio:           Integer                      read FmesInicio write FmesInicio;
    property nomeAbreviado:       string                       read FnomeAbreviado write FnomeAbreviado;
    property nomeCompleto:        string                       read FnomeCompleto write FnomeCompleto;
    property oid:                 Int64                        read Foid write Foid;
    property periodicidade:       string                       read Fperiodicidade write Fperiodicidade;
    property periodicidadeSigla:  string                       read FperiodicidadeSigla write FperiodicidadeSigla;
    property possuiBloqueios:     Boolean                      read FpossuiBloqueios write FpossuiBloqueios;
    property publica:             Boolean                      read Fpublica write Fpublica;
    property shortName:           string                       read FshortName write FshortName;
    property ultimoValor:         WSValorSerieVO               read FultimoValor write FultimoValor;
    property unidadePadrao:       string                       read FunidadePadrao write FunidadePadrao;
    property unidadePadraoIngles: string                       read FunidadePadraoIngles write FunidadePadraoIngles;
    property valorDiaNaoUtil:     Boolean                      read FvalorDiaNaoUtil write FvalorDiaNaoUtil;
    property valores:             ArrayOf_tns2_WSValorSerieVO  read Fvalores write Fvalores;
  end;


  // ************************************************************************ //
  // Namespace : http://publico.ws.casosdeuso.sgs.pec.bcb.gov.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : FachadaWSSGSSoapBinding
  // service   : FachadaWSSGSService
  // port      : FachadaWSSGS
  // URL       : https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS
  // ************************************************************************ //
  FachadaWSSGS = interface(IInvokable)
  ['{A1C63EC0-C9C9-66FD-56BD-D3EE44F902C2}']
    function  getValoresSeriesVO(const in0: ArrayOfflong; const in1: string; const in2: string): ArrayOffWSSerieVO; stdcall;
    function  getUltimosValoresSerieVO(const in0: Int64; const in1: Int64): WSSerieVO; stdcall;
    function  getValoresSeriesXML(const in0: ArrayOfflong; const in1: string; const in2: string): string; stdcall;
    function  getUltimoValorVO(const in0: Int64): WSSerieVO; stdcall;
    function  getUltimoValorXML(const in0: Int64): string; stdcall;
    function  getValor(const in0: Int64; const in1: string): TXSDecimal; stdcall;
    function  getValorEspecial(const in0: Int64; const in1: string; const in2: string): TXSDecimal; stdcall;
  end;

function GetFachadaWSSGS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): FachadaWSSGS;


implementation
  uses System.SysUtils;

function GetFachadaWSSGS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): FachadaWSSGS;
const
  defWSDL = 'https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl';
  defURL  = 'https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS';
  defSvc  = 'FachadaWSSGSService';
  defPrt  = 'FachadaWSSGS';
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
    Result := (RIO as FachadaWSSGS);
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


destructor WSValorSerieVO.Destroy;
begin
  System.SysUtils.FreeAndNil(Fvalor);
  inherited Destroy;
end;

destructor WSSerieVO.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fvalores)-1 do
    System.SysUtils.FreeAndNil(Fvalores[I]);
  System.SetLength(Fvalores, 0);
  System.SysUtils.FreeAndNil(FultimoValor);
  inherited Destroy;
end;

initialization
  { FachadaWSSGS }
  InvRegistry.RegisterInterface(TypeInfo(FachadaWSSGS), 'http://publico.ws.casosdeuso.sgs.pec.bcb.gov.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FachadaWSSGS), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOffWSSerieVO), 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'ArrayOffWSSerieVO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOf_tns2_WSValorSerieVO), 'https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS', 'ArrayOf_tns2_WSValorSerieVO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfflong), 'http://DefaultNamespace', 'ArrayOfflong');
  RemClassRegistry.RegisterXSClass(WSValorSerieVO, 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'WSValorSerieVO');
  RemClassRegistry.RegisterXSClass(WSSerieVO, 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'WSSerieVO');

end.