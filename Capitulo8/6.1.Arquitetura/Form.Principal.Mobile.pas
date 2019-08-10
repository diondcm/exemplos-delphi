unit Form.Principal.Mobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Form.Exibe.Frame;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    ButtonTabs: TButton;
    ButtonForms: TButton;
    ButtonMultiView: TButton;
    ButtonFrame: TButton;
    procedure ButtonTabsClick(Sender: TObject);
    procedure ButtonFormsClick(Sender: TObject);
    procedure ButtonMultiViewClick(Sender: TObject);
    procedure ButtonFrameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Form.Tabs, Form.Forms, Form.MultiView;

procedure TfrmPrincipal.ButtonFormsClick(Sender: TObject);
begin
  frmForms.Show;
end;

procedure TfrmPrincipal.ButtonFrameClick(Sender: TObject);
begin
  frmExibeFrame.Show;
end;

procedure TfrmPrincipal.ButtonMultiViewClick(Sender: TObject);
begin
  frmMultiView.Show;
end;

procedure TfrmPrincipal.ButtonTabsClick(Sender: TObject);
begin
  frmTabs.Show;
end;

end.
