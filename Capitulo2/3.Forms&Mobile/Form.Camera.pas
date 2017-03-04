unit Form.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.Detalhe, FMX.Controls.Presentation, FMX.Objects,
  FMX.MediaLibrary.Actions, FMX.Media, System.Actions, FMX.ActnList,
  FMX.StdActns;

type
  TfrmCamera = class(TfrmBaseDetalhe)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    imgImagem: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    CameraComponent1: TCameraComponent;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    Button5: TButton;
    Button6: TButton;
    procedure Button5Click(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure Button6Click(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
  private
    procedure GetImagem;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmCamera.Button5Click(Sender: TObject);
begin
  inherited;
  CameraComponent1.Active := not CameraComponent1.Active;
end;

procedure TfrmCamera.Button6Click(Sender: TObject);
var
  lEstadoAnterior: Boolean;
begin
  inherited;
  lEstadoAnterior := CameraComponent1.Active;
  CameraComponent1.Active := False;

  if CameraComponent1.Kind = TCameraKind.FrontCamera then
  begin
    CameraComponent1.Kind := TCameraKind.BackCamera;
  end else if CameraComponent1.Kind = TCameraKind.BackCamera then
  begin
      CameraComponent1.Kind := TCameraKind.FrontCamera;
  end;
  CameraComponent1.Active := lEstadoAnterior;
end;

procedure TfrmCamera.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  inherited;
  TThread.Synchronize(TThread.CurrentThread, GetImagem);
end;

procedure TfrmCamera.GetImagem;
begin
  CameraComponent1.SampleBufferToBitmap(imgImagem.Bitmap, True);
end;

procedure TfrmCamera.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  inherited;
  ShowShareSheetAction1.Bitmap.Assign(imgImagem.Bitmap);
end;

procedure TfrmCamera.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  inherited;
  imgImagem.Bitmap.Assign(Image);
end;

end.
