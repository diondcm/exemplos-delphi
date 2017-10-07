unit Data.Paises;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Stan.StorageXML, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TdmdPaises = class(TDataModule)
    FDConnection: TFDConnection;
    qryPaises: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    qryPaisesCode: TIntegerField;
    qryPaisesArea: TIntegerField;
    qryPaisesPopulation: TIntegerField;
    qryPaisesName: TWideStringField;
    qryPaisesContinent: TWideStringField;
    qryPaisesCapital: TWideStringField;
    qryDBPaises: TFDQuery;
    qryDBPaisesID: TFDAutoIncField;
    qryDBPaisesCODE: TIntegerField;
    qryDBPaisesArea: TWideStringField;
    qryDBPaisesPOPULATION: TIntegerField;
    qryDBPaisesNAME: TWideStringField;
    qryDBPaisesCONTINENT: TWideStringField;
    qryDBPaisesCAPITAL: TWideStringField;
    procedure FDConnectionAfterConnect(Sender: TObject);
  private const
    ARQ_XML = 'country.xml';
  public
    procedure Carregar;
    procedure EnviaParaDB;
  end;

var
  dmdPaises: TdmdPaises;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmdPaises }

procedure TdmdPaises.Carregar;
begin
  qryPaises.LoadFromFile(ARQ_XML);
end;

procedure TdmdPaises.EnviaParaDB;
begin
//  qryDBPaises.Data := qryPaises.Data; // Mais Rápido
//  qryDBPaises.CommitUpdates;

  qryDBPaises.Open;
  qryDBPaises.CopyDataSet(qryPaises);
end;

procedure TdmdPaises.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
    ' CREATE TABLE IF NOT EXISTS PAISES ( '+
    '  ID         INTEGER      PRIMARY KEY AUTOINCREMENT, '+
    '  CODE       INTEGER, ' +
    '  Area       STRING (200),' +
    '  POPULATION INTEGER, ' +
    '  NAME       STRING (200), ' +
    '  CONTINENT  STRING (200), '+
    '  CAPITAL    STRING (200))');

end;

end.
