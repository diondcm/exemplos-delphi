unit Data.Cube;

interface

uses
  System.SysUtils, System.Classes, fcxDataSource, fcxComponent, fcxSlice, fcxCube, Data.DB, Data.Win.ADODB;

type
  TdmdCube = class(TDataModule)
    MDCube: TfcxCube;
    MDSlice: TfcxSlice;
    fcxDBDSItems: TfcxDBDataSet;
    fcxDBDScustomer: TfcxDBDataSet;
    fcxDBDSemployee: TfcxDBDataSet;
    fcxDBDSparts: TfcxDBDataSet;
    fcxDBDSorders: TfcxDBDataSet;
    fcxDBvendors: TfcxDBDataSet;
    Demo: TfcxDataSource;
    fcDBDataSet1: TfcxDBDataSet;
    fcDataSource1: TfcxDataSource;
    fcxDirDataset: TfcxUserDataSet;
    fcxCalendarDataset: TfcxUserDataSet;
    fcxCalendarDataSource: TfcxDataSource;
  private
    FDataPath: string;
    { Private declarations }
  public
    { Public declarations }
    procedure CreateAdoObjects;
    procedure CreateReportObjects;
    property DataPath: string read FDataPath write FDataPath;
  end;

var
  dmdCube: TdmdCube;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdCube.CreateAdoObjects;
var
  Items, Customer, Employee, Parts, Orders, Vendors: TAdoQuery;
  I: Integer;
  employeeName: TStringField;
  DemoConnection: TAdoConnection;

  function NewQuery: TAdoQuery;
  begin
    Result := TAdoQuery.Create(Self);
//    Result.DataBase := DemoConnection;
//    Result.UsePrimaryKeyAsKey := False;
  end;

  function NewTable(const ATableName: String): TAdoQuery;
  begin
    Result := NewQuery;
    Result.SQL.Text := 'SELECT * FROM ' + ATableName;
  end;

begin
{$IFNDEF FPC}
  DemoConnection := TADOConnection.Create(Self);
  DemoConnection.Provider := 'Microsoft.Jet.OLEDB.4.0;Data Source=' + FDataPath + 'demo.mdb;Persist Security Info=False';
  DemoConnection.LoginPrompt := False;
  DemoConnection.Mode := cmShareDenyNone;
{$ELSE}
  //InitialiseODBC('libiodbc.dylib');
  DemoConnection := TODBCConnection.Create(Self);
  DemoConnection.Params.Values['DSN'] := 'MS Access Database';
  DemoConnection.Params.Values['DBQ'] := GetDataPath + 'demo.mdb';
  DemoConnection.Transaction := TSQLTransaction.Create(Self);
{$ENDIF}
  DemoConnection.Connected := True;
  Items := NewQuery;
  Items.SQL.Text :=
    'SELECT items.orderno, items.partno, items.qty, orders.custno, orders.empno, orders.saledate'#$D#$A+
//    'FROM items LEFT OUTER JOIN orders ON items.orderno = orders.orderno';
    'FROM items LEFT OUTER JOIN orders ON items.orderno = orders.orderno where items.orderno < 1100';
  fcxDBDSItems.DataSet := Items;

  Customer := NewTable('CUSTOMER');
  fcxDBDSCustomer.DataSet := Customer;

  Employee := NewTable('EMPLOYEE');
  {$IFDEF FPC}
  Employee.Prepare;
  {$ENDIF}
//  Employee.OnCalcFields := employeeCalcFields;
  Employee.FieldDefs.Update;
  fcxDBDSEmployee.DataSet := Employee;
  for I := 0 to Employee.FieldDefs.Count - 1 do
    Employee.FieldDefs[I].CreateField(Employee);

  employeeName := TStringField.Create(Self);
  employeeName.FieldName := 'Name';
  employeeName.FieldKind := fkCalculated;
  employeeName.Size := 36;
  employeeName.DataSet := Employee;

  Parts := NewTable('PARTS');
  fcxDBDSParts.DataSet := Parts;

  Orders := NewTable('ORDERS');
  fcxDBDSOrders.DataSet := Orders;

  Vendors := NewTable('VENDORS');
  fcxDBVendors.DataSet := Vendors;
end;

procedure TdmdCube.CreateReportObjects;
begin

end;

end.
