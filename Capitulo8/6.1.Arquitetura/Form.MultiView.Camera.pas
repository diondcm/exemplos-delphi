unit Form.MultiView.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, Form.MultiView.Base,
  FMX.Layouts, System.IOUtils, FMX.DialogService;

type
  TfrmMultiViewCamera = class(TfrmBaseMultiView)
    ToolBar1: TToolBar;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    ImageResultado: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    ToolBar2: TToolBar;
    Label1: TLabel;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    ActionCarregaDir: TAction;
    Button7: TButton;
    ActionSalvar: TAction;
    ActionDelete: TAction;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ActionSalvarExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
  private
    FUltFoto: string;
    function GetNomeFoto: string;
  public
    { Public declarations }
  end;

var
  frmMultiViewCamera: TfrmMultiViewCamera;

implementation

{$R *.fmx}

procedure TfrmMultiViewCamera.ActionDeleteExecute(Sender: TObject);
var
  lFoto: string;
begin
  inherited;
  lFoto := GetNomeFoto;

  if not TFile.Exists(lFoto) then
  begin
    lFoto := ChangeFileExt(GetNomeFoto, '.jpeg');
    if not TFile.Exists(lFoto) then
    begin
      lFoto := '';
    end;
  end;

  if lFoto <> '' then
  begin
     TDialogService.MessageDialog('Deseja excluir a última foto?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
     procedure (const AResult: TModalResult)
     begin
       case AResult of
         mrYes:
         begin
           TFile.Delete(lFoto);
         end;
       end;
     end);
  end else begin
    TDialogService.ShowMessage('Foto não encontrada.');
  end;
end;

procedure TfrmMultiViewCamera.ActionSalvarExecute(Sender: TObject);
var
  lStm: TMemoryStream;
begin
  inherited;
  if ImageResultado.Bitmap.Width = 0 then
  begin
    TDialogService.ShowMessage('Selecione uma foto.');
  end else begin
    lStm := TMemoryStream.Create;
    try
      ImageResultado.Bitmap.SaveToStream(lStm);
      lStm.SaveToFile(GetNomeFoto);

      if TFile.Exists(GetNomeFoto) then
      begin
        TDialogService.ShowMessage('Imagem salva com sucesso em: ' + sLineBreak + GetNomeFoto);
      end;

      ImageResultado.Bitmap.SaveToFile(ChangeFileExt(GetNomeFoto, '.jpeg'));
      if TFile.Exists(GetNomeFoto) then
      begin
        TDialogService.ShowMessage('Jpeg salva com sucesso em: ' + sLineBreak + GetNomeFoto);
      end;

    finally
      lStm.Free;
    end;
  end;

end;

procedure TfrmMultiViewCamera.Button6Click(Sender: TObject);
begin
  inherited;

  if TFile.Exists(GetNomeFoto) then
  begin
    ImageResultado.Bitmap.LoadFromFile(GetNomeFoto);
  end else if TFile.Exists(ChangeFileExt(GetNomeFoto, '.jpeg')) then
  begin
    ImageResultado.Bitmap.LoadFromFile(ChangeFileExt(GetNomeFoto, '.jpeg'));
  end else begin
    TDialogService.ShowMessage('Foto não encontrada');
  end;
end;

function TfrmMultiViewCamera.GetNomeFoto: string;
begin
  if FUltFoto = '' then // exagero
  begin
    FUltFoto := System.IOUtils.TPath.Combine(System.IOUtils.Tpath.GetDocumentsPath, 'ultimafoto.bmp');
  end;

  Result := FUltFoto;
end;

procedure TfrmMultiViewCamera.ShowShareSheetAction1BeforeExecute(
  Sender: TObject);
begin
  ShowShareSheetAction1.Bitmap.Assign(ImageResultado.Bitmap);
end;

procedure TfrmMultiViewCamera.TakePhotoFromCameraAction1DidFinishTaking(
  Image: TBitmap);
begin
  ImageResultado.Bitmap.Assign(Image);
end;

procedure TfrmMultiViewCamera.TakePhotoFromLibraryAction1DidFinishTaking(
  Image: TBitmap);
begin
  ImageResultado.Bitmap.Assign(Image);
end;

end.
