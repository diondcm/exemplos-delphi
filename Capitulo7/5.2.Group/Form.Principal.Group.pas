unit Form.Principal.Group;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.Group, Vcl.ComCtrls;

type
  TfrmPrincipalGroup = class(TForm)
    TimerOpen: TTimer;
    dtsCategoria: TDataSource;
    dtsProduto: TDataSource;
    PageControl1: TPageControl;
    tabMasterDetail: TTabSheet;
    tabSQLJoin: TTabSheet;
    panelControles: TPanel;
    buttonOpen: TButton;
    buttonReport: TButton;
    panelDados: TPanel;
    Splitter1: TSplitter;
    labelCategorias: TLabel;
    gridCategorias: TDBGrid;
    Panel1: TPanel;
    labelProdutos: TLabel;
    gridProdutos: TDBGrid;
    panelControleJoin: TPanel;
    gridJoin: TDBGrid;
    dtsJoin: TDataSource;
    buttonOpenJoin: TButton;
    buttonReportJoin: TButton;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonOpenClick(Sender: TObject);
    procedure buttonReportClick(Sender: TObject);
    procedure buttonOpenJoinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalGroup: TfrmPrincipalGroup;

implementation

{$R *.dfm}

procedure TfrmPrincipalGroup.buttonOpenClick(Sender: TObject);
begin
  dmdGroup.qryCategoria.Open;
  dmdGroup.qryProduto.Open;
end;

procedure TfrmPrincipalGroup.buttonOpenJoinClick(Sender: TObject);
begin
  dmdGroup.qryListaProdutos.Open;
end;

procedure TfrmPrincipalGroup.buttonReportClick(Sender: TObject);
begin
  dmdGroup.frxReportGroup.ShowReport;
end;

procedure TfrmPrincipalGroup.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmPrincipalGroup.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  dmdGroup.qryCategoria.Open;
  dmdGroup.qryProduto.Open;
  dmdGroup.qryListaProdutos.Open;
end;

end.
