unit Form.Principal.Remote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
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

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  Sleep(1000);
  Caption := TimeToStr(Now);
  Sleep(2000);
  Caption := Caption + ' - ' + IntToStr(Random(2000));
  Sleep(2000);
  Caption := Caption + ' - ' + 'Alterado';
  Sleep(1000);
  Caption := Caption + ' - ' + ' FIM';
end;

end.
