unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, frxDBSet, Vcl.Menus, frxGradient;

type
  TfrmPrincipal = class(TForm)
    frxReportLista: TfrxReport;
    memListaPeixes: TFDMemTable;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    frxDBDataset1: TfrxDBDataset;
    PopupMenuRelatorio: TPopupMenu;
    ExibeRelatrio1: TMenuItem;
    Panel3: TPanel;
    DBImage1: TDBImage;
    Splitter1: TSplitter;
    procedure ExibeRelatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ExibeRelatrio1Click(Sender: TObject);
begin
  // abrir qry
  frxReportLista.ShowReport;
end;

end.
