unit Form.Principal.CDS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, IOUtils,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    dbgAcao: TDBGrid;
    dtsAcao: TDataSource;
    cdsAcao: TClientDataSet;
    cdsAcaoID: TIntegerField;
    cdsAcaoSIGLA: TStringField;
    cdsAcaoDESCRICAO: TStringField;
    cdsAcaoVALOR: TCurrencyField;
    cdsAcaoDATA: TDateTimeField;
    dbnAcao: TDBNavigator;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    cdsAcaoVALOR_TOTAL: TCurrencyField;
    edtValorInvestimento: TEdit;
    lblValorInvestimento: TLabel;
    cdsAcaoQTD_TOTAL_ACOES: TIntegerField;
    cdsAcaoQTD_ACOES_QUE_PODE_COMPRAR: TIntegerField;
    cdsAcaoPERCENTUAL_DE_COMPRA: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    cdsAcaoVLR_MEDIO_ACAO: TAggregateField;
    pnlResumo: TPanel;
    lblVlrMedioAcao: TLabel;
    dbeVlrMedioAcao: TDBEdit;
    pnlHistorico: TPanel;
    dbgHistorico: TDBGrid;
    dtsHistorico: TDataSource;
    cdsHistorico: TClientDataSet;
    btnVisualizaHistorico: TButton;
    procedure cdsAcaoNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsAcaoAfterPost(DataSet: TDataSet);
    procedure cdsAcaoCalcFields(DataSet: TDataSet);
    procedure edtValorInvestimentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnVisualizaHistoricoClick(Sender: TObject);
  private const
    XML_ACAO = 'acoes.xml';
    XML_SEM_HIST = 'sem histórico.xml';
    QTD_ACOES_QUE_PODE_COMPRAR = 'QTD_ACOES_QUE_PODE_COMPRAR';
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnVisualizaHistoricoClick(Sender: TObject);
begin
  cdsHistorico.Data := cdsAcao.Data;
  cdsHistorico.LogChanges := False;
  cdsHistorico.SaveToFile(XML_SEM_HIST, dfxml);
  cdsHistorico.StatusFilter := [usDeleted];
end;

procedure TfrmPrincipal.cdsAcaoAfterPost(DataSet: TDataSet);
begin
  cdsAcao.SaveToFile(XML_ACAO, dfXML);
end;

procedure TfrmPrincipal.cdsAcaoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('VALOR_TOTAL').AsCurrency :=
    DataSet.FieldByName('VALOR').AsCurrency *
      StrToIntDef(edtQuantidade.Text, 0);

//  DataSet.Fields[3].AsInteger; >> NÃO USAR, POR FAVOR... :(
//  cdsAcaoQTD_ACOES_QUE_PODE_COMPRAR.AsInteger; >> Pode ser utilizado ao invés de FieldByName
  DataSet.FieldByName(QTD_ACOES_QUE_PODE_COMPRAR).AsInteger :=
    Trunc(
      StrToFloatDef(edtValorInvestimento.Text, 0) /
      (DataSet.FieldByName('VALOR').AsCurrency + 0.000000001));

  cdsAcao.FieldByName('PERCENTUAL_DE_COMPRA').AsString :=
    FormatFloat('0.,00%',
      DataSet.FieldByName(QTD_ACOES_QUE_PODE_COMPRAR).AsInteger /
      (DataSet.FieldByName('QTD_TOTAL_ACOES').AsInteger + 0.000000001));
end;

procedure TfrmPrincipal.cdsAcaoNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('DATA').AsDateTime := Now;
end;

procedure TfrmPrincipal.edtValorInvestimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if not(Key in ['0'..'9']) then
//  begin
//    Key := #0;
//  end;
//  >> Propriedade NumbersOnly
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if TFile.Exists(XML_ACAO) then
  begin
    cdsAcao.LoadFromFile(XML_ACAO);
//  end else begin  // Criando campos em Run Time
//    cdsAcao.FieldDefs.Clear;
//    cdsAcao.FieldDefs.Add('ID', ftInteger);
//    cdsAcao.FieldDefs.Add('SIGLA', ftString, 10);
//    cdsAcao.FieldDefs.Add('DESCRICAO', ftString, 100);
//    cdsAcao.FieldDefs.Add('VALOR', ftCurrency);
//    cdsAcao.FieldDefs.Add('DATA', ftDateTime);
//
//    cdsAcao.CreateDataSet;
  end;
end;

end.
