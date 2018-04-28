unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  Form.Cadastro.Usuario;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    buttonUsuarios: TToolButton;
    procedure buttonUsuariosClick(Sender: TObject);
  private
    { Private declarations }
//    你好: Integer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonUsuariosClick(Sender: TObject);
begin
  frmUsuario.Show;
end;

end.
