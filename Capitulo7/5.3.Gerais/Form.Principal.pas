unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, frxClass, frxDBSet, Vcl.StdCtrls, Vcl.ExtCtrls,
  StrUtils;

type
  TfrmPrincipal = class(TForm)
    FDConnection: TFDConnection;
    qryDados: TFDQuery;
    dtsDados: TDataSource;
    gridDados: TDBGrid;
    frxDBVendas: TfrxDBDataset;
    frxReport: TfrxReport;
    frxReportTemplate: TfrxReport;
    frxReportVariaveis: TfrxReport;
    qryVendas: TFDQuery;
    qryCliente: TFDQuery;
    dtsCliente: TDataSource;
    frxDBCliente: TfrxDBDataset;
    frxDBVenda: TfrxDBDataset;
    panelOpen: TPanel;
    buttonReport: TButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonReportClick(Sender: TObject);
    procedure frxReportVariaveisBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonReportClick(Sender: TObject);
begin
  //frxReportVariaveis.Variables['id_rel'] := 'ix35';
  frxReportVariaveis.Variables['id_rel'] := QuotedStr(UnitName);
  frxReportVariaveis.Variables['filtro'] := QuotedStr('Período utilizado: ' + DateToStr(Now));
  frxReportVariaveis.ShowReport;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  ShowMessage('Text: ' + qryCliente.Text + sLineBreak +
//    'SQL: ' + qryCliente.SQL.Text);
end;

procedure TfrmPrincipal.frxReportVariaveisBeforePrint(Sender: TfrxReportComponent);
begin
  if (Sender is TfrxMemoView)
    and (LowerCase(TfrxMemoView(Sender).Name) = LowerCase('memLicenca')) then
  begin
    TfrxMemoView(Sender).Text := IfThen(DayOfWeek(Now) = 2, 'Válida', 'Inválida');
    TfrxMemoView(Sender).Color := clGray;
  end;
end;

end.
