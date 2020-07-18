unit Data.Master.Detail.Detail;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, frxClass, frxDBSet,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmdMasterDetailDetail = class(TDataModule)
    memCustomer: TFDMemTable;
    frxDBCustomer: TfrxDBDataset;
    dtsCustomer: TDataSource;
    memOrders: TFDMemTable;
    frxDBOrders: TfrxDBDataset;
    dtsOrders: TDataSource;
    memItems: TFDMemTable;
    frxDBItems: TfrxDBDataset;
    dtsItems: TDataSource;
    memParts: TFDMemTable;
    frxDBParts: TfrxDBDataset;
    dtsParts: TDataSource;
    memVendors: TFDMemTable;
    frxDBVendors: TfrxDBDataset;
    dtsVendors: TDataSource;
    memCountry: TFDMemTable;
    frxDBCountry: TfrxDBDataset;
    dtsCountry: TDataSource;
    memCustomerCustNo: TFloatField;
    memCustomerCompany: TWideStringField;
    memCustomerAddr1: TWideStringField;
    memCustomerAddr2: TWideStringField;
    memCustomerCity: TWideStringField;
    memCustomerState: TWideStringField;
    memCustomerZip: TWideStringField;
    memCustomerCountry: TWideStringField;
    memCustomerPhone: TWideStringField;
    memCustomerFAX: TWideStringField;
    memCustomerTaxRate: TFloatField;
    memCustomerContact: TWideStringField;
    memCustomerLastInvoiceDate: TDateTimeField;
    memOrdersOrderNo: TFloatField;
    memOrdersCustNo: TFloatField;
    memOrdersSaleDate: TDateTimeField;
    memOrdersShipDate: TDateTimeField;
    memOrdersEmpNo: TIntegerField;
    memOrdersShipToContact: TWideStringField;
    memOrdersShipToAddr1: TWideStringField;
    memOrdersShipToAddr2: TWideStringField;
    memOrdersShipToCity: TWideStringField;
    memOrdersShipToState: TWideStringField;
    memOrdersShipToZip: TWideStringField;
    memOrdersShipToCountry: TWideStringField;
    memOrdersShipToPhone: TWideStringField;
    memOrdersShipVIA: TWideStringField;
    memOrdersPO: TWideStringField;
    memOrdersTerms: TWideStringField;
    memOrdersPaymentMethod: TWideStringField;
    memOrdersItemsTotal: TFloatField;
    memOrdersTaxRate: TFloatField;
    memOrdersFreight: TFloatField;
    memOrdersAmountPaid: TFloatField;
    memPartsPartNo: TFloatField;
    memPartsVendorNo: TFloatField;
    memPartsDescription: TWideStringField;
    memPartsOnHand: TFloatField;
    memPartsOnOrder: TFloatField;
    memPartsCost: TFloatField;
    memPartsListPrice: TFloatField;
    memItemsOrderNo: TFloatField;
    memItemsItemNo: TFloatField;
    memItemsPartNo: TFloatField;
    memItemsQty: TIntegerField;
    memItemsDiscount: TFloatField;
    memVendorsVendorNo: TFloatField;
    memVendorsVendorName: TWideStringField;
    memVendorsAddress1: TWideStringField;
    memVendorsAddress2: TWideStringField;
    memVendorsCity: TWideStringField;
    memVendorsState: TWideStringField;
    memVendorsZip: TWideStringField;
    memVendorsCountry: TWideStringField;
    memVendorsPhone: TWideStringField;
    memVendorsFAX: TWideStringField;
    memVendorsPreferred: TBooleanField;
    memCountryCode: TIntegerField;
    memCountryName: TWideStringField;
    memCountryCapital: TWideStringField;
    memCountryArea: TIntegerField;
    memCountryPopulation: TIntegerField;
    memCountryContinent: TWideStringField;
    frxReportMD: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibeRelatorioListaVendas;
  end;

var
  dmdMasterDetailDetail: TdmdMasterDetailDetail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Data.Connection;

{$R *.dfm}

procedure TdmdMasterDetailDetail.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i] is TFDQuery then
    begin
      TFDQuery(Self.Components[i]).Connection := dmdConnection.Connection;
    end;
  end;
end;

procedure TdmdMasterDetailDetail.ExibeRelatorioListaVendas;
begin
  frxReportMD.ShowReport;
end;

end.
