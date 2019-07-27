unit Form.Forms;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.DialogService;

type
  TfrmForms = class(TForm)
    ToolBar1: TToolBar;
    ButtonVoltar: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Image1: TImage;
    ButtonBrowser: TButton;
    ButtonMapView: TButton;
    LabelURL: TLabel;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure ButtonBrowserClick(Sender: TObject);
    procedure ButtonMapViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmForms: TfrmForms;

implementation

{$R *.fmx}

uses Form.Map.Browser, Form.MapView;

procedure TfrmForms.ButtonBrowserClick(Sender: TObject);
begin
//  TDialogService.MessageDialog('', 0 ,0, 0, 0, );
  frmMapBrowser.EditURL.Text := '';
//  frmMapBrowser.ShowModal; => não funciona no mobile
  frmMapBrowser.ExibeForm(
    procedure
    begin
      LabelURL.Text := frmMapBrowser.EditURL.Text;
    end);
end;

procedure TfrmForms.ButtonMapViewClick(Sender: TObject);
begin
  frmMapView.Show;
end;

procedure TfrmForms.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

end.
