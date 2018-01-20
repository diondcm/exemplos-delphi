unit Data.DBDemos;

interface

uses
  Windows, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt,
  FireDAC.Stan.StorageXML;

type
  TdmdDBDemos = class(TDataModule)
    memCustomer: TFDMemTable;
    frxReportMasterDetail: TfrxReport;
    frxDBCustomer: TfrxDBDataset;
    memOrders: TFDMemTable;
    frxDBOrders: TfrxDBDataset;
    dtsOrders: TDataSource;
    dtsCustomer: TDataSource;
    memItems: TFDMemTable;
    frxDBItems: TfrxDBDataset;
    memParts: TFDMemTable;
    frxDBParts: TfrxDBDataset;
    dtsItems: TDataSource;
    memVendors: TFDMemTable;
    dtsParts: TDataSource;
    frxDBVendors: TfrxDBDataset;
    frxReportCrossTest: TfrxReport;
    frxDBSalary: TfrxDBDataset;
    memSalary: TFDMemTable;
    frxReportSubReportAndDialog: TfrxReport;
    memCountry: TFDMemTable;
    frxDBCountry: TfrxDBDataset;
    Memlista: TFDMemTable;
    MemlistaCountry: TStringField;
    MemlistaCountryNo: TIntegerField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure DataModuleCreate(Sender: TObject);
  strict private
    class var FInstancia: TdmdDBDemos;
  private
    class function GetInstancia: TdmdDBDemos; static;
  public
    class property Instancia: TdmdDBDemos read GetInstancia write FInstancia;
  end;

//var
//  dmdDBDemos: TdmdDBDemos;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdDBDemos }

procedure TdmdDBDemos.DataModuleCreate(Sender: TObject);
var
  lValorAtual: string;
begin
  Memlista.Open;
  memCountry.First;
  while not memCountry.Eof do
  begin
    if lValorAtual <> memCountry.FieldByName('Country').AsString then
    begin
      lValorAtual := memCountry.FieldByName('Country').AsString;
      Memlista.Append;
      MemlistaCountry.AsString := lValorAtual;
      MemlistaCountryNo.AsInteger := GetTickCount;
      Memlista.Post;
    end;

    memCountry.Next;
  end;

  Memlista.SaveToFile('C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\Country.xml');

end;

class function TdmdDBDemos.GetInstancia: TdmdDBDemos;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TdmdDBDemos.Create(Application);
  end;

  Result := FInstancia;
end;

end.
