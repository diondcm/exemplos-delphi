unit Data.Grupo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet;

type
  TdmdGrupo = class(TDataModule)
    FDConnection: TFDConnection;
    qryCategoria: TFDQuery;
    frxReportListaGrupo: TfrxReport;
    dtsCategoria: TDataSource;
    qryProduto: TFDQuery;
    frxDBCategoria: TfrxDBDataset;
    frxDBProduto: TfrxDBDataset;
    qryListaProdutos: TFDQuery;
    frxDBListaProdutos: TfrxDBDataset;
    frxReportListaProduto: TfrxReport;
    procedure qryCategoriaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdGrupo: TdmdGrupo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdGrupo.qryCategoriaAfterOpen(DataSet: TDataSet);
begin
  qryProduto.Open;
end;

end.
