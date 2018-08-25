unit Data.Group;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, frxExportPDF, frxExportXLS, frxExportXLSX, frxExportHTML, frxExportImage;

type
  TdmdGroup = class(TDataModule)
    FDConnection: TFDConnection;
    qryCategoria: TFDQuery;
    qryProduto: TFDQuery;
    frxReportGroup: TfrxReport;
    frxDBCategoria: TfrxDBDataset;
    frxDBProduto: TfrxDBDataset;
    dtsCategoria: TDataSource;
    qryListaProdutos: TFDQuery;
    frxReportListaProdutos: TfrxReport;
    frxDBListaProdutos: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxJPEGExport: TfrxJPEGExport;
    frxHTMLExport: TfrxHTMLExport;
    frxXLSXExport: TfrxXLSXExport;
    frxXLSExport: TfrxXLSExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdGroup: TdmdGroup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
