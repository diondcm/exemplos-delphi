unit Form.Exibe.Modal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmExibeModal = class(TForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExibeModal: TfrmExibeModal;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfrmExibeModal);

finalization
  UnRegisterClass(TfrmExibeModal);

end.
