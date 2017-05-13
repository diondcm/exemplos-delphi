unit Form.Master.Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.StdCtrls, System.IOUtils;

type
  TfrmMAsterDetail = class(TForm)
    dbgDetail: TDBGrid;
    Splitter1: TSplitter;
    dbgMaster: TDBGrid;
    Panel1: TPanel;
    dtsMaster: TDataSource;
    dtsDetail: TDataSource;
    cdsMaster: TClientDataSet;
    cdsDetail: TClientDataSet;
    cdsMasterID: TIntegerField;
    cdsMasterDESCRICAO: TStringField;
    cdsMasterDATA_CADASTRO: TDateField;
    cdsMasterUSUARIO: TStringField;
    btnAtualizaDados: TButton;
    cdsDetailID: TIntegerField;
    cdsDetailDESCRICAO: TStringField;
    cdsDetailVALOR: TCurrencyField;
    cdsDetailID_MASTER: TIntegerField;
    cdsMasterVALOR_TOTAL: TCurrencyField;
    procedure btnAtualizaDadosClick(Sender: TObject);
    procedure dtsMasterDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMAsterDetail: TfrmMAsterDetail;

implementation

{$R *.dfm}

procedure TfrmMAsterDetail.btnAtualizaDadosClick(Sender: TObject);
const
  NOME_ARQUIVO_MASTER = 'Data.xml';
  NOME_ARQUIVO_DETAIL = 'Detail.xml';

begin
  if cdsMaster.Active then
  begin
    cdsMaster.SaveToFile(NOME_ARQUIVO_MASTER, dfXML);// opendialog
    cdsDetail.SaveToFile(NOME_ARQUIVO_DETAIL, dfXML);
  end else begin
    if TFile.Exists(NOME_ARQUIVO_MASTER) then
    begin
      cdsMaster.LoadFromFile(NOME_ARQUIVO_MASTER);
      cdsDetail.LoadFromFile(NOME_ARQUIVO_DETAIL);
    end else begin
      cdsMaster.CreateDataSet;
      cdsDetail.CreateDataSet;
    end;
  end;
end;

procedure TfrmMAsterDetail.dtsMasterDataChange(Sender: TObject; Field: TField);
begin
  if cdsDetail.Active then
  begin
    cdsDetail.IndexFieldNames := 'ID_MASTER';
    cdsDetail.SetRange([cdsMaster.FieldByName('ID').AsInteger],
      [cdsMaster.FieldByName('ID').AsInteger]); // Filter é mt mais lento
  end;
  // Fácil de codificar
  // porém, é lento, e trabalhoso
  // Não codificar assim, preferir utilizar master source
  // Exemplo está assim para não utilizar DB
end;

end.
