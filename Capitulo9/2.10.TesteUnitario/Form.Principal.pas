unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Classe.Processa.Texto;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  lProcessa: TProcessaTexto;
begin
  lProcessa := TProcessaTexto.Create;

  Memo2.Text := lProcessa.MetadeDoTexto(Memo1.Text);
  ShowMessage('Copia Ok');
  Memo1.SetFocus;

  lProcessa.Free;
end;

end.
