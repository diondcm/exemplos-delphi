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
    ButtonCalcula: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ButtonHistorico: TButton;
    procedure buttonCotacaoClick(Sender: TObject);
    procedure TimerAtualizaCotacaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonCalculaClick(Sender: TObject);
    procedure ButtonHistoricoClick(Sender: TObject);
    procedure EditParametroCotacaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.Cotacao.Historico, Data.Cotacao;

procedure TfrmPrincipal.ButtonCalculaClick(Sender: TObject);
begin
  EditValorResultado.Text := FloatToStr(StrtoFloat(EditValorMoeda.Text) * StrToFloat(dmdCotacao.FCotacaoAtual));
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
    dmdCotacao.FCotacaoAtual := EditParametroCotacao.Text;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TimerAtualizaCotacao.Enabled := True;
end;

procedure TfrmPrincipal.TimerAtualizaCotacaoTimer(Sender: TObject);
begin
  labelCotacao.Caption := 'Cotação atual: ' + dmdCotacao.FCotacaoAtual;
  EditParametroCotacao.Text := dmdCotacao.FCotacaoAtual;
end;

end.
