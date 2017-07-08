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
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids;

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
    btnReport: TButton;
    qryListaProdutos: TFDQuery;
    frxDBListaProduto: TfrxDBDataset;
    frxReportListaProdutos: TfrxReport;
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnReportClick(Sender: TObject);
begin
  qryCategoria.Open;
  qryProdutos.Open;
  frxReportMasterDetail.ShowReport;
end;

end.
