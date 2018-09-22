unit Form.Principal.MultiView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox, FMX.Layouts, FMX.Controls.Presentation, FMX.MultiView, System.ImageList, FMX.ImgList, FMX.StdCtrls, Form.Mensagem,
  Form.Audio, Form.Camera;

type
  TfrmPrincipalMultiView = class(TForm)
    MultiView: TMultiView;
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItemMensagem: TListBoxItem;
    ListBoxItemAudio: TListBoxItem;
    ListBoxItemCamera: TListBoxItem;
    ImageList: TImageList;
    LayoutMain: TLayout;
    ToolBar1: TToolBar;
    LayoutContainer: TLayout;
    ButtonMultiView: TButton;
    procedure ListBoxItemMensagemClick(Sender: TObject);
    procedure ListBoxItemAudioClick(Sender: TObject);
    procedure ListBoxItemCameraClick(Sender: TObject);
  private
    FActiveForm: TForm;
    procedure FormOpen(AFormClass: TComponentClass);
  public
    { Public declarations }
  end;

var
  frmPrincipalMultiView: TfrmPrincipalMultiView;

implementation

{$R *.fmx}

{ TForm1 }

procedure TfrmPrincipalMultiView.FormOpen(AFormClass: TComponentClass);
var
  i: Integer;
begin
  if (not Assigned(FActiveForm)) or
    ((Assigned(FActiveForm) and
     (FActiveForm.ClassName <> AFormClass.ClassName))) then
  begin
    for i := LayoutContainer.ControlsCount -1 downto 0 do
    begin
      LayoutContainer.RemoveObject(LayoutContainer.Controls[i]);
    end;

    FActiveForm.DisposeOf; { Free before Tokyo }
    FActiveForm := nil;

    Application.CreateForm(AFormClass, FActiveForm);
    LayoutContainer.AddObject(TLayout(FActiveForm.FindComponent('LayoutClient')));
  end;

  MultiView.HideMaster;
end;

procedure TfrmPrincipalMultiView.ListBoxItemAudioClick(Sender: TObject);
begin
  FormOpen(TfrmAudio);
end;

procedure TfrmPrincipalMultiView.ListBoxItemCameraClick(Sender: TObject);
begin
  FormOpen(TfrmCamera);
end;

procedure TfrmPrincipalMultiView.ListBoxItemMensagemClick(Sender: TObject);
begin
  FormOpen(TfrmMensagem);
end;

end.
