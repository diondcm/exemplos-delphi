unit Form.Action.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Form.Base.Mobile, FMX.Controls.Presentation, FMX.Layouts, System.Actions, FMX.ActnList, FMX.Objects, FMX.StdActns,
  FMX.MediaLibrary.Actions;

type
  TfrmActionCamera = class(TfrmBaseMobile)
    ToolBar1: TToolBar;
    ButtonClose: TButton;
    Image1: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction: TTakePhotoFromCameraAction;
    Button1: TButton;
    ShowShareSheetAction1: TShowShareSheetAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    Button2: TButton;
    Button3: TButton;
    procedure ButtonCloseClick(Sender: TObject);
    procedure TakePhotoFromCameraActionDidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActionCamera: TfrmActionCamera;

implementation

{$R *.fmx}

procedure TfrmActionCamera.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmActionCamera.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.Bitmap.Assign(Image1.Bitmap);
end;

procedure TfrmActionCamera.TakePhotoFromCameraActionDidFinishTaking(Image: TBitmap);
begin
  Image1.Bitmap.Assign(Image);
end;

procedure TfrmActionCamera.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  Image1.Bitmap.Assign(Image);
end;

end.
