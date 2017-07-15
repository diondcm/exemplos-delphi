unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, frxClass, frxDBSet,
  frxBarcode;

type
  TfrmPrincipal = class(TForm)
    FDConnection: TFDConnection;
    qryProdutos: TFDQuery;
    btnListaCodigos: TButton;
    frxReportListaCodigo: TfrxReport;
    frxDBProdutos: TfrxDBDataset;
    frxReportDinamico: TfrxReport;
    btnCarregaDinamico: TButton;
    btnImpressao: TButton;
    procedure btnListaCodigosClick(Sender: TObject);
    procedure btnCarregaDinamicoClick(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCarregaDinamicoClick(Sender: TObject);
begin
  qryProdutos.Open;
  frxReportDinamico.LoadFromFile('ListaCodigo.fr3');
  frxReportDinamico.ShowReport;
end;

procedure TfrmPrincipal.btnImpressaoClick(Sender: TObject);
begin
  qryProdutos.Open;
//  frxReportListaCodigo.PrepareReport;
  frxReportListaCodigo.Print;
end;

procedure TfrmPrincipal.btnListaCodigosClick(Sender: TObject);
begin
  qryProdutos.Open;
  frxReportListaCodigo.ShowReport;
end;

end.
