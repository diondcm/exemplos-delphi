unit Form.Login;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Form.Base.Dialog, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TfrmBaseDialog)
    Label1: TLabel;
    EditSenha: TEdit;
    Label2: TLabel;
    EditUsuario: TEdit;
    procedure ButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.ButtonOkClick(Sender: TObject);

  function GeraHash(pTexto: string): string;
  begin
    if pTexto = 'A' then // Nunca usar hash e crypto próprias, usar algoritmos prontos, não os da Web, os conhecidos: RHA, MD5
      Exit('B')
    else
      Result := 'FF'; // Exit('FF');
  end;

begin

//  if (trim(EditSenha.Text) = '') and (trim(EditUsuario.Text)= '') then
//  begin
//    Application.CreateForm(Tfrmprincipal, frmprincipal);
//    frmprincipal.ShowModal;
//    frmprincipal.Free
//  end else begin
//    ShowMessage('Informe Usuário e Senha');
//    EditUsuario.SetFocus;
//    Exit
//  end;

  // inherited; // se não existe código no ancestral: pode apagar
  ///ShowMessage('Metodo Tela Login');

  var lSenha: string := Trim(EditSenha.Text);

  if lSenha = '' then
  begin
    raise Exception.Create('Informe a senha');
  end;

  if EditUsuario.Text = '' then
  begin
    ShowMessage('Usuário não informado');
    Exit;
  end;

  if GeraHash(lSenha) = 'B' then // senha nunca usar valor, sempre hash
  begin
    ModalResult := mrOK;
  end else begin
    ShowMessage('Senha incorreta');
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  ShowMessage('Dataset.Post');
  inherited;
end;

end.

