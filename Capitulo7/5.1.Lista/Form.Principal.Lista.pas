unit Form.Principal.Lista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, frxDBSet, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, frxGradient;

type
  TfrmLista = class(TForm)
    frxReportLista: TfrxReport;
    FDConnection: TFDConnection;
    qryAluno: TFDQuery;
    dtsAlunos: TDataSource;
    gridAlunos: TDBGrid;
    Button1: TButton;
    frxDBAluno: TfrxDBDataset;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLista: TfrmLista;

implementation

{$R *.dfm}

procedure TfrmLista.Button1Click(Sender: TObject);
begin
  qryAluno.Open;
  frxReportLista.ShowReport;
end;

end.
