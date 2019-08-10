unit Form.MultiView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.MultiView,
  FMX.Layouts, FMX.ListBox, FMX.StdCtrls, FMX.Controls.Presentation,
  System.ImageList, FMX.ImgList, Form.MultiView.Base, FMX.DialogService;

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
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
  private
    procedure RemoveControls;
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

uses Form.MultiView.Camera, Form.MultiView.Audio, Form.MultiView.Mensagem;


{ TfrmMultiView }

procedure TfrmMultiView.FormOpen(AFrm: TComponentClass);
begin
  if (not Assigned(FBaseView)) or
   (Assigned(FBaseView) and (FBaseView.ClassName <> AFrm.ClassName)) then
  begin
    RemoveControls;

    FBaseView.DisposeOf; {No futuro: Free}
    FBaseView := nil;

    Application.CreateForm(AFrm, FBaseView);

    FBaseView.OnCloseProc :=
      procedure (pForm: TfrmBaseMultiView)
      begin
        RemoveControls;
        FBaseView := nil;

        //TDialogService.ShowMessage(pForm.Name);
      end;

    LayoutContainer.AddObject(TLayout(FBaseView.FindComponent('LayoutClient')));
  end;

  MultiView1.HideMaster;
end;

procedure TfrmMultiView.RemoveControls;
var
  i: Integer;
begin
  for i := LayoutContainer.ControlsCount - 1 downto 0 do
  begin
    LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);
  end;
end;

procedure TfrmMultiView.ListBoxItem1Click(Sender: TObject);
begin
  FormOpen(TfrmMultiViewCamera);
end;

procedure TfrmMultiView.ListBoxItem2Click(Sender: TObject);
begin
  FormOpen(TfrmMultiViewAudio);
end;

procedure TfrmMultiView.ListBoxItem3Click(Sender: TObject);
begin
  FormOpen(TfrmMultiViewMensagem);
end;

end.
