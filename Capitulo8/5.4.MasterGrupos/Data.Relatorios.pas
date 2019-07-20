unit Data.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, frxClass,
  Data.DB, frxDBSet, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxGradient, FireDAC.DApt, frxChart;

type
  TdmdRelatorios = class(TDataModule)
    FDConnection: TFDConnection;
    memCustomerMD: TFDMemTable;
    memOrdersMD: TFDMemTable;
    memItemsMD: TFDMemTable;
    memPartsMD: TFDMemTable;
    memVendorsMD: TFDMemTable;
    frxDBCustomerMD: TfrxDBDataset;
    frxDBOrdersMD: TfrxDBDataset;
    frxDBItemsMD: TfrxDBDataset;
    frxDBPartsMD: TfrxDBDataset;
    frxDBVendors: TfrxDBDataset;
    dtsCustomerMD: TDataSource;
    dtsOrdersMD: TDataSource;
    dtsItemsMD: TDataSource;
    dtsPartsMD: TDataSource;
    dtsVendorsMD: TDataSource;
    frxReport: TfrxReport;
    frxReportGrafico: TfrxReport;
    qryGrafico: TFDQuery;
    frxDBGrafico: TfrxDBDataset;
    frxReport1: TfrxReport;
  private const
     REL_MASTER_GRUPO = 'MasterGrupos.fr3';
  private
    { Private declarations }
    procedure ImprimeRel(pNomeRel: string; pVisualizar: Boolean);
  public
    { Public declarations }
    procedure ImprimeMasterGrupo;
    procedure ImprimeGrafico;
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdRelatorios }

procedure TdmdRelatorios.ImprimeGrafico;
begin
  qryGrafico.Close;
  qryGrafico.Open;

  frxReportGrafico.ShowReport;
end;

procedure TdmdRelatorios.ImprimeMasterGrupo;
begin
  ImprimeRel(REL_MASTER_GRUPO, True);
end;

procedure TdmdRelatorios.ImprimeRel(pNomeRel: string; pVisualizar: Boolean);
begin
  if FileExists(pNomeRel) then
  begin
    frxReport.LoadFromFile(pNomeRel);
    if pVisualizar then
    begin
      frxReport.ShowReport;
    end else begin
      frxReport.Print;
    end;
  end else
    raise Exception.Create('Arquivo não encontrado: ' + pNomeRel);
end;

end.
