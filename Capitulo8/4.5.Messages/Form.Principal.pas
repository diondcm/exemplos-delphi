unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ButtonClose: TButton;
    ButtonGetHandle: TButton;
    EditHandle: TEdit;
    EditCaption: TEdit;
    ButtonClick: TButton;
    ButtonSetText: TButton;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonGetHandleClick(Sender: TObject);
    procedure ButtonClickClick(Sender: TObject);
    procedure ButtonSetTextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonClickClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONDOWN, 0, 0);
  Sleep(100);
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONUP, 0, 0);
end;

procedure TfrmPrincipal.ButtonSetTextClick(Sender: TObject);
begin
 SetWindowText(StrToInt(EditHandle.Text), 'Alterado');
end;

procedure TfrmPrincipal.ButtonCloseClick(Sender: TObject);
begin
//  SendMessage(Handle, WM_CLOSE, 0, 0);
  SendMessage( StrToInt(EditHandle.Text) , WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipal.ButtonGetHandleClick(Sender: TObject);
begin
  EditHandle.Text := IntToStr(FindWindow(nil, PChar(EditCaption.Text)));// PAnsiChar
end;

end.
