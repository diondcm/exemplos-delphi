unit Form.Historico.Cotacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  ClientModuleUnit1;

type
  TfrmHistoricoCotacao = class(TForm)
    TimerAtualizaCotacao: TTimer;
    StringGridCotacao: TStringGrid;
    pnlControles: TPanel;
    checkAtivaTimer: TCheckBox;
    labelCotacaoAtual: TLabel;
    procedure checkAtivaTimerClick(Sender: TObject);
    procedure TimerAtualizaCotacaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoCotacao: TfrmHistoricoCotacao;

implementation

{$R *.dfm}

procedure TfrmHistoricoCotacao.checkAtivaTimerClick(Sender: TObject);
begin
  TimerAtualizaCotacao.Enabled := checkAtivaTimer.Checked;
end;

procedure TfrmHistoricoCotacao.FormShow(Sender: TObject);
begin
  StringGridCotacao.Cells[1, 0] := 'Hora da cotação';
  StringGridCotacao.Cells[2, 0] := 'Valor';
  StringGridCotacao.RowCount := 1;
end;

procedure TfrmHistoricoCotacao.TimerAtualizaCotacaoTimer(Sender: TObject);
var
  lValorAtual: Currency;
begin
  // Shift + Ctrl + V
  lValorAtual := ClientModule1.ServerMethods1Client.GetCotacaoAtual;
  labelCotacaoAtual.Caption := Format('Valor atual %f', [lValorAtual]);

  StringGridCotacao.RowCount := StringGridCotacao.RowCount + 1;
  StringGridCotacao.Cells[1, StringGridCotacao.RowCount -1] := TimeToStr(Now); // usar com parsimonia >> Fica Desatualizada
  StringGridCotacao.Cells[2, StringGridCotacao.RowCount -1] := CurrToStr(lValorAtual);
end;

end.
