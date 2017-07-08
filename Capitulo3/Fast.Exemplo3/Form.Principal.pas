unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids,
  Vcl.DBGrids, frxClass, frxDBSet, StrUtils, frxBarcode;

type
  TfrmPrincipal = class(TForm)
    dbgProduto: TDBGrid;
    dtsProduto: TDataSource;
    qryProduto: TFDQuery;
    FDConnection1: TFDConnection;
    frxReport1: TfrxReport;
    frxDBProduto: TfrxDBDataset;
    frxReportFilho: TfrxReport;
    frxReportListaSimples: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure dbgProdutoDblClick(Sender: TObject);
    procedure frxReportFilhoBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.dbgProdutoDblClick(Sender: TObject);
begin
  frxReportFilho.Variables['id_rel'] := 2314;
  frxReportFilho.Variables['id_rel2'] := 2314;
  frxReportFilho.Variables['filtro'] := QuotedStr('Todos os produtos');
  frxReportFilho.ShowReport;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  qryProduto.Open;
end;

procedure TfrmPrincipal.frxReportFilhoBeforePrint(Sender: TfrxReportComponent);
begin
  if (Sender is TfrxMemoView) and
    (LowerCase(TfrxMemoView(Sender).Name) = LowerCase('memLicenca')) then
  begin
    TfrxMemoView(Sender).Text := IfThen(DayOfWeek(Now) = 2, 'Válida', 'Não Válida');
    TfrxMemoView(Sender).Color := clGray;
  end;
end;

end.
