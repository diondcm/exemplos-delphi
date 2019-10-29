unit Form.ETL.Exemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove.Text, FireDAC.Comp.BatchMove, FireDAC.Stan.Intf, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmETLExemplo = class(TForm)
    FDBatchMove1: TFDBatchMove;
    FDBatchMoveTextReader1: TFDBatchMoveTextReader;
    FDBatchMoveTextWriter1: TFDBatchMoveTextWriter;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    PanelControles: TPanel;
    PanelDados: TPanel;
    Label1: TLabel;
    PanelEntrada: TPanel;
    PanelSaida: TPanel;
    Splitter1: TSplitter;
    MemoDadosEntrada: TMemo;
    Splitter2: TSplitter;
    DBGridEntrada: TDBGrid;
    Panel1: TPanel;
    Splitter3: TSplitter;
    MemoDadosSaida: TMemo;
    DBGridDadosSaida: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ButtonDadosToDados: TButton;
    ButtonTextoToText: TButton;
    ButtonTextToDados: TButton;
    ButtonDadosToText: TButton;
    qryImport: TFDQuery;
    qryExport: TFDQuery;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    procedure ButtonTextToDadosClick(Sender: TObject);
    procedure ButtonDadosToTextClick(Sender: TObject);
    procedure ButtonTextoToTextClick(Sender: TObject);
    procedure ButtonDadosToDadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmETLExemplo: TfrmETLExemplo;

implementation

{$R *.dfm}

uses Data.Dados;

procedure TfrmETLExemplo.ButtonDadosToDadosClick(Sender: TObject);
begin
  qryImport.Connection.ExecSQL('delete from import');
  qryImport.Connection.Commit;

  FDBatchMoveDataSetReader1.DataSet := qryExport;
  qryExport.Close;
  qryExport.Open;

  FDBatchMoveDataSetWriter1.DataSet := qryImport;
  FDBatchMoveDataSetWriter1.Optimise := False;

  FDBatchMove1.Reader := FDBatchMoveDataSetReader1;
  FDBatchMove1.Writer := FDBatchMoveDataSetWriter1;
  FDBatchMove1.GuessFormat;
  FDBatchMove1.Execute;

  qryExport.Open;
  qryImport.Open;
end;

procedure TfrmETLExemplo.ButtonDadosToTextClick(Sender: TObject);
begin
  FDBatchMoveDataSetReader1.DataSet := qryExport;
  qryExport.Close;
  qryExport.Open;

  if FileExists(FDBatchMoveTextWriter1.FileName) then
  begin
    DeleteFile(FDBatchMoveTextWriter1.FileName);
  end;

  FDBatchMoveTextWriter1.FileName := ExtractFilePath(Application.ExeName) + 'data\origem.out.data';
  FDBatchMoveTextWriter1.DataDef.Separator := ';';
  FDBatchMoveTextWriter1.DataDef.WithFieldNames := True;

  FDBatchMove1.Reader := FDBatchMoveDataSetReader1;
  FDBatchMove1.Writer := FDBatchMoveTextWriter1;
  FDBatchMove1.GuessFormat;
  FDBatchMove1.Execute;

  qryExport.Open;
  MemoDadosSaida.Lines.LoadFromFile(FDBatchMoveTextWriter1.FileName);
end;

procedure TfrmETLExemplo.ButtonTextoToTextClick(Sender: TObject);
begin
  FDBatchMoveTextReader1.FileName := ExtractFilePath(Application.ExeName) + 'data\origem.data';
  FDBatchMoveTextReader1.DataDef.Separator := ';';
  FDBatchMoveTextReader1.DataDef.WithFieldNames := True;

  if FileExists(FDBatchMoveTextWriter1.FileName) then
  begin
    DeleteFile(FDBatchMoveTextWriter1.FileName);
  end;

  FDBatchMoveTextWriter1.FileName := ExtractFilePath(Application.ExeName) + 'data\origem.out.2.data';
  FDBatchMoveTextWriter1.DataDef.Separator := ';';
  FDBatchMoveTextWriter1.DataDef.WithFieldNames := True;


  FDBatchMove1.Reader := FDBatchMoveTextReader1;
  FDBatchMove1.Writer := FDBatchMoveTextWriter1;
  FDBatchMove1.GuessFormat;
  FDBatchMove1.Execute;

  MemoDadosEntrada.Lines.LoadFromFile(FDBatchMoveTextReader1.FileName);
  MemoDadosSaida.Lines.LoadFromFile(FDBatchMoveTextWriter1.FileName);
end;

procedure TfrmETLExemplo.ButtonTextToDadosClick(Sender: TObject);
begin
  qryImport.Connection.ExecSQL('delete from import');
  qryImport.Connection.Commit;

  FDBatchMoveTextReader1.FileName := ExtractFilePath(Application.ExeName) + 'data\origem.data';

  FDBatchMoveTextReader1.DataDef.Separator := ';';
  FDBatchMoveTextReader1.DataDef.WithFieldNames := True;

  FDBatchMoveDataSetWriter1.DataSet := qryImport;
  FDBatchMoveDataSetWriter1.Optimise := False;

  FDBatchMove1.Reader := FDBatchMoveTextReader1;
  FDBatchMove1.Writer := FDBatchMoveDataSetWriter1;
  FDBatchMove1.GuessFormat;
  FDBatchMove1.Execute;

  qryImport.Open;
  MemoDadosEntrada.Lines.LoadFromFile(FDBatchMoveTextReader1.FileName);
end;

end.
