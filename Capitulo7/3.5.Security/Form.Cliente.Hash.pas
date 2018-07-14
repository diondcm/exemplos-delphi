unit Form.Cliente.Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Hash;

type
  TfrmHash = class(TForm)
    editTexto: TEdit;
    memoLog: TMemo;
    procedure editTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function GeraHash(const pTexto: string): string;
  public
    { Public declarations }
  end;

var
  frmHash: TfrmHash;

implementation

{$R *.dfm}

procedure TfrmHash.editTextoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    memoLog.Lines.Add(GeraHash(editTexto.Text));
  end;

end;

function TfrmHash.GeraHash(const pTexto: string): string;
begin
  Result := THashMD5.GetHashString(pTexto);
end;

end.
