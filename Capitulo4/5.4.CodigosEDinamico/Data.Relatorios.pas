unit Data.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, FireDAC.Comp.DataSet, frxBarcode;

type
  TdmdRelatorios = class(TDataModule)
    FDConnection: TFDConnection;
    qryDept: TFDQuery;
    frxDBDept: TfrxDBDataset;
    frxReportCodigos: TfrxReport;
    frxReportRunTime: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
