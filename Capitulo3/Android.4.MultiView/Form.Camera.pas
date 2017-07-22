unit Form.Camera;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.MultiView, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions;

type
  TfrmCamera = class(TfrmBaseMultiView)
    ToolBar1: TToolBar;
    imgResultado: TImage;
    lblCamera: TLabel;
    ActionList1: TActionList;
    btnTirarFoto: TButton;
    btnProcurarFoto: TButton;
    btnCompartilhar: TButton;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    btnSalvarPhoto: TButton;
    btnCarregarUltimaFoto: TButton;
    btnImgSaveDireto: TButton;
    Button1: TButton;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure btnSalvarPhotoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnImgSaveDiretoClick(Sender: TObject);
    procedure btnCarregarUltimaFotoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCamera: TfrmCamera;

implementation

{$R *.fmx}

uses
  System.IOUtils, FMX.DialogService;

procedure TfrmCamera.btnCarregarUltimaFotoClick(Sender: TObject);
var
  lStrem: TMemoryStream;
  lArquivo: string;
begin
  inherited;
  lArquivo := TPath.Combine(TPath.GetDocumentsPath, 'ultimafoto.bmp');
  if TFile.Exists(lArquivo) then
  begin
    lStrem := TMemoryStream.Create;
    try
      lStrem.LoadFromFile(lArquivo);
      imgResultado.Bitmap.LoadFromStream(lStrem);
    finally
      lStrem.Free;
    end;
  end else begin
    ShowMessage('Arquivo não encontrado');
  end;
end;

procedure TfrmCamera.btnImgSaveDiretoClick(Sender: TObject);
begin
  if imgResultado.Bitmap.Width = 0 then
  begin
    raise Exception.Create('Image não carregada.');
  end;

 // imgResultado.Bitmap.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'ultimafoto.bmp'));
 // Gera erro e não salva a bmp
end;

procedure TfrmCamera.btnSalvarPhotoClick(Sender: TObject);
var
  lStrem: TMemoryStream;
  lArquivo: string;
begin
  if imgResultado.Bitmap.Width = 0 then
  begin
    raise Exception.Create('Image não carregada.');
  end;

  lStrem := TMemoryStream.Create;
  try
    // TPath.GetDocumentsPath >> Caminho dos documentos, no mobile
    lArquivo := TPath.Combine(TPath.GetDocumentsPath, 'ultimafoto.bmp');
    ShowMessage(lArquivo);

    imgResultado.Bitmap.SaveToStream(lStrem);
    lStrem.SaveToFile(lArquivo);
  finally
    lStrem.Free;
  end;
end;

procedure TfrmCamera.Button1Click(Sender: TObject);
var
  lStrem: TMemoryStream;
  lArquivo: string;
begin
  lArquivo := TPath.Combine(TPath.GetDocumentsPath, 'ultimafoto.bmp');
  if TFile.Exists(lArquivo)
    { todo: dialog
    (TDialogService.MessageDialog('Deletar ultima foto?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbYes, 0))
    } then
  begin
    TFile.Delete(lArquivo);
  end;
end;

procedure TfrmCamera.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  inherited;
  ShowShareSheetAction1.Bitmap.Assign(imgResultado.Bitmap);
end;

procedure TfrmCamera.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  inherited;
  imgResultado.Bitmap.Assign(Image);
end;

procedure TfrmCamera.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  inherited;
  imgResultado.Bitmap.Assign(Image);
end;

end.
