unit Unit4;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompButton, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, Classe.Converte.Unidades;

type
  TIWForm4 = class(TIWAppForm)
    iwlResultado: TIWLabel;
    iwbRealParaDolar: TIWButton;
    iweValor: TIWEdit;
    iwlRealParaDolar: TIWLabel;
    procedure iwbRealParaDolarAsyncClick(Sender: TObject;
      EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}


procedure TIWForm4.iwbRealParaDolarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  iwlResultado.Text := TConversor.RealParaDolarStr(iweValor.Text);
end;

initialization
  TIWForm4.SetAsMainForm;

end.
