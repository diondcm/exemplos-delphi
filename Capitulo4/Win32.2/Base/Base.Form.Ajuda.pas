unit Base.Form.Ajuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ShellApi;

type
  TfrmBaseAjudaClass = class of TfrmBaseAjuda;
  TfrmBaseAjuda = class(TForm)
    lblMensagem: TLabel;
    LinkLabel: TLinkLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LinkLabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LinkLabelMouseLeave(Sender: TObject);
    procedure LinkLabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseAjuda: TfrmBaseAjuda;

implementation

{$R *.dfm}

procedure TfrmBaseAjuda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaseAjuda.LinkLabelClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PChar(TLabel(Sender).Caption), nil, nil, 0);
end;

procedure TfrmBaseAjuda.LinkLabelMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clBlack;
  TLabel(Sender).Font.Style := [];
  Cursor := crDefault;
end;

procedure TfrmBaseAjuda.LinkLabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  TLabel(Sender).Font.Color := clBlue;
  TLabel(Sender).Font.Style := [fsUnderline];
  Cursor := crHandPoint;
end;

end.
