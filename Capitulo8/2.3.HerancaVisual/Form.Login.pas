unit Form.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TfrmBase)
    Panel1: TPanel;
    Label1: TLabel;
    EditLogin: TEdit;
    Label2: TLabel;
    EditSenha: TEdit;
    ButtonCancelar: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrOk;
end;

procedure TfrmLogin.ButtonCancelarClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

end.
