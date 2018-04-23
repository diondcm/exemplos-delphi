unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  Form.Tabs, FMX.Layouts, Form.Menus, Form.MultiView, Form.Frames;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout: TGridPanelLayout;
    editNome: TEdit;
    buttonMultiView: TButton;
    buttonTabs: TButton;
    buttonForms: TButton;
    buttonFrames: TButton;
    buttonOla: TButton;
    procedure buttonTabsClick(Sender: TObject);
    procedure buttonFormsClick(Sender: TObject);
    procedure buttonFramesClick(Sender: TObject);
    procedure buttonOlaClick(Sender: TObject);
    procedure buttonMultiViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.buttonFormsClick(Sender: TObject);
begin
  frmMenus.Show;
end;

procedure TfrmPrincipal.buttonFramesClick(Sender: TObject);
begin
  frmFrames.Show;
end;

procedure TfrmPrincipal.buttonMultiViewClick(Sender: TObject);
begin
  frmMultiView.Show;
end;

procedure TfrmPrincipal.buttonOlaClick(Sender: TObject);
begin
  ShowMessage('Olá ' + editNome.Text);
end;

procedure TfrmPrincipal.buttonTabsClick(Sender: TObject);
begin
  frmTabs.Show;
end;

end.
