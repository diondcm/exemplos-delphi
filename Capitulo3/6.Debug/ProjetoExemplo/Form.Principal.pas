unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnTestaDebug: TButton;
    edtSeparador: TEdit;
    procedure btnTestaDebugClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnTestaDebugClick(Sender: TObject);
var
  lInt: Integer;
  lStr: string;
  lVal: Double;
begin
  try
    lVal := StrToFloat(Random(1000).ToString + edtSeparador.Text + Random(1000).ToString);
  except
    lVal := -1;
  end;
  lInt := Random(1000);
  lStr := lVal.ToString;

  try
    lStr := IntToStr(lInt + StrToInt(lStr));
  except
    lStr := '0';
  end;

  Caption := lStr;
end;

end.
