unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.Relatorios, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmPrincipal = class(TForm)
    FlowPanelControles: TFlowPanel;
    buttonLoad: TButton;
    buttonEtiquetasProdutos: TButton;
    buttonSubReport: TButton;
    buttonCrossTable: TButton;
    buttonImagens: TButton;
    buttonMasterDetailDetail: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DataSource1: TDataSource;
    panelNotas: TPanel;
    StaticText1: TStaticText;
    Memo1: TMemo;
    procedure buttonLoadClick(Sender: TObject);
    procedure buttonEtiquetasProdutosClick(Sender: TObject);
    procedure buttonSubReportClick(Sender: TObject);
    procedure buttonCrossTableClick(Sender: TObject);
    procedure buttonImagensClick(Sender: TObject);
    procedure buttonMasterDetailDetailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonCrossTableClick(Sender: TObject);
begin
  dmdRelatorios.ExibeCrossTable;
end;

procedure TfrmPrincipal.buttonEtiquetasProdutosClick(Sender: TObject);
begin
  dmdRelatorios.ExibeEtiquetasProdutos;
end;

procedure TfrmPrincipal.buttonImagensClick(Sender: TObject);
begin
  dmdRelatorios.ExibeImagens;
end;

procedure TfrmPrincipal.buttonLoadClick(Sender: TObject);
begin
  dmdRelatorios.ExibeListaProdutos;
end;

procedure TfrmPrincipal.buttonMasterDetailDetailClick(Sender: TObject);
begin
  dmdRelatorios.ExibeMasterDetailDetail;
end;

procedure TfrmPrincipal.buttonSubReportClick(Sender: TObject);
begin
  dmdRelatorios.ExibeSubReport;
end;

end.
