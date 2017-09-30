unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uConversorMoeda;

type
  TfrmPrincipal = class(TForm)
    edtValor: TEdit;
    btnDolarParaReal: TButton;
    btnRealParaDolar: TButton;
    pnlResultado: TPanel;
    procedure btnRealParaDolarClick(Sender: TObject);
    procedure btnDolarParaRealClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnDolarParaRealClick(Sender: TObject);
begin
// Ctrl + ; >> pt / >> en
//  try
    //pnlResultado.Caption := FloatToStr(TConversorMoeda.DolarParaReal(StrToFloat(edtValor.Text)));
    pnlResultado.Caption := TConversorMoeda.DolarParaReal(edtValor.Text);
//  except
//    ShowMessage('Valor inválido');
//  end;
end;

procedure TfrmPrincipal.btnRealParaDolarClick(Sender: TObject);
begin
  // alt + F11 >> uses
  pnlResultado.Caption := TConversorMoeda.RealParaDolar(edtValor.Text);
end;

end.
