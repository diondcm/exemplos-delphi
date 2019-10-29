unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdDados = class(TDataModule)
    FDConnection: TFDConnection;
    qryCompras: TFDQuery;
    memDadosSaidaComprasLinear: TFDMemTable;
    memDadosSaidaComprasLinearx: TFloatField;
    memDadosSaidaComprasLineary: TFloatField;
    memDadosSaidaLinear: TFDMemTable;
    memDadosSaidaLinearx: TFloatField;
    memDadosSaidaLineary: TFloatField;
    memDadosSaidaNN: TFDMemTable;
    memDadosSaidaNNx: TFloatField;
    memDadosSaidaNNy: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdDados: TdmdDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
