unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ClientModuleUnit1;

type
  TfrmPrincipal = class(TForm)
    PanelCampos: TPanel;
    Label1: TLabel;
    EditValor: TEdit;
    Button1: TButton;
    LabelResultado: TLabel;
    ComboBoxConvercao: TComboBox;
    RadioButtonDolar: TRadioButton;
    RadioButtonReal: TRadioButton;
    Button2: TButton;
    LabelCotacaoAtual: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
const
  DOLAR_PARA_REAL{: Integer} = 0;
var
  lValorCotacao: Double;
begin
  lValorCotacao := ClientModule1.ServerMethods1Client.GetCotacao;
  if ComboBoxConvercao.ItemIndex = 1 { Real para dolar } then
  begin
    LabelResultado.Caption := FormatFloat('0.,00', StrToFloat(EditValor.Text)*lValorCotacao);
  end else if ComboBoxConvercao.ItemIndex = DOLAR_PARA_REAL then
  begin
    LabelResultado.Caption := FormatFloat('0.,00', StrToFloat(EditValor.Text)/lValorCotacao);
  end;

{  if RadioButtonDolar.Checked then
  begin
    LabelResultado.Caption := FloatToStr(StrToFloat(EditValor.Text)*3.8);
  end else if RadioButtonReal.Checked then
  begin
    LabelResultado.Caption := FloatToStr(StrToFloat(EditValor.Text)/3.8);
  end; }

//  LabelResultado.Caption := FloatToStr(StrToFloat(EditValor.Text)*3.8);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  // Alt + F11 -> use unit > Client Module
  LabelCotacaoAtual.Caption := 'Cotação atual: ' + FormatFloat('0.,00', ClientModule1.ServerMethods1Client.GetCotacao);
end;

end.
