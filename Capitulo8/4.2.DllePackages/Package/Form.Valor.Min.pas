unit Form.Valor.Min;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmValorMin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditValor1: TEdit;
    EditValor2: TEdit;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorMin: TfrmValorMin;

implementation

{$R *.dfm}


initialization
  RegisterClass(TfrmValorMin);

finalization
  UnRegisterClass(TfrmValorMin);

end.
