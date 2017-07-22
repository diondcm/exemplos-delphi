unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.MultiView, FMX.ListBox,
  System.ImageList, FMX.ImgList, Form.Base.MultiView, Form.Camera;

type
  TfrmPrincipal = class(TForm)
    MultiView1: TMultiView;
    lsbMain: TListBox;
    layMain: TLayout;
    ToolBar1: TToolBar;
    btnMultiView: TButton;
    layContainer: TLayout;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ImageList1: TImageList;
    procedure ListBoxItem1Click(Sender: TObject);
  private
    FActiveForm: TfrmBaseMultiView;
    procedure FormOpen(AForm: TComponentClass);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.FormOpen(AForm: TComponentClass);
var
  i: Integer;
begin
  if (FActiveForm = nil) or
   (Assigned(FActiveForm) and (FActiveForm.ClassName <> AForm.ClassName)) then
  begin
    for i := layContainer.ControlsCount -1  downto 0 do
    begin
      layContainer.RemoveObject(layContainer.Controls[i]);
    end;

    FActiveForm.DisposeOf; {Free before Tokyo}
    FActiveForm := nil;

    Application.CreateForm(AForm, FActiveForm);
    layContainer.AddObject(TLayout(FActiveForm.FindComponent('LayoutClient')));
  end;

  MultiView1.HideMaster;
end;

procedure TfrmPrincipal.ListBoxItem1Click(Sender: TObject);
begin
  FormOpen(TfrmCamera);
end;

end.
