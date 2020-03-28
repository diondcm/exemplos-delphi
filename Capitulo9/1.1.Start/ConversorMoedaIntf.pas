{ Invokable interface ITConversorMoeda }

unit ConversorMoedaIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  ITConversorMoeda = interface(IInvokable)
  ['{4DEE408A-611E-491F-8539-0705B6C0C8B5}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function ConverteRealParaDolar(pValorMoeda: string): string;
    function ConverteDolarParaReal(pValorMoeda: string): string;
    function GetCotacaoAtual: string;
    function GetHistorico: string;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ITConversorMoeda));

end.
