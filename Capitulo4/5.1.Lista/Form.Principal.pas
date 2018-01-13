unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, frxDBSet;

type
  TfrmPrincipal = class(TForm)
    frxReport: TfrxReport;
    FDConnection: TFDConnection;
    qryAluno: TFDQuery;
    dtsAluno: TDataSource;
    gridAluno: TDBGrid;
    navAluno: TDBNavigator;
    panelControles: TPanel;
    buttonAbrir: TButton;
    frxDBqryAluno: TfrxDBDataset;
    buttonExibirLista: TButton;
    procedure buttonAbrirClick(Sender: TObject);
    procedure buttonExibirListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonAbrirClick(Sender: TObject);
begin
  qryAluno.Open;
end;

procedure TfrmPrincipal.buttonExibirListaClick(Sender: TObject);
begin
  frxReport.ShowReport;
end;

end.
