unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, frxClass, frxDBSet, Data.Produtos, Form.Relatorio.Filho;

type
  TfrmPrincipal = class(TForm)
    dtsProdutos: TDataSource;
    gridProdutos: TDBGrid;
    TimerOpen: TTimer;
    Panel1: TPanel;
    frxReport1: TfrxReport;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridProdutosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmPrincipal.gridProdutosDblClick(Sender: TObject);
begin
  frmListaProdutos.frxReport.Variables['id_rel'] := 1234;
  frmListaProdutos.frxReport.Variables['filtro'] := QuotedStr('Todos os produtos');
  frmListaProdutos.frxReport.ShowReport;
end;

procedure TfrmPrincipal.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  dmdProdutos.qryProdutos.Open;
end;

end.
