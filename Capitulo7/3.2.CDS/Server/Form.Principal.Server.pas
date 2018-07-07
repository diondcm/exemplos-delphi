unit Form.Principal.Server;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmServerDS2010 = class(TForm)
    TrayIcon: TTrayIcon;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServerDS2010: TfrmServerDS2010;

implementation

{$R *.dfm}

procedure TfrmServerDS2010.ApplicationEventsMinimize(Sender: TObject);
begin
  Hide;
  WindowState := wsMinimized;

  TrayIcon.Visible := True;
  TrayIcon.Animate := True;
  TrayIcon.ShowBalloonHint;
end;

procedure TfrmServerDS2010.FormCreate(Sender: TObject);
begin
  TrayIcon.Hint := 'Teste Try';
  TrayIcon.AnimateInterval := 200;

  TrayIcon.BalloonTitle := 'Exibindo Janela';
  TrayIcon.BalloonHint := 'Duplo click para reexibir a janela.';
  TrayIcon.BalloonFlags := bfInfo;
end;

procedure TfrmServerDS2010.TrayIconClick(Sender: TObject);
begin
  TrayIcon.Visible := False;
  Show;

  WindowState := wsNormal;
  Application.BringToFront;
end;

end.

