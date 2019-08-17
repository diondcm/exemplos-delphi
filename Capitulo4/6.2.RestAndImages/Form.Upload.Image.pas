unit Form.Upload.Image;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TfrmUploadImage = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    Button1: TButton;
    ActionList1: TActionList;
    ImagePreview: TImage;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure buttonVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUploadImage: TfrmUploadImage;

implementation

{$R *.fmx}

uses Data.Dados;

procedure TfrmUploadImage.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUploadImage.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  ImagePreview.Bitmap.Assign(Image);
  TdmdDados.GetInstance.UpLoadImagem(Image);
end;

end.
