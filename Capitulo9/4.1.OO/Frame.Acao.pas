unit Frame.Acao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPickers, Classe.Acao;

type
  TfraAcao = class(TFrame)
    DatePickerAcao: TDatePicker;
    EditValor: TEdit;
    LabelValor: TLabel;
    LabelEmpresa: TLabel;
    Image1: TImage;
  private
    FAcao: TAcao;
  public
    procedure CarregaAcao(pAcao: TAcao);
    property Acao: TAcao read FAcao;
  end;

implementation

{$R *.dfm}

{ TfraAcao }

procedure TfraAcao.CarregaAcao(pAcao: TAcao);
begin
  LabelEmpresa.Caption := pAcao.Nome + ' (' + pAcao.Abreviatura + ')';
  EditValor.Text := FormatCurr('0.,00', pAcao.Valores.First.Valor);
  DatePickerAcao.Date := pAcao.Valores.First.Data;
end;

end.
