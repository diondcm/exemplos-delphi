unit Data.VarsETemplates;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.StrUtils;

type
  TdmdVarsETemplate = class(TDataModule)
    frxReportVars: TfrxReport;
    FDConnection: TFDConnection;
    qryVendas: TFDQuery;
    frxDBVendas: TfrxDBDataset;
    procedure frxReportVarsBeforePrint(Sender: TfrxReportComponent);
    procedure DataModuleCreate(Sender: TObject);
  private
    FSQLVendasPadrao: string;
    FNomeRel: string;
  public
    procedure ExibeListaVendas(pFiltro, pSQLFiltro: string);
    property NomeRel: string read FNomeRel write FNomeRel;
  end;

var
  dmdVarsETemplate: TdmdVarsETemplate;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdVarsETemplate.DataModuleCreate(Sender: TObject);
begin
  FSQLVendasPadrao := qryVendas.SQL.Text;
end;

procedure TdmdVarsETemplate.ExibeListaVendas(pFiltro, pSQLFiltro: string);
begin
  dmdVarsETemplate.qryVendas.Close;

  dmdVarsETemplate.qryVendas.SQL.Text := FSQLVendasPadrao;

  if pSQLFiltro <> '' then
  begin
    dmdVarsETemplate.qryVendas.SQL.Text := StringReplace(FSQLVendasPadrao, '/*FILTRO*/', pSQLFiltro, [rfIgnoreCase]);
  end;

  dmdVarsETemplate.qryVendas.Open;

  frxReportVars.Variables['filtro'] := QuotedStr('De 01/07/2019 à 05/07/2019');
  dmdVarsETemplate.frxReportVars.ShowReport;
end;

procedure TdmdVarsETemplate.frxReportVarsBeforePrint(Sender: TfrxReportComponent);
begin
  frxReportVars.Variables['idrel'] := QuotedStr(UnitName);
//  frxReportVars.Variables['filtro'] := QuotedStr('De 01/07/2019 à 05/07/2019');
  frxReportVars.Variables['nome_rel'] := IfThen(FNomeRel = '', QuotedStr('Lista de vendas'), QuotedStr(FNomeRel));
end;

end.
