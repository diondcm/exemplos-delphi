unit Form.MultiView.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Base.Form.MultiView, FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TfrmCamera = class(TfrmBaseMultiView)
    ToolBar1: TToolBar;
    buttonTirarFoto: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    labelTitulo: TLabel;
    ActionList: TActionList;
    ImageResultado: TImage;
    TakePhotoFromCameraAction: TTakePhotoFromCameraAction;
    procedure TakePhotoFromCameraActionDidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCamera: TfrmCamera;

implementation

{$R *.fmx}

procedure TfrmCamera.TakePhotoFromCameraActionDidFinishTaking(Image: TBitmap);
begin
  ImageResultado.Bitmap.Assign(Image);
end;

end.
