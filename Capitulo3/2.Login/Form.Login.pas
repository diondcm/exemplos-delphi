unit Form.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, Classe.Login;

type
  TfrmLogin = class(TForm)
    edtUsuario: TEdit;
    edtLogin: TEdit;
    imgLogo: TImage;
    lblMsg: TLabel;
    tmrMsg: TTimer;
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure tmrMsgTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUsuario: TUsuario;
  public
    class function ExecutaLogin: TUsuario;
    property Usuario: TUsuario read FUsuario write FUsuario;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  Winapi.Windows;

{$R *.fmx}

procedure TfrmLogin.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  lUsuario: TUsuario;
begin
  if (edtUsuario.Text <> '') and (edtLogin.Text <> '') then
  begin
    lUsuario := TLogin.Verifica(edtUsuario.Text, edtLogin.Text);
    if Assigned(lUsuario) then
    begin
      FUsuario := lUsuario;
      ModalResult := mrOk;
    end else begin
      if Key = VK_RETURN then
      begin
        lblMsg.Text := 'Usuário e senha inválidos';
        tmrMsg.Enabled := True;
      end;
    end;
  end;

  if Key = VK_ESCAPE then
  begin
    ModalResult := mrCancel;
  end;
end;

class function TfrmLogin.ExecutaLogin: TUsuario;
var
  lFrmLogin: TfrmLogin;
begin
  lFrmLogin := TfrmLogin.Create(nil);
  try
    lFrmLogin.ShowModal;
    Result := lFrmLogin.Usuario;
  finally
    lFrmLogin.Free;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.tmrMsgTimer(Sender: TObject);
begin
  tmrMsg.Enabled := False;
  lblMsg.Text := '';
end;

end.
