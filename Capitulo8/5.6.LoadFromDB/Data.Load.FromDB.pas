unit Data.Load.FromDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, frxClass, frxDBSet;

type
  TdmdLoadFromDB = class(TDataModule)
    FDConnection: TFDConnection;
    qryEmployee: TFDQuery;
    frxDBEmployee: TfrxDBDataset;
    frxReportFromDB: TfrxReport;
    qryRelatorios: TFDQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FRelAtual: string;
    procedure SetRelAtual(pNome: string);
  public
    { Public declarations }
    procedure GeraRelatorioEmployee;
  end;

var
  dmdLoadFromDB: TdmdLoadFromDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdLoadFromDB.DataModuleDestroy(Sender: TObject);
begin
  SetRelAtual('');
end;

procedure TdmdLoadFromDB.GeraRelatorioEmployee;
begin
  qryEmployee.Close;
  qryEmployee.Open;

  if not qryEmployee.IsEmpty then
  begin
    if (FRelAtual <> 'EMPLOYEE') then
    begin
      qryRelatorios.Close;
      qryRelatorios.Open;
      qryRelatorios.IndexFieldNames := 'DESCRICAO';
      if qryRelatorios.FindKey(['EMPLOYEE']) then
      begin
        SetRelAtual('EMPLOYEE');
        (qryRelatorios.FieldByName('REL') as TBlobField).SaveToFile(FRelAtual);
      end;
    end;

    if FRelAtual <> '' then
    begin
      frxReportFromDB.LoadFromFile(FRelAtual);
    end;

    frxReportFromDB.ShowReport;
  end else begin
    raise Exception.Create('Sem registros para exibir');
  end;
end;

procedure TdmdLoadFromDB.SetRelAtual(pNome: string);
begin
  if FRelAtual <> pNome then
  begin
    if FRelAtual <> '' then
    begin
      System.SysUtils.DeleteFile(FRelAtual);
    end;
  end;

  FRelAtual := pNome;
end;

end.
