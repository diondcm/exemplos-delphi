unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, frxClass, frxDBSet, frxExportXLSX, frxExportXLS, frxExportHTML, frxExportImage, frxExportPDF,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    panelControles: TPanel;
    buttonImpCategoriaAtual: TButton;
    gridCategoria: TDBGrid;
    gridProdutos: TDBGrid;
    Splitter1: TSplitter;
    FDConnection: TFDConnection;
    qryCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    qryProdutos: TFDQuery;
    dtsProdutos: TDataSource;
    frxReportGroupDataSet: TfrxReport;
    frxDBCategoria: TfrxDBDataset;
    frxDBProdutos: TfrxDBDataset;
    qryListaProdutos: TFDQuery;
    frxDBListaProdutos: TfrxDBDataset;
    frxReportListaProdutos: TfrxReport;
    buttonProdutoPorCategoria: TButton;
    PopupMenu: TPopupMenu;
    PDF1: TMenuItem;
    JPG1: TMenuItem;
    HTML1: TMenuItem;
    XLS1: TMenuItem;
    XLSX1: TMenuItem;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXLSXExport1: TfrxXLSXExport;
    procedure buttonImpCategoriaAtualClick(Sender: TObject);
    procedure buttonProdutoPorCategoriaClick(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure JPG1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure XLS1Click(Sender: TObject);
    procedure XLSX1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonImpCategoriaAtualClick(Sender: TObject);
begin
  qryCategoria.Open;
  qryProdutos.Open;
  frxReportGroupDataSet.ShowReport;
end;

procedure TfrmPrincipal.buttonProdutoPorCategoriaClick(Sender: TObject);
begin
  qryListaProdutos.Open;
  frxReportListaProdutos.ShowReport;
end;

procedure TfrmPrincipal.HTML1Click(Sender: TObject);
begin
  frxReportListaProdutos.Export(frxHTMLExport1);
end;

procedure TfrmPrincipal.JPG1Click(Sender: TObject);
begin
  frxReportListaProdutos.Export(frxJPEGExport1);
end;

procedure TfrmPrincipal.PDF1Click(Sender: TObject);
begin
  frxReportListaProdutos.Export(frxPDFExport1);
end;

procedure TfrmPrincipal.XLS1Click(Sender: TObject);
begin
  frxReportListaProdutos.Export(frxXLSExport1);
end;

procedure TfrmPrincipal.XLSX1Click(Sender: TObject);
begin
  frxReportListaProdutos.Export(frxXLSXExport1);
end;

end.
