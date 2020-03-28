unit Data.Cotacao;

interface

uses
  System.SysUtils, System.Classes, Vcl.ExtCtrls;

type
  TdmdCotacao = class(TDataModule)
    TimerAtualizaCotacao: TTimer;
    procedure TimerAtualizaCotacaoTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
//    FCotacaoAtual: string;
//    FHistorico: string;
    function ConverteRealParaDolar(pValorMoeda: string): string;
    function ConverteDolarParaReal(pValorMoeda: string): string;
  end;

  function ConverteRealParaDolarProcedural(pValorMoeda, pValorCotacao: string): string;

var
  dmdCotacao: TdmdCotacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ITConversorMoeda1;

{$R *.dfm}

function ConverteRealParaDolarProcedural(pValorMoeda, pValorCotacao: string): string;
var
  lValorMoeda: Extended;
begin
  if TryStrToFloat(pValorMoeda, lValorMoeda) then
  begin
    Result := FloatToStr(lValorMoeda / StrToFloat(pValorCotacao));
  end else begin
    Result := 'Valor de moeda "' + pValorMoeda + '" inválido';
  end;
end;

function TdmdCotacao.ConverteDolarParaReal(pValorMoeda: string): string;
var
  lConv: ITConversorMoeda;
begin
  lConv := GetITConversorMoeda;
  Result := lConv.ConverteDolarParaReal(pValorMoeda);
//  Result := FloatToStr(StrToFloat(pValorMoeda) * StrToFloat(FCotacaoAtual));
end;

function TdmdCotacao.ConverteRealParaDolar(pValorMoeda: string): string;
var
  lConv: ITConversorMoeda;
begin
  lConv := GetITConversorMoeda;
  Result := lConv.ConverteRealParaDolar(pValorMoeda);
//  Result := ConverteRealParaDolarProcedural(pValorMoeda, FCotacaoAtual);
end;

procedure TdmdCotacao.DataModuleCreate(Sender: TObject);
begin
//  FCotacaoAtual := '5,10';
//  TimerAtualizaCotacao.Enabled := True;
end;

procedure TdmdCotacao.TimerAtualizaCotacaoTimer(Sender: TObject);
begin
// migrado para o WS
//  if Odd(Random(10)){ even() } then
//  begin
//    FCotacaoAtual := FloatToStr(StrToFloat(FCotacaoAtual) + (5 * Random(30)/100));
//  end else begin
//    FCotacaoAtual := FloatToStr(StrToFloat(FCotacaoAtual) - (5 * Random(30)/100));
//  end;
//
//  FHistorico := FHistorico + sLineBreak + DateTimeToStr(Now) + ' - ' + FCotacaoAtual;
end;

end.
