unit Form.Selecao.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.VirtualImage, Vcl.WinXCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  frxClass;

type
  TfrmSelcaoRelatorio = class(TForm)
    VirtualImageList1: TVirtualImageList;
    ImageCollection1: TImageCollection;
    SplitView: TSplitView;
    pnlToolbar: TPanel;
    lblTitle: TLabel;
    MenuVirtualImage: TVirtualImage;
    NavPanel: TPanel;
    Image5: TImage;
    ButtonProdutos: TButton;
    AcctsButton: TButton;
    LeadsButton: TButton;
    ButtonPedidos: TButton;
    MarketingButton: TButton;
    CalendarButton: TButton;
    UsersButton: TButton;
    PanelImagem: TPanel;
    Label1: TLabel;
    ButtonGerar: TButton;
    ImagePreview: TImage;
    ButtonProdutosSQL: TButton;
    ButtonVisualizar: TButton;
    procedure ButtonGerarClick(Sender: TObject);
    procedure ButtonProdutosClick(Sender: TObject);
    procedure ButtonProdutosSQLClick(Sender: TObject);
    procedure ButtonVisualizarClick(Sender: TObject);
  private
    FReport: TFrxReport;
  public
    { Public declarations }
  end;

var
  frmSelcaoRelatorio: TfrmSelcaoRelatorio;

implementation

{$R *.dfm}

uses Data.Relatorios, Form.Visualiza.Dados, Form.Filtros;

procedure TfrmSelcaoRelatorio.ButtonProdutosSQLClick(Sender: TObject);
begin
  ImagePreview.Picture.LoadFromFile('Preview-Produtos-SQL.png');
  FReport := dmdRelatorios.frxReportProdutosSQL;
end;

procedure TfrmSelcaoRelatorio.ButtonVisualizarClick(Sender: TObject);
begin
  if FReport = dmdRelatorios.frxReportProdutos then
  begin
    frmVisualizaDados.dtsMaster.DataSet := dmdRelatorios.QryCategoria;
    frmVisualizaDados.dtsDetail.DataSet := dmdRelatorios.QryProdutos;

    dmdRelatorios.qryCategoria.Open;
    frmVisualizaDados.Show;
  end else if FReport = dmdRelatorios.frxReportProdutosSQL then
  begin
    frmVisualizaDados.dtsMaster.DataSet := dmdRelatorios.QryCategoria;
    frmVisualizaDados.dtsDetail.DataSet := dmdRelatorios.qryProdutosSQL;

    dmdRelatorios.qryProdutosSQL.Open;
    frmVisualizaDados.Show;
  end;
end;

procedure TfrmSelcaoRelatorio.ButtonGerarClick(Sender: TObject);
begin
  if Assigned(FReport) then
  begin
    if frmFiltros.ShowModal = mrOk then
    begin
      if FReport = dmdRelatorios.frxReportProdutos then
      begin
        dmdRelatorios.qryCategoria.Close;
        dmdRelatorios.qryCategoria.SQL.Text := dmdRelatorios.SQLPadraoCategoria;
        if frmFiltros.CheckBoxData.Checked then
        begin
          //dmdRelatorios.qryCategoria.Open;
        end;
        if frmFiltros.CheckBoxCodigo.Checked then
        begin
          dmdRelatorios.qryCategoria.SQL.Text := StringReplace(dmdRelatorios.qryCategoria.SQL.Text, '/*WHERE*/', 'where CODIGO = :CODIGO', [rfIgnoreCase]);
          dmdRelatorios.qryCategoria.ParamByName('CODIGO').AsInteger := StrToIntDef(frmFiltros.EditCodCliente.Text, 0);
        end;

        dmdRelatorios.qryCategoria.Open;
        ////    FReport.Variables['usuario'] := 'Categorias."NOME"';
        //    FReport.Variables['usuario'] := QuotedStr('admin');
        //    FReport.Variables['filtro'] := QuotedStr('Todos produtos');
        dmdRelatorios.Usuario := 'admin';
        dmdRelatorios.Filtros := 'Todos produtos';
      end else if FReport = dmdRelatorios.frxReportProdutos then
      begin
        dmdRelatorios.qryProdutosSQL.Open;
      end;

      FReport.ShowReport;
    end;
  end;
end;

procedure TfrmSelcaoRelatorio.ButtonProdutosClick(Sender: TObject);
begin
  ImagePreview.Picture.LoadFromFile('Preview-Produtos.png');
  FReport := dmdRelatorios.frxReportProdutos;
end;

end.
