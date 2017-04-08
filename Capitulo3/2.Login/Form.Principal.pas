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
  private
    { Private declarations }
  public
    procedure SetUsuatio(pUsuario: TUsuario);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  SetUsuatio(TfrmLogin.ExecutaLogin);
end;

procedure TfrmPrincipal.SetUsuatio(pUsuario: TUsuario);
begin
  if Assigned(pUsuario) then
  begin
    lblUsuario.Text := pUsuario.Nome;
  end;
  // StatusBar1.
end;

end.
