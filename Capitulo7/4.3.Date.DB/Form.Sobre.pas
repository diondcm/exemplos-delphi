unit Form.Sobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmSobre = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    editValor: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Exibe: string;
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

{ TfrmSobre }

class function TfrmSobre.Exibe: string;
var
  lFrm: TfrmSobre;
begin
  lFrm := TfrmSobre.Create(nil);
  lFrm.ShowModal;
  Result := lFrm.editValor.Text;
  lFrm.Free;
end;

end.
