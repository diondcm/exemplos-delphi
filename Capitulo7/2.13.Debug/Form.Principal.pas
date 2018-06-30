unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Remote.Debug, Vcl.StdCtrls, System.Zip;

type
  TfrmPrincipal = class(TForm)
    buttonZip: TButton;
    FileOpenDialog: TFileOpenDialog;
    procedure buttonZipClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  FileCtrl;

procedure TfrmPrincipal.buttonZipClick(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  lZip: TZipFile;
  lPath: string;
begin
  lZip := TZipFile.Create;
  try
//    Evitar usar:
//    if SelectDirectory(lDir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0,[sdNewUI]) then
//      Caption := lDir;
    if FileOpenDialog.Execute then
    begin
      lPath := IncludeTrailingPathDelimiter(FileOpenDialog.FileName);
      lZip.Open(lPath + 'remote.zip', zmWrite);

      lZip.Add(lPath +'RMTDBG250.EXE');
      lZip.Add(lPath +'BORDBK250.dll');
      lZip.Add(lPath +'BORDBK250N.dll');
      lZip.Add(lPath +'DCC32250.dll');
      lZip.Add(lPath +'BCCIDE.dll');
      lZip.Add(lPath +'COMP32X.dll');
    end;
  finally
    lZip.Free;
  end;
end;

end.
