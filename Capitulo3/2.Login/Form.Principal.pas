unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Form.Login, Classe.Login;

type
  TfrmPrincipal = class(TForm)
    btnLogin: TButton;
    StatusBar1: TStatusBar;
    lblUsuario: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    class var FUsuario: TUsuario;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  FUsuario := TfrmLogin.ExecutaLogin;
  FormShow(Sender);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if Assigned(FUsuario) then
  begin
    lblUsuario.Text := FUsuario.Nome;
  // StatusBar1.
  end;
end;

end.
