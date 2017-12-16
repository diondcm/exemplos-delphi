unit Form.Via.Metodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmViaMetodo = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmViaMetodo: TfrmViaMetodo;


function ExibeForm: Integer;

exports
  ExibeForm;


implementation

{$R *.dfm}

function ExibeForm: Integer;
begin
  Result := Ord(TfrmViaMetodo.Create(Application).ShowModal);
end;

end.
