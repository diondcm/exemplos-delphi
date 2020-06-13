unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Classe.Acao, System.DateUtils,
  VclTee.TeeGDIPlus, Data.DB, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCLTee.Series, Vcl.WinXPickers,
  Frame.Acao;

type
  TfrmPrincipal = class(TForm)
    PanelCotacao: TPanel;
    ButtonCotacao: TButton;
    ButtonLoad: TButton;
    DBChart1: TDBChart;
    Splitter1: TSplitter;
    Series1: TLineSeries;
    memAcao1: TFDMemTable;
    memAcao1valor: TCurrencyField;
    memAcao1data: TDateTimeField;
    EditAcao: TEdit;
    TimerTeste: TTimer;
    PanelLateral: TPanel;
    MemoLog: TMemo;
    fraAcao1: TfraAcao;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    memAcao3: TFDMemTable;
    memAcao3valor: TCurrencyField;
    memAcao3data: TDateTimeField;
    memAcao4: TFDMemTable;
    memAcao4valor: TCurrencyField;
    memAcao4data: TDateTimeField;
    memAcao5: TFDMemTable;
    memAcao5valor: TCurrencyField;
    memAcao5data: TDateTimeField;
    memAcao2: TFDMemTable;
    memAcao2valor: TCurrencyField;
    memAcao2data: TDateTimeField;
    ComboAcoes: TComboBox;
    procedure ButtonCotacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure EditAcaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TimerTesteTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboAcoesClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Classe.AcaoDB;

procedure TfrmPrincipal.ButtonCotacaoClick(Sender: TObject);
begin
  var acao: TAcao := TAcao.Create;
  var valor: TValor := TValor.Create;

  valor.Data := Now;
  valor.Valor := (10 + Random(5)) + ((10 + Random(80))/100);

  acao.Nome := 'Petrobás';
  acao.Abreviatura := 'PETR4';
  acao.Valores.Add(valor);

  fraAcao1.CarregaAcao(acao);

  MemoLog.Text := acao.ToString;

  acao.Free;
end;

procedure TfrmPrincipal.ButtonLoadClick(Sender: TObject);
const
  ARQ_UNICO = 'cotacao.txt';
  ARQ_GERAL = 'COTAHIST_A2018.TXT';
begin
  var ds: TDataSet;

  if memAcao1.IsEmpty then
  begin
    ds := memAcao1;
  end else if memAcao2.IsEmpty then
  begin
    ds := memAcao2;
  end else if memAcao3.IsEmpty then
  begin
    ds := memAcao3;
  end else if memAcao4.IsEmpty then
  begin
    ds := memAcao4;
  end else if memAcao5.IsEmpty then
  begin
    ds := memAcao5;
  end else begin
    ds := memAcao1;
  end;

  TAcaoDB.CarregaDeArquivo(EditAcao.Text, ARQ_GERAL, ds, True);

  if ComboAcoes.Items.Text = '' then
  begin
    ComboAcoes.Items.BeginUpdate;
    try
      ComboAcoes.Items.Text := TAcao.GetListaAbrevs(ARQ_GERAL);
    finally
      ComboAcoes.Items.EndUpdate;
    end;
  end;
end;

procedure TfrmPrincipal.ComboAcoesClick(Sender: TObject);
begin
  EditAcao.Text := ComboAcoes.Text;
  ButtonLoad.Click;
end;

procedure TfrmPrincipal.EditAcaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonLoad.Click;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  {$IFDEF DEBUG}
  TimerTeste.Enabled := True;// DebugHook > 0; // attach no Delphi(depuração)
  {$ENDIF}
end;

procedure TfrmPrincipal.TimerTesteTimer(Sender: TObject);
begin
  TimerTeste.Enabled := False;

  EditAcao.Text := 'PETR4';
  ButtonLoad.Click;
end;

end.
