unit Data.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Vcl.Graphics,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxGradient;

type
  TdmdRelatorios = class(TDataModule)
    Connection: TFDConnection;
    qryCategoria: TFDQuery;
    qryProdutos: TFDQuery;
    frxReportProdutos: TfrxReport;
    frxReportProdutosSQL: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    dtsCategoria: TDataSource;
    qryProdutosSQL: TFDQuery;
    frxDBDataset3: TfrxDBDataset;
    procedure qryCategoriaAfterOpen(DataSet: TDataSet);
    procedure frxReportProdutosBeforePrint(Sender: TfrxReportComponent);
    procedure DataModuleCreate(Sender: TObject);
  private
    FUsuario: string;
    FFiltros: string;
    FSQLPadraoCategoria: string;
  public
    property Usuario: string read FUsuario write FUsuario;
    property Filtros: string read FFiltros write FFiltros;
    property SQLPadraoCategoria: string read FSQLPadraoCategoria write FSQLPadraoCategoria;
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdRelatorios.DataModuleCreate(Sender: TObject);
begin
  SQLPadraoCategoria := qryCategoria.SQL.Text;
end;

procedure TdmdRelatorios.frxReportProdutosBeforePrint(
  Sender: TfrxReportComponent);
begin
  // Attention! >> roda para todos os componentes
  if (Sender is TfrxMemoView) then
  begin
    if Pos('#', TfrxMemoView(Sender).Text) > 0 then
    begin
      TfrxMemoView(Sender).Text := StringReplace(TfrxMemoView(Sender).Text, '#usuario#', FUsuario, [rfIgnoreCase]);
      TfrxMemoView(Sender).Text := StringReplace(TfrxMemoView(Sender).Text, '#filtro#', FFiltros, [rfIgnoreCase]);
    end;

    if CompareStr(LowerCase(TfrxMemoView(Sender).Name), 'memgroupcat') = 0 then
    begin
      if CompareStr(qryCategoria.FieldByName('NOME').AsString.ToLower, 'nobreak') = 0 then
      begin
        TfrxMemoView(Sender).Color := clYellow;
      end else begin
        TfrxMemoView(Sender).Color := clNone;
      end;
    end;
  end;
end;

procedure TdmdRelatorios.qryCategoriaAfterOpen(DataSet: TDataSet);
begin
  qryProdutos.Close;
  qryProdutos.Open;
end;

end.
