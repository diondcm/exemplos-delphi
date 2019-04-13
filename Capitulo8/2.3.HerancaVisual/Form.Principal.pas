unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Sobre, Vcl.Menus, Form.Login, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    TimerLogin: TTimer;
    procedure Sobre1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TimerLogin.Enabled  := True;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
//var
//  lfrmLogin: TfrmLogin;
begin
//  lfrmLogin := TfrmLogin.Create(nil);
//  if lfrmLogin.ShowModal = mrOk then
//  begin

//  end else begin
//    Application.Terminate;
//  end;
//  lfrmLogin.Free;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  TfrmSobre.Create(Application).Show;
end;

procedure TfrmPrincipal.TimerLoginTimer(Sender: TObject);
var
  lfrmLogin: TfrmLogin;
begin
  TimerLogin.Enabled  := False;

  lfrmLogin := TfrmLogin.Create(nil);
  if lfrmLogin.ShowModal = mrOk then
  begin

  end else begin
    Application.Terminate;
  end;
  lfrmLogin.Free;
end;

end.
