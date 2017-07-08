unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, Vcl.ExtCtrls, frxClass, frxDBSet, Vcl.StdCtrls,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, frxGradient,
  frxExportXLSX, frxExportXLS, frxExportHTML, frxExportImage, Vcl.Menus,
  frxExportPDF;

type
  TfrmPrincipal = class(TForm)
    dbgCategoria: TDBGrid;
    dbgProdutos: TDBGrid;
    pnlControles: TPanel;
    dtsProdutos: TDataSource;
    dtsCategoria: TDataSource;
    qryCategoria: TFDQuery;
    qryProdutos: TFDQuery;
    FDConnection: TFDConnection;
    frxReportMasterDetail: TfrxReport;
    frxDBCategoria: TfrxDBDataset;
    frxDBProduto: TfrxDBDataset;
    Splitter1: TSplitter;
    btnReportCategoria: TButton;
    qryListaProdutos: TFDQuery;
    frxDBListaProduto: TfrxDBDataset;
    frxReportListaProdutos: TfrxReport;
    btnProdutoCategoria: TButton;
    frxPDFExport1: TfrxPDFExport;
    btnExport: TButton;
    PopupMenu: TPopupMenu;
    PDF1: TMenuItem;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXLSXExport1: TfrxXLSXExport;
    JPG1: TMenuItem;
    HTML1: TMenuItem;
    XLS1: TMenuItem;
    XLSX1: TMenuItem;
    procedure btnReportCategoriaClick(Sender: TObject);
    procedure btnProdutoCategoriaClick(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure JPG1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure XLS1Click(Sender: TObject);
    procedure XLSX1Click(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExportClick(Sender: TObject);
var
  pnt: TPoint;
begin
//  if GetCursorPos(pnt) then
//    PopupMenu.Popup(pnt.X, pnt.Y);

  pnt.x := TButton(Sender).Left + 1;
  pnt.y := TButton(Sender).Top + TButton(Sender).Height + 1;
  pnt := Self.ClientToScreen( pnt );
  PopupMenu.popup( pnt.x, pnt.y );
end;

procedure TfrmPrincipal.btnProdutoCategoriaClick(Sender: TObject);
begin
  qryCategoria.Open;
  qryProdutos.Open;
  frxReportListaProdutos.ShowReport;
//  frxReportListaProdutos.DesignReport;
end;

procedure TfrmPrincipal.btnReportCategoriaClick(Sender: TObject);
begin
  qryCategoria.Open;
  qryProdutos.Open;
  frxReportMasterDetail.ShowReport;
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
