unit Form.Menus;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.Objects, Form.Lista, Form.WebBrowser, Base.Form.Mobile;

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
    buttonWebBrowser: TButton;
    actWebBrowser: TAction;
    labelURL: TLabel;
    procedure actCloseExecute(Sender: TObject);
    procedure actVisualizarListaExecute(Sender: TObject);
    procedure actWebBrowserExecute(Sender: TObject);
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

procedure TfrmMenus.actWebBrowserExecute(Sender: TObject);
begin
  TfrmWebBrowser.ExibeLikeModal(
    procedure (Sender: TFrmBase; pRetorno: Boolean)
    begin
      labelURL.Text := (Sender as TfrmWebBrowser).editURL.Text;// todo: Vira Propriedade
    end);
end;

end.
