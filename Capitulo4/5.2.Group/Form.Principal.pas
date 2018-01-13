unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, frxClass, frxDBSet;

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
    procedure buttonImpCategoriaAtualClick(Sender: TObject);
    procedure buttonProdutoPorCategoriaClick(Sender: TObject);
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

end.
