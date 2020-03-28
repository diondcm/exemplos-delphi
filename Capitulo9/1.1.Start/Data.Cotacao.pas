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
    FCotacaoAtual: string;
    FHistorico: string;
  end;

var
  dmdCotacao: TdmdCotacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdCotacao.DataModuleCreate(Sender: TObject);
begin
  FCotacaoAtual := '5,10';
  TimerAtualizaCotacao.Enabled := True;
end;

procedure TdmdCotacao.TimerAtualizaCotacaoTimer(Sender: TObject);
begin
  if Odd(Random(10)){ even() } then
  begin
    FCotacaoAtual := FloatToStr(StrToFloat(FCotacaoAtual) + (5 * Random(30)/100));
  end else begin
    FCotacaoAtual := FloatToStr(StrToFloat(FCotacaoAtual) - (5 * Random(30)/100));
  end;

  FHistorico := FHistorico + sLineBreak + DateTimeToStr(Now) + ' - ' + FCotacaoAtual;
end;

end.
