unit Form.MonitoraDir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.DirWatch, Vcl.StdCtrls;

type
  TfrmMonitoraDir = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    FileOpenDialog: TFileOpenDialog;
    editPasta: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure editPastaClick(Sender: TObject);
  private
    procedure OnPastaChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMonitoraDir: TfrmMonitoraDir;

implementation

{$R *.dfm}

procedure TfrmMonitoraDir.Button1Click(Sender: TObject);
var
  lDir: TDirectoryWatch;
begin
  lDir := TDirectoryWatch.Create(Self);
  lDir.OnChange := OnPastaChange;
//  lDir.WatchSubDirs := True;
  lDir.Directory := editPasta.Text;
  lDir.Active := True;
end;

procedure TfrmMonitoraDir.editPastaClick(Sender: TObject);
begin
  if FileOpenDialog.Execute then
  begin
    editPasta.Text := FileOpenDialog.FileName;
  end;
end;

procedure TfrmMonitoraDir.OnPastaChange(Sender: TObject);
begin
  Memo1.Lines.Add('Alterado ' + TimeToStr(Now));
end;

end.
