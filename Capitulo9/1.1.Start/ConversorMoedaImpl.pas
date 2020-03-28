{ Invokable implementation File for TTConversorMoeda which implements ITConversorMoeda }

unit ConversorMoedaImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, ConversorMoedaIntf, System.SysUtils;

type
  { TTConversorMoeda }
  TTConversorMoeda = class(TInvokableClass, ITConversorMoeda)
  public
    function ConverteRealParaDolar(pValorMoeda: string): string;
    function ConverteDolarParaReal(pValorMoeda: string): string;

    function GetCotacaoAtual: string;
    function GetHistorico: string;
  class var
    FCotacaoAtual: string;
    FHistorico: string;
    class constructor Create;
  end;

implementation


{ TTConversorMoeda }

function TTConversorMoeda.ConverteDolarParaReal(pValorMoeda: string): string;
begin
  Result := FloatToStr(StrToFloat(pValorMoeda) * StrToFloat(FCotacaoAtual));
end;

function TTConversorMoeda.ConverteRealParaDolar(pValorMoeda: string): string;
var
  lValorMoeda: Extended;
begin
  if TryStrToFloat(pValorMoeda, lValorMoeda) then
  begin
    Result := FloatToStr(lValorMoeda / StrToFloat(FCotacaoAtual));
  end else begin
    Result := 'Valor de moeda "' + pValorMoeda + '" inválido';
  end;
end;

class constructor TTConversorMoeda.Create;
begin
  FCotacaoAtual := '5,10';
end;

function TTConversorMoeda.GetCotacaoAtual: string;
begin
  Result := FCotacaoAtual;
end;

function TTConversorMoeda.GetHistorico: string;
begin
  Result := FHistorico;
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TTConversorMoeda);
end.

