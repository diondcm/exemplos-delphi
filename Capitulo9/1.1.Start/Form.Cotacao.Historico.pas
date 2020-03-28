unit Form.Cotacao.Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCotacaoHistorico = class(TForm)
    MemoHistorico: TMemo;
    PanelCaption: TPanel;
    PanelControles: TPanel;
    buttonOk: TBitBtn;
    LabelCotacaoAtual: TLabel;
    procedure buttonOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCotacaoHistorico: TfrmCotacaoHistorico;

implementation

{$R *.dfm}

uses Data.Cotacao, ITConversorMoeda1;

procedure TfrmCotacaoHistorico.buttonOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCotacaoHistorico.FormActivate(Sender: TObject);
var
  lConv: ITConversorMoeda;
begin
  lConv := GetITConversorMoeda;
  LabelCotacaoAtual.Caption := 'Cotação atual: ' + lConv.GetCotacaoAtual;
  MemoHistorico.Text := lConv.GetHistorico;
end;

end.
