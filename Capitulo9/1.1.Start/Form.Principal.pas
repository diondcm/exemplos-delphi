unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    TimerAtualizaCotacao: TTimer;
    PanelParametro: TPanel;
    LabelParametroCotacao: TLabel;
    EditParametroCotacao: TEdit;
    PanelConvercao: TPanel;
    EditValorResultado: TEdit;
    PanelExibeValores: TPanel;
    buttonCotacao: TButton;
    labelCotacao: TStaticText;
    PanelValorEntrada: TPanel;
    EditValorMoeda: TEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ButtonHistorico: TButton;
    Panel1: TPanel;
    ButtonRealParaDolar: TButton;
    ButtonDolarParaReal: TButton;
    procedure buttonCotacaoClick(Sender: TObject);
    procedure TimerAtualizaCotacaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonRealParaDolarClick(Sender: TObject);
    procedure ButtonHistoricoClick(Sender: TObject);
    procedure EditParametroCotacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ButtonDolarParaRealClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.Cotacao.Historico, Data.Cotacao, ITConversorMoeda1;

procedure TfrmPrincipal.ButtonRealParaDolarClick(Sender: TObject);
begin
  EditValorResultado.Text := dmdCotacao.ConverteRealParaDolar(EditValorMoeda.Text);
end;

procedure TfrmPrincipal.ButtonDolarParaRealClick(Sender: TObject);
begin
  EditValorResultado.Text := dmdCotacao.ConverteDolarParaReal(EditValorMoeda.Text);
end;

procedure TfrmPrincipal.buttonCotacaoClick(Sender: TObject);
begin
  ShowMessage('Cotação atual: ' + EditParametroCotacao.Text);
end;

procedure TfrmPrincipal.ButtonHistoricoClick(Sender: TObject);
begin
  frmCotacaoHistorico.Show;
end;

procedure TfrmPrincipal.EditParametroCotacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
//    dmdCotacao.FCotacaoAtual := EditParametroCotacao.Text;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TimerAtualizaCotacao.Enabled := True;
end;

procedure TfrmPrincipal.TimerAtualizaCotacaoTimer(Sender: TObject);
var
  lConv: ITConversorMoeda;
begin
  lConv := GetITConversorMoeda;
  labelCotacao.Caption := 'Cotação atual: ' + lConv.GetCotacaoAtual;
  EditParametroCotacao.Text := lConv.GetCotacaoAtual;
end;

end.
