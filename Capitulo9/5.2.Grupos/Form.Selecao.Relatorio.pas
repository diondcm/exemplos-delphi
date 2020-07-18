unit Form.Selecao.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.VirtualImage, Vcl.WinXCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  frxClass;

type
  TTipoRelatorio = (relProdutos, relProdutosSQL, relPedidos, relExterno);

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
    procedure ButtonPedidosClick(Sender: TObject);
    procedure AcctsButtonClick(Sender: TObject);
  private
    FTipoRel: TTipoRelatorio;
  public
    { Public declarations }
  end;

var
  frmSelcaoRelatorio: TfrmSelcaoRelatorio;

implementation

{$R *.dfm}

uses Data.Relatorios, Form.Visualiza.Dados, Form.Filtros,
  Data.Master.Detail.Detail;

procedure TfrmSelcaoRelatorio.ButtonProdutosSQLClick(Sender: TObject);
begin
  FTipoRel := relProdutosSQL;
  ImagePreview.Picture.LoadFromFile('Preview-Produtos-SQL.png');

end;

procedure TfrmSelcaoRelatorio.ButtonVisualizarClick(Sender: TObject);
begin
  case FTipoRel of
    relProdutos:
    begin
      frmVisualizaDados.dtsMaster.DataSet := dmdRelatorios.QryCategoria;
      frmVisualizaDados.dtsDetail.DataSet := dmdRelatorios.QryProdutos;

      dmdRelatorios.qryCategoria.Open;
      frmVisualizaDados.Show;
    end;

    relProdutosSQL:
    begin
      frmVisualizaDados.dtsMaster.DataSet := dmdRelatorios.QryCategoria;
      frmVisualizaDados.dtsDetail.DataSet := dmdRelatorios.qryProdutosSQL;

      dmdRelatorios.qryProdutosSQL.Open;
      frmVisualizaDados.Show;
    end;
  end;
end;

procedure TfrmSelcaoRelatorio.AcctsButtonClick(Sender: TObject);
begin
  FTipoRel := relExterno;
  ImagePreview.Picture.LoadFromFile('Preview-Externo.png');
end;

procedure TfrmSelcaoRelatorio.ButtonGerarClick(Sender: TObject);
var
  lfrmFiltro: TfrmFiltros;
  lClausula: string;
  lData: Boolean;
  lParamData: Boolean;
  lParamCodigo: Boolean;
  lParamNome: Boolean;

  procedure AdicionaFiltro(pFiltro: string);
  begin
    if Pos('/*WHERE*/', dmdRelatorios.qryCategoria.SQL.Text) > 0 then
    begin
      dmdRelatorios.qryCategoria.SQL.Text := StringReplace(dmdRelatorios.qryCategoria.SQL.Text, '/*WHERE*/', ' where ' + pFiltro + ' /*AND*/', [rfIgnoreCase]);
    end else if Pos('/*AND*/', dmdRelatorios.qryCategoria.SQL.Text) > 0 then
    begin
      dmdRelatorios.qryCategoria.SQL.Text := StringReplace(dmdRelatorios.qryCategoria.SQL.Text, '/*AND*/', ' and ' + pFiltro + ' /*AND*/', [rfIgnoreCase]);
    end;
  end;

begin
  case FTipoRel of
    relProdutos:
    begin
      lfrmFiltro := TfrmFiltros.Create(Application);
      if lfrmFiltro.ShowModal = mrOk then
      begin
        lParamData := False;
        lParamCodigo := False;
        lParamNome := False;

        dmdRelatorios.qryCategoria.Close;
        dmdRelatorios.qryCategoria.SQL.Text := dmdRelatorios.SQLPadraoCategoria;

        if lfrmFiltro.CheckBoxData.Checked then
        begin
          lParamData := True;
          lClausula := 'DATA_CADASTRO BETWEEN :DATAINI AND :DATAFIM';
          AdicionaFiltro(lClausula);
        end;

        if lfrmFiltro.CheckBoxCodigo.Checked then
        begin
          lParamCodigo := True;
          lClausula := 'CODIGO = :CODIGO';
          AdicionaFiltro(lClausula);
        end;

        if lfrmFiltro.CheckBoxNome.Checked then
        begin
          lParamNome := True;
          lClausula := 'NOME LIKE :NOME';
          AdicionaFiltro(lClausula);
        end;

        { Depois de montar o SQL:  }
        dmdRelatorios.Filtros := '';
        if lParamData then
        begin
          dmdRelatorios.qryCategoria.ParamByName('DATAINI').AsDate := lfrmFiltro.MonthCalendar1.Date;
          dmdRelatorios.qryCategoria.ParamByName('DATAFIM').AsDate := lfrmFiltro.MonthCalendar2.Date;
          dmdRelatorios.Filtros := dmdRelatorios.Filtros + '| Data de cadastro: ' + DateToStr(lfrmFiltro.MonthCalendar1.Date) + ' e ' + DateToStr(lfrmFiltro.MonthCalendar2.Date);
        end;

        if lParamCodigo then
        begin
          dmdRelatorios.qryCategoria.ParamByName('CODIGO').AsInteger := StrToIntDef(lfrmFiltro.EditCodCliente.Text, 0);
          dmdRelatorios.Filtros := dmdRelatorios.Filtros + '| Código: ' + lfrmFiltro.EditCodCliente.Text;
        end;

        if lParamNome then
        begin
          dmdRelatorios.qryCategoria.ParamByName('NOME').AsString := '%' + lfrmFiltro.EditNomeCliente.Text + '%';
          dmdRelatorios.Filtros := dmdRelatorios.Filtros + '| Nome: ' + lfrmFiltro.EditNomeCliente.Text;
        end;

        dmdRelatorios.qryCategoria.Open;
        ////    FReport.Variables['usuario'] := 'Categorias."NOME"';
        //    FReport.Variables['usuario'] := QuotedStr('admin');
        //    FReport.Variables['filtro'] := QuotedStr('Todos produtos');
        dmdRelatorios.Usuario := 'admin';
//        if dmdRelatorios.Filtros <> '' then
//        begin
//          dmdRelatorios.Filtros := 'Filtros utilizados: ' + dmdRelatorios.Filtros;
//        end;
        dmdRelatorios.frxReportProdutos.ShowReport;
      end;
      lfrmFiltro.Free;
    end;

    relProdutosSQL:
    begin
      dmdRelatorios.qryProdutosSQL.Open;
      dmdRelatorios.frxReportProdutosSQL.ShowReport;
    end;

    relPedidos:
    begin
      dmdMasterDetailDetail.ExibeRelatorioListaVendas;
    end;

    relExterno:
    begin
      dmdRelatorios.ExibeRelatorioExterno;
    end;
  end;
end;

procedure TfrmSelcaoRelatorio.ButtonPedidosClick(Sender: TObject);
begin
  FTipoRel := relPedidos;
  ImagePreview.Picture.LoadFromFile('Preview-Pedidos.png');
end;

procedure TfrmSelcaoRelatorio.ButtonProdutosClick(Sender: TObject);
begin
  FTipoRel := relProdutos;
  ImagePreview.Picture.LoadFromFile('Preview-Produtos.png');
end;

end.
