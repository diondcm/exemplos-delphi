unit Form.MultiView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.ImageList, FMX.ImgList, FMX.ListBox,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.MultiView, Base.Form.MultiView, Form.MultiView.Camera,
  Form.MultiView.Audio;

type
  TfrmMultiView = class(TForm)
    LayoutMain: TLayout;
    ToolBar1: TToolBar;
    LayoutContainer: TLayout;
    ImageList: TImageList;
    MultiView: TMultiView;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    buttonMultiView: TButton;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
  private
    FActiveForm: TfrmBaseMultiView;
    procedure FormOpen(AForm: TComponentClass);
  public
    { Public declarations }
  end;

var
  frmMultiView: TfrmMultiView;

implementation

{$R *.fmx}

{ TForm1 }

procedure TfrmMultiView.FormOpen(AForm: TComponentClass);
var
  i: Integer;
begin
  if (not Assigned(FActiveForm)) or
   (Assigned(FActiveForm) and (FActiveForm.ClassName <> AForm.ClassName)) then
  begin
    for i := LayoutContainer.ControlsCount -1 downto 0 do
    begin
      LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);
    end;

    FActiveForm.DisposeOf; {No futuro: Free}
    FActiveForm := nil;

    Application.CreateForm(AForm, FActiveForm);
    LayoutContainer.AddObject(TLayout(FActiveForm.FindComponent('LayoutClient')));
  end;

  MultiView.HideMaster;
end;

procedure TfrmMultiView.ListBoxItem1Click(Sender: TObject);
begin
  FormOpen(TfrmCamera);
end;

procedure TfrmMultiView.ListBoxItem2Click(Sender: TObject);
begin
  FormOpen(TfrmAudio);
end;

end.
