unit Form.Principal.Test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, WinAPI.ShellAPI,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  VCLTee.TeEngine, VCLTee.Series, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.ExtCtrls, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids;

type
  TfrmRegrassao = class(TForm)
    PanelControles: TPanel;
    ButtonGSL: TButton;
    DBChart1: TDBChart;
    memDadosEntrada: TFDMemTable;
    memDadosEntradax: TFloatField;
    memDadosEntraday: TFloatField;
    ButtonResultados: TButton;
    ButtonETL: TButton;
    ButtonNN: TButton;
    DataSource1: TDataSource;
    Series3: TLineSeries;
    PanelDosDados: TPanel;
    ButtonRegressaoCompras: TButton;
    Splitter2: TSplitter;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    MemoLog: TMemo;
    Splitter1: TSplitter;
    Series4: TLineSeries;
    Series2: TPointSeries;
    Series1: TLineSeries;
    procedure ButtonGSLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonResultadosClick(Sender: TObject);
    procedure ButtonETLClick(Sender: TObject);
    procedure ButtonNNClick(Sender: TObject);
    procedure ButtonRegressaoComprasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegrassao: TfrmRegrassao;

implementation

{$R *.dfm}

uses gsl, Form.ETL.Exemplo, Form.NNTest, Data.Dados;

procedure TfrmRegrassao.ButtonRegressaoComprasClick(Sender: TObject);
var
  I: Integer;
  X, Y : array of Double;
  c0,c1, cov00, cov01, cov11, sumsq:double;
begin
  dmdDados.qryCompras.Close;
  dmdDados.qryCompras.Open;

  if dmdDados.qryCompras.IsEmpty then Exit;

  SetLength(X, dmdDados.qryCompras.RecordCount);
  SetLength(Y, dmdDados.qryCompras.RecordCount);

  dmdDados.qryCompras.First;
  while not dmdDados.qryCompras.Eof do
  begin
    X[dmdDados.qryCompras.RecNo] := dmdDados.qryCompras.RecNo;
    Y[dmdDados.qryCompras.RecNo] := dmdDados.qryCompras.FieldByName('total').AsCurrency;
    dmdDados.qryCompras.Next;
  end;

  gsl_fit_linear(@X[0], 1, @Y[0], 1, Length(y), @c0, @c1, @cov00, @cov01, @cov11, @sumsq);

  dmdDados.memDadosSaidaComprasLinear.DisableControls;

  for I := 0 to ((length(y)*3) -1) do
  begin
    dmdDados.memDadosSaidaComprasLinear.Append;

    dmdDados.memDadosSaidaComprasLinearx.AsFloat := i;
    dmdDados.memDadosSaidaComprasLineary.AsFloat := I*c1+c0;

    dmdDados.memDadosSaidaComprasLinear.Post;
  end;

  dmdDados.memDadosSaidaComprasLinear.EnableControls;
  DBChart1.RefreshData;

  MemoLog.Lines.Insert(0, 'c0: ' + FloatToStr(c0));
  MemoLog.Lines.Insert(0, 'c1: ' + FloatToStr(c1));

  MemoLog.Lines.Insert(0, 'Função: y(t) = ' + FormatFloat('0.00', c1) + '*x + ' + FormatFloat('0.00', c0));
end;

procedure TfrmRegrassao.ButtonETLClick(Sender: TObject);
begin
  frmETLExemplo.Show;
end;

procedure TfrmRegrassao.ButtonGSLClick(Sender: TObject);
var
  I: Integer;
  X,Y:array [0..199] of Double;
  c0,c1, cov00, cov01, cov11, sumsq:double;
  lDiff: Extended;
begin
  for I := 0 to Length(y) -1 do
  begin
    memDadosEntrada.Append;
    memDadosEntradax.AsFloat := i;

    Randomize;
    if (Random(10) mod 2) = 0 then
    begin
      Randomize;
      lDiff := Random(20) /10;
    end else begin
      Randomize;
      lDiff := - Random(20) /10;
    end;

    X[I]:=I;
    Y[I]:=I*1.23+ 3.64 + lDiff;
    memDadosEntraday.AsFloat := Y[I];

    memDadosEntrada.Post;
  end;

//  memDadosEntrada.SaveToFile(ExtractFilePath(ParamStr(0)) + 'dados.json', sfJSON);

  gsl_fit_linear(@X[0], 1, @Y[0], 1, Length(y), @c0, @c1, @cov00, @cov01, @cov11, @sumsq);

  for I := 0 to (length(y) + (length(y) div 3))-1 do
  begin
    dmdDados.memDadosSaidaLinear.Append;

    dmdDados.memDadosSaidaLinearx.AsFloat := i;
    dmdDados.memDadosSaidaLineary.AsFloat := I*c1+c0;

    dmdDados.memDadosSaidaLinear.Post;
  end;

  DBChart1.RefreshData;

  MemoLog.Lines.Insert(0, 'c0: ' + FloatToStr(c0));
  MemoLog.Lines.Insert(0, 'c1: ' + FloatToStr(c1));
end;

procedure TfrmRegrassao.ButtonNNClick(Sender: TObject);
begin
  frmNNTest.Show;
end;

procedure TfrmRegrassao.ButtonResultadosClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'C:\Desenv\Aqua\projs\chromium\CEF4Delphi\bin\ShowResultado.exe', nil, 'C:\Desenv\Aqua\projs\chromium\CEF4Delphi\bin\', SW_SHOWNORMAL);
end;

procedure TfrmRegrassao.FormShow(Sender: TObject);
begin
  memDadosEntrada.Open;
  dmdDados.memDadosSaidaComprasLinear.Open;
  dmdDados.memDadosSaidaLinear.Open;
end;

end.
