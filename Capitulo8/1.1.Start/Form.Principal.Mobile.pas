unit Form.Principal.Mobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D, FMX.Layouts, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, Classe.Conversor,
  FMX.DialogService;

type
  TForm2 = class(TForm)
    LayoutPrincipal: TLayout;
    Layout3D1: TLayout3D;
    Label1: TLabel;
    EditValor: TEdit;
    Button1: TButton;
    LabelResultado: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  lValorConvertido: string;
begin
//  FormatSettings.DecimalSeparator := ',';

  lValorConvertido := TConversor.RealParaDolar(EditValor.Text);
  if TConversor.VALOR_INVALIDO = lValorConvertido then
  begin
    TDialogService.ShowMessage('Valor ' + lValorConvertido + ' informado é inválido.');
  end else begin
    LabelResultado.Text := lValorConvertido;
  end;
end;

end.
