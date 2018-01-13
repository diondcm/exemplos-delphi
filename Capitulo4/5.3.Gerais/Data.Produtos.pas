unit Data.Produtos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdProdutos = class(TDataModule)
    FDConnection: TFDConnection;
    qryProdutos: TFDQuery;
    frxDBProdutos: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdProdutos: TdmdProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
