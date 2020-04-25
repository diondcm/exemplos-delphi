unit Form.Base.Dialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Form.Base;

type
  TfrmBaseDialog = class(TFrmBase)
    PanelControles: TPanel;
    ButtonOk: TBitBtn;
    ButtonCancelar: TBitBtn;
    ImageLogoSistema: TImage;
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseDialog: TfrmBaseDialog;

implementation

{$R *.dfm}

procedure TfrmBaseDialog.ButtonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBaseDialog.ButtonOkClick(Sender: TObject);
begin
  //// inherited; não existe no ancestral, então não precisa estar aki
  //ShowMessage('Base Dialog');
  ModalResult := mrOk;
end;

end.
