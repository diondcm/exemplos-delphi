unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, frxClass,
  frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageXML, FireDAC.Comp.UI,
  FireDAC.Stan.StorageBin, frxDCtrl, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    frxReportMasterDetail: TfrxReport;
    frxDBCountry2: TfrxDBDataset;
    frxDBCustomer: TfrxDBDataset;
    frxDBOrders: TfrxDBDataset;
    dtsCountry2: TDataSource;
    ADOConnection: TADOConnection;
    qryCountry2: TADOQuery;
    dtsOrders: TDataSource;
    qrySelect: TADOQuery;
    memExportador: TFDMemTable;
    btnExport: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    memCustomer: TFDMemTable;
    memOrders: TFDMemTable;
    memItems: TFDMemTable;
    frxDBItems: TfrxDBDataset;
    memParts: TFDMemTable;
    dtsItems: TDataSource;
    frxDBParts: TfrxDBDataset;
    dtsParts: TDataSource;
    memVendors: TFDMemTable;
    frxDBVendors: TfrxDBDataset;
    frxReportSubReport: TfrxReport;
    Memo1: TMemo;
    memCountry: TFDMemTable;
    frxDBCountry: TfrxDBDataset;
    dtsCountry: TDataSource;
    frxReportImagem: TfrxReport;
    memBioLife: TFDMemTable;
    DataSource1: TDataSource;
    DBImage1: TDBImage;
    DBNavigator1: TDBNavigator;
    frxDBBiolife: TfrxDBDataset;
    DataSource2: TDataSource;
    qryBioLife: TADOQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    DataSource3: TDataSource;
    FDMemTable1: TFDMemTable;
    dtsCustomer: TDataSource;
    frxRepCross: TfrxReport;
    ADOQuery1: TADOQuery;
    frxDBDataset2: TfrxDBDataset;
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExportClick(Sender: TObject);

  procedure ExportaDataSet(const pNomeTabela: string);
  begin
    memExportador.Close;
    qrySelect.Close;
    qrySelect.sql.text := 'select * from ' + pNomeTabela;
    qrySelect.Open;
    /// De Firecac para Firedac
    /// memExportador.Data := qry.Data >> Muito mais rápido
    memExportador.CopyDataSet(qrySelect, [coStructure, coAppend]);
    memExportador.SaveToFile(pNomeTabela + '.xml', TFDStorageFormat.sfXML);
    //FDMemTable1.LoadFromFile(pNomeTabela + '.xml');
  end;

begin
//  ExportaDataSet('orders');
//  ExportaDataSet('items');
//  ExportaDataSet('parts');
//  ExportaDataSet('vendors');
//
//  ExportaDataSet('country');
//  ExportaDataSet('customer');

  ExportaDataSet('biolife');
  ExportaDataSet('animals');
end;

end.
