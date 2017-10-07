unit Data.Pessoa;

interface

uses
  System.SysUtils, System.Classes, Data.DbxSqlite, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, Data.SqlExpr, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmdPessoa = class(TDataModule)
    SQLConnection: TSQLConnection;
    FDConnection1: TFDConnection;
    sqlPessoa: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    FDQuery1: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1TesteFiedl: TIntegerField;
    procedure cdsPessoaAfterPost(DataSet: TDataSet);
    procedure cdsPessoaAfterCancel(DataSet: TDataSet);
    procedure cdsPessoaAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdPessoa: TdmdPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdPessoa.cdsPessoaAfterCancel(DataSet: TDataSet);
begin
  cdsPessoa.CancelUpdates;
end;

procedure TdmdPessoa.cdsPessoaAfterDelete(DataSet: TDataSet);
begin
  cdsPessoa.ApplyUpdates(0);
end;

procedure TdmdPessoa.cdsPessoaAfterPost(DataSet: TDataSet);
begin
  cdsPessoa.ApplyUpdates(0);
end;

end.
