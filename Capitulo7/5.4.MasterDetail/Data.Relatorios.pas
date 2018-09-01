unit Data.Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxBarcode, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageXML, frxDCtrl, frxChBox, frxCross;

type
  TdmdRelatorios = class(TDataModule)
    FDConnection: TFDConnection;
    qryProdutos: TFDQuery;
    frxReport: TfrxReport;
    frxDBProdutos: TfrxDBDataset;
    memCountry: TFDMemTable;
    frxDBCountry: TfrxDBDataset;
    memCustomer: TFDMemTable;
    frxDBCustomer: TfrxDBDataset;
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
    memCountryCode: TIntegerField;
    memCountryName: TWideStringField;
    memCountryCapital: TWideStringField;
    memCountryArea: TIntegerField;
    memCountryPopulation: TIntegerField;
    memCountryContinent: TWideStringField;
    memCrossTable: TFDMemTable;
    frxDBCross: TfrxDBDataset;
    memImagens: TFDMemTable;
    frxDBImagens: TfrxDBDataset;
    memCustomerMD: TFDMemTable;
    frxDBCustomerMD: TfrxDBDataset;
    dtsCustomerMD: TDataSource;
    memOrdersMD: TFDMemTable;
    frxDBOrdersMD: TfrxDBDataset;
    dtsOrdersMD: TDataSource;
    frxDBItemsMD: TfrxDBDataset;
    memItemsMD: TFDMemTable;
    dtsItemsMD: TDataSource;
    frxDBPartsMD: TfrxDBDataset;
    memPartsMD: TFDMemTable;
    dtsPartsMD: TDataSource;
    memVendorsMD: TFDMemTable;
    dtsVendorsMD: TDataSource;
    frxDBVendors: TfrxDBDataset;
  private
    const
      LISTA_PRODUTOS = 'ListaProdutos.fr3';
      LISTA_CODIGO_PRODUTOS = 'ListaCodigoProdutos.fr3';
      SUB_REPORT = 'SubReport.fr3';
      CROSS_TABLE = 'CrossTable.fr3';
      IMAGENS = 'Imagens.fr3';
      MASTER_DETAIL_DETAIL = 'MasterDetailDetail.fr3';
    procedure ImprimeRel(const pNomeArqRel: string; pPrint: Boolean = False);
  public
    procedure ExibeListaProdutos;
    procedure ExibeEtiquetasProdutos;
    procedure ExibeSubReport;
    procedure ExibeCrossTable;
    procedure ExibeImagens;
    procedure ExibeMasterDetailDetail;
  end;

var
  dmdRelatorios: TdmdRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdRelatorios }

procedure TdmdRelatorios.ExibeCrossTable;
begin
  ImprimeRel(CROSS_TABLE);
end;

procedure TdmdRelatorios.ExibeEtiquetasProdutos;
begin
  qryProdutos.Close;
  qryProdutos.Open;
  ImprimeRel(LISTA_CODIGO_PRODUTOS, True);
end;

procedure TdmdRelatorios.ExibeImagens;
begin
  // Abrir dataSets
  ImprimeRel(IMAGENS);
end;

procedure TdmdRelatorios.ImprimeRel(const pNomeArqRel: string; pPrint: Boolean);
begin
  if FileExists(pNomeArqRel) then
  begin
    frxReport.LoadFromFile(pNomeArqRel);
    if pPrint then
    begin
      frxReport.Print;
    end else begin
      frxReport.ShowReport;
    end;
  end else
    raise Exception.Create('Arquivo não encontrado: ' + pNomeArqRel);
end;

procedure TdmdRelatorios.ExibeMasterDetailDetail;
begin
  ImprimeRel(MASTER_DETAIL_DETAIL);
end;

procedure TdmdRelatorios.ExibeListaProdutos;
begin
  qryProdutos.Close;
  qryProdutos.Open;
  ImprimeRel(LISTA_PRODUTOS);
end;

procedure TdmdRelatorios.ExibeSubReport;
const
  COUNTRY = 'C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\countryList.xml';
  CUSTOMER = 'C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\customer.xml';
begin
  if not FileExists(COUNTRY) then
  begin
    raise Exception.Create('Informe o caminho dos XMLs: ' + sLineBreak + COUNTRY);
  end;

  memCountry.LoadFromFile(COUNTRY, sfXML);
  memCustomer.LoadFromFile(CUSTOMER, sfXML);

  ImprimeRel(SUB_REPORT);
end;

end.
