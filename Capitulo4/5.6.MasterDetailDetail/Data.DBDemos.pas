unit Data.DBDemos;

interface

uses
  Windows, System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.DApt,
  FireDAC.Stan.StorageXML, frxCross, frxDCtrl, frxDesgn, Data.Win.ADODB, frxADOComponents;

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
    frxReportDrillDrownCustomer: TfrxReport;
    frxReportGeral: TfrxReport;
    frxDesigner: TfrxDesigner;
    Customers: TADOTable;
    CustomersCustNo: TFloatField;
    CustomersCompany: TStringField;
    CustomersAddr1: TStringField;
    CustomersAddr2: TStringField;
    CustomersCity: TStringField;
    CustomersState: TStringField;
    CustomersZip: TStringField;
    CustomersCountry: TStringField;
    CustomersPhone: TStringField;
    CustomersFAX: TStringField;
    CustomersTaxRate: TFloatField;
    CustomersContact: TStringField;
    CustomersLastInvoiceDate: TDateTimeField;
    Orders: TADOTable;
    OrdersOrderNo: TFloatField;
    OrdersCustNo: TFloatField;
    OrdersCustCompany: TStringField;
    OrdersSaleDate: TDateTimeField;
    OrdersShipDate: TDateTimeField;
    OrdersEmpNo: TIntegerField;
    OrdersShipToContact: TStringField;
    OrdersShipToAddr1: TStringField;
    OrdersShipToAddr2: TStringField;
    OrdersShipToCity: TStringField;
    OrdersShipToState: TStringField;
    OrdersShipToZip: TStringField;
    OrdersShipToCountry: TStringField;
    OrdersShipToPhone: TStringField;
    OrdersShipVIA: TStringField;
    OrdersPO: TStringField;
    OrdersTerms: TStringField;
    OrdersPaymentMethod: TStringField;
    OrdersItemsTotal: TCurrencyField;
    OrdersTaxRate: TFloatField;
    OrdersFreight: TCurrencyField;
    OrdersAmountPaid: TCurrencyField;
    LineItems: TADOTable;
    LineItemsOrderNo: TFloatField;
    LineItemsItemNo: TFloatField;
    LineItemsPartNo: TFloatField;
    LineItemsPartName: TStringField;
    LineItemsQty: TIntegerField;
    LineItemsPrice: TCurrencyField;
    LineItemsDiscount: TFloatField;
    LineItemsTotal: TCurrencyField;
    LineItemsExtendedPrice: TCurrencyField;
    Parts: TADOTable;
    PartsPartNo: TFloatField;
    PartsVendorNo: TFloatField;
    PartsDescription: TStringField;
    PartsOnHand: TFloatField;
    PartsOnOrder: TFloatField;
    PartsCost: TCurrencyField;
    PartsListPrice: TCurrencyField;
    CustomerSource: TDataSource;
    OrderSource: TDataSource;
    LineItemSource: TDataSource;
    PartSource: TDataSource;
    RepQuery: TADOQuery;
    RepQueryaCustNo: TFloatField;
    RepQueryCompany: TWideStringField;
    RepQueryAddr1: TWideStringField;
    RepQueryAddr2: TWideStringField;
    RepQueryCity: TWideStringField;
    RepQueryState: TWideStringField;
    RepQueryZip: TWideStringField;
    RepQueryCountry: TWideStringField;
    RepQueryPhone: TWideStringField;
    RepQueryFAX: TWideStringField;
    RepQueryaTaxRate: TFloatField;
    RepQueryContact: TWideStringField;
    RepQueryLastInvoiceDate: TDateTimeField;
    RepQuerybOrderNo: TFloatField;
    RepQuerybCustNo: TFloatField;
    RepQuerySaleDate: TDateTimeField;
    RepQueryShipDate: TDateTimeField;
    RepQueryEmpNo: TIntegerField;
    RepQueryShipToContact: TWideStringField;
    RepQueryShipToAddr1: TWideStringField;
    RepQueryShipToAddr2: TWideStringField;
    RepQueryShipToCity: TWideStringField;
    RepQueryShipToState: TWideStringField;
    RepQueryShipToZip: TWideStringField;
    RepQueryShipToCountry: TWideStringField;
    RepQueryShipToPhone: TWideStringField;
    RepQueryShipVIA: TWideStringField;
    RepQueryPO: TWideStringField;
    RepQueryTerms: TWideStringField;
    RepQueryPaymentMethod: TWideStringField;
    RepQueryItemsTotal: TFloatField;
    RepQuerybTaxRate: TFloatField;
    RepQueryFreight: TFloatField;
    RepQueryAmountPaid: TFloatField;
    RepQuerycOrderNo: TFloatField;
    RepQueryItemNo: TFloatField;
    RepQuerycPartNo: TFloatField;
    RepQueryQty: TIntegerField;
    RepQueryDiscount: TFloatField;
    RepQuerydPartNo: TFloatField;
    RepQueryVendorNo: TFloatField;
    RepQueryDescription: TWideStringField;
    RepQueryOnHand: TFloatField;
    RepQueryOnOrder: TFloatField;
    RepQueryCost: TFloatField;
    RepQueryListPrice: TFloatField;
    RepQuerySource: TDataSource;
    CustomersDS: TfrxDBDataset;
    OrdersDS: TfrxDBDataset;
    ItemsDS: TfrxDBDataset;
    PartDS: TfrxDBDataset;
    QueryDS: TfrxDBDataset;
    Bio: TADOTable;
    BioSource: TDataSource;
    BioDS: TfrxDBDataset;
    Country: TADOTable;
    CountrySource: TDataSource;
    CountryDS: TfrxDBDataset;
    Cross: TADOTable;
    CrossSource: TDataSource;
    CrossDS: TfrxDBDataset;
    ADOConnection1: TADOConnection;
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

class function TdmdDBDemos.GetInstancia: TdmdDBDemos;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TdmdDBDemos.Create(Application);
  end;

  Result := FInstancia;
end;

end.
