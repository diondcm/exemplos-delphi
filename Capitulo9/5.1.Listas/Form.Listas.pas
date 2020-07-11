unit Form.Listas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, frxDBSet, frxGradient, frxDCtrl, frxRich, frxChBox, frxCtrls, frxDBXComponents,
  Data.DbxSqlite, Data.SqlExpr;

type
  TfrmListas = class(TForm)
    frxReportListas: TfrxReport;
    DBGrid1: TDBGrid;
    dtsLista: TDataSource;
    PanelControles: TPanel;
    DBNavigator1: TDBNavigator;
    ButtonOpen: TButton;
    StatusBarGeral: TStatusBar;
    cdsLista: TClientDataSet;
    DBImage1: TDBImage;
    frxDBDataset1: TfrxDBDataset;
    ButtonImagens: TButton;
    frxReportImagens: TfrxReport;
    DBRichEdit1: TDBRichEdit;
    frxReportFiltro: TfrxReport;
    ButtonFiltro: TButton;
    procedure FormCreate(Sender: TObject);
    procedure dtsListaStateChange(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonImagensClick(Sender: TObject);
    procedure ButtonFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListas: TfrmListas;

implementation

{$R *.dfm}

procedure TfrmListas.ButtonFiltroClick(Sender: TObject);
begin
  frxReportFiltro.ShowReport;
end;

procedure TfrmListas.ButtonImagensClick(Sender: TObject);
begin
  frxReportImagens.ShowReport;
end;

procedure TfrmListas.ButtonOpenClick(Sender: TObject);
begin
  // abre tela filtros >> aplica no dataset >> exibe o relatório

  frxReportListas.ShowReport;
//  frxReportListas.Print;
end;

procedure TfrmListas.dtsListaStateChange(Sender: TObject);
begin
  if cdsLista.IsEmpty then
  begin
    StatusBarGeral.Panels[0].Text := 'Sem Dados';
  end else begin
    StatusBarGeral.Panels[0].Text := IntToStr(cdsLista.RecordCount) + ' registros';
  end;
end;

procedure TfrmListas.FormCreate(Sender: TObject);
begin
  QuotedStr('');
end;

end.
