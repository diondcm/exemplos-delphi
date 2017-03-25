unit Form.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, Classe.Converte.Unidades;

type
  TForm4 = class(TForm)
    edtValor: TEdit;
    btnRealParaDolar: TButton;
    lblResultado: TLabel;
    procedure btnRealParaDolarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btnRealParaDolarClick(Sender: TObject);
begin
  lblResultado.Text := TConversor.RealParaDolarStr(edtValor.Text);
end;

end.
