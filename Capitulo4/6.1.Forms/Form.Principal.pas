unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  Form.Tabs, FMX.Layouts, Form.Menus;

type
  TfrmPrincipal = class(TForm)
    GridPanelLayout: TGridPanelLayout;
    editNome: TEdit;
    buttonOla: TButton;
    buttonTabs: TButton;
    Button1: TButton;
    procedure buttonOlaClick(Sender: TObject);
    procedure buttonTabsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmMenus.Show;
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
