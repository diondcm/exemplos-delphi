unit Form.Principal.Group;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.Group, Vcl.ComCtrls, Vcl.Menus, frxGradient, frxClass;

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
    buttonExpoSQL: TButton;
    PopupMenuExpo: TPopupMenu;
    PDF1: TMenuItem;
    JPG1: TMenuItem;
    HTML1: TMenuItem;
    XLS1: TMenuItem;
    XLSX1: TMenuItem;
    buttonExportarCateg: TButton;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonOpenClick(Sender: TObject);
    procedure buttonReportClick(Sender: TObject);
    procedure buttonOpenJoinClick(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure buttonExpoSQLClick(Sender: TObject);
    procedure buttonReportJoinClick(Sender: TObject);
    procedure buttonExportarCategDropDownClick(Sender: TObject);
    procedure JPG1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure XLS1Click(Sender: TObject);
    procedure XLSX1Click(Sender: TObject);
  private
    FRelSelecioando: TfrxReport;
  public
    { Public declarations }
  end;

var
  frmPrincipalGroup: TfrmPrincipalGroup;

implementation

{$R *.dfm}

procedure TfrmPrincipalGroup.buttonExportarCategDropDownClick(Sender: TObject);
begin
  FRelSelecioando := dmdGroup.frxReportGroup;
end;

procedure TfrmPrincipalGroup.buttonExpoSQLClick(Sender: TObject);
var
  lPoint: TPoint;
begin
// TODO: não aparece ao final do botão
//  lPoint.X := (Sender as TButton).Left + 1;
//  lPoint.y := (Sender as TButton).Top + (Sender as TButton).Height + 1;
//  lPoint := Self.ScreenToClient(lPoint);
//  PopupMenuExpo.Popup(lPoint.X, lPoint.Y);
  FRelSelecioando := dmdGroup.frxReportListaProdutos;
  GetCursorPos(lPoint);
  PopupMenuExpo.Popup(lPoint.X, lPoint.Y);
end;

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

procedure TfrmPrincipalGroup.buttonReportJoinClick(Sender: TObject);
begin
  dmdGroup.frxReportListaProdutos.ShowReport;
end;

procedure TfrmPrincipalGroup.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmPrincipalGroup.HTML1Click(Sender: TObject);
begin
  if Assigned(FRelSelecioando) then
  begin
    FRelSelecioando.Export(dmdGroup.frxHTMLExport);
  end;

end;

procedure TfrmPrincipalGroup.JPG1Click(Sender: TObject);
begin
  if Assigned(FRelSelecioando) then
  begin
    FRelSelecioando.Export(dmdGroup.frxJPEGExport);
  end;
end;

procedure TfrmPrincipalGroup.PDF1Click(Sender: TObject);
begin
  if Assigned(FRelSelecioando) then
  begin
    FRelSelecioando.Export(dmdGroup.frxPDFExport);
  end;
end;

procedure TfrmPrincipalGroup.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  dmdGroup.qryCategoria.Open;
  dmdGroup.qryProduto.Open;
  dmdGroup.qryListaProdutos.Open;
end;

procedure TfrmPrincipalGroup.XLS1Click(Sender: TObject);
begin
  if Assigned(FRelSelecioando) then
  begin
    FRelSelecioando.Export(dmdGroup.frxXLSExport);
  end;
end;

procedure TfrmPrincipalGroup.XLSX1Click(Sender: TObject);
begin
  if Assigned(FRelSelecioando) then
  begin
    FRelSelecioando.Export(dmdGroup.frxXLSXExport);
  end;
end;

end.
