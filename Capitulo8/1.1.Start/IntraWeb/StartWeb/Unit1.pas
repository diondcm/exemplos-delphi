unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Classe.Conversor, IWCompEdit, IWCompLabel, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  ClientModuleUnit1;

type
  TIWForm1 = class(TIWAppForm)
    IWButton1: TIWButton;
    IWLabel1: TIWLabel;
    IWEditValor: TIWEdit;
    IWLabelResultado: TIWLabel;
    procedure IWButton1AsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}


procedure TIWForm1.IWButton1AsyncClick(Sender: TObject; EventParams: TStringList);
begin
  ClientModule1 := TClientModule1.Create(nil);
  IWLabelResultado.Text := TConversor.RealParaDolar(IWEditValor.Text);
  ClientModule1.Free;
end;

initialization
  TIWForm1.SetAsMainForm;

end.
