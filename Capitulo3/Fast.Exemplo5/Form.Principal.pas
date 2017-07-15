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
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageXML, FireDAC.Comp.UI;

type
  TfrmPrincipal = class(TForm)
    frxReportMasterDetail: TfrxReport;
    frxDBCountry: TfrxDBDataset;
    frxDBCustomer: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    dtsCountry: TDataSource;
    dtsCustomer: TDataSource;
    ADOConnection: TADOConnection;
    qryCountry: TADOQuery;
    qryCustomer: TADOQuery;
    DataSource1: TDataSource;
    qrySelect: TADOQuery;
    memExportador: TFDMemTable;
    btnExport: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
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
  ExportaDataSet('orders');
  ExportaDataSet('items');
  ExportaDataSet('parts');
  ExportaDataSet('vendors');

  ExportaDataSet('country');
  ExportaDataSet('customer');
end;

end.
