unit Form.MultiView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.Layouts, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation,
  System.ImageList, FMX.ImgList, Form.MultiView.Base;

type
  TfrmMultiView = class(TForm)
    LayoutContainer: TLayout;
    ToolBar1: TToolBar;
    ButtonView: TButton;
    LayoutMain: TLayout;
    MultiView1: TMultiView;
    ImageList: TImageList;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    procedure ListBoxItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FBaseView: TfrmBaseMultiView;
    procedure FormOpen(AFrm: TComponentClass);
  end;

var
  frmMultiView: TfrmMultiView;

implementation

{$R *.fmx}

uses Form.MultiView.Camera;


{ TfrmMultiView }

procedure TfrmMultiView.FormOpen(AFrm: TComponentClass);
var
  i: Integer;
begin
  if (not Assigned(FBaseView)) or
   (Assigned(FBaseView) and (FBaseView.ClassName <> AFrm.ClassName)) then
  begin
    for i := LayoutContainer.ControlsCount -1 downto 0 do
    begin
      LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);
    end;

    FBaseView.DisposeOf; {No futuro: Free}
    FBaseView := nil;

    Application.CreateForm(AFrm, FBaseView);
    LayoutContainer.AddObject(TLayout(FBaseView.FindComponent('LayoutClient')));
  end;

  MultiView1.HideMaster;
end;

procedure TfrmMultiView.ListBoxItem1Click(Sender: TObject);
begin
  FormOpen(TfrmMultiViewCamera);
end;

end.
