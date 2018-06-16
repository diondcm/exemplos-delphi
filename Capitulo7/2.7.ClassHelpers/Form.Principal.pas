unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Classe.DBGrid.Helper, Vcl.Menus;

type
  TfrmGridHelper = class(TForm)
    gridDados: TDBGrid;
    memDados: TFDMemTable;
    memDadoscodigo: TIntegerField;
    memDadosdescricao: TStringField;
    dtsDados: TDataSource;
    PopupMenu: TPopupMenu;
    OrdenarporCdigo1: TMenuItem;
    OrdenarporDescrio1: TMenuItem;
    procedure gridDadosTitleClick(Column: TColumn);
    procedure OrdenarporCdigo1Click(Sender: TObject);
    procedure OrdenarporDescrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridHelper: TfrmGridHelper;

implementation

{$R *.dfm}

procedure TfrmGridHelper.gridDadosTitleClick(Column: TColumn);
begin
  gridDados.IndexaPorField(Column);
end;

procedure TfrmGridHelper.OrdenarporCdigo1Click(Sender: TObject);
begin
  gridDados.IndexaPorField('codigo');
end;

procedure TfrmGridHelper.OrdenarporDescrio1Click(Sender: TObject);
begin
  gridDados.IndexaPorField('descricao');
end;

end.
