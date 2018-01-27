unit Form.Menus;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.Objects, Form.Lista;

type
  TfrmMenus = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    Image: TImage;
    ActionList1: TActionList;
    buttonVisualizarLista: TButton;
    actClose: TAction;
    actVisualizarLista: TAction;
    procedure actCloseExecute(Sender: TObject);
    procedure actVisualizarListaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenus: TfrmMenus;

implementation

{$R *.fmx}

procedure TfrmMenus.actCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenus.actVisualizarListaExecute(Sender: TObject);
begin
  frmLista.Show;
end;

end.
