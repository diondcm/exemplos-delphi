unit Base.Mensagem;

interface

uses
  Vcl.Dialogs, Vcl.Forms, Winapi.Windows, System.UITypes;


type
  TMensagem = class
    class procedure Aviso(const pTexto: string);
    class function Confirmacao(const pTexto: string): Boolean;
  end;

implementation

{ TMensagem }

class procedure TMensagem.Aviso(const pTexto: string);
begin
  Application.MessageBox(PChar(pTexto), 'Aviso', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

class function TMensagem.Confirmacao(const pTexto: string): Boolean;
begin
  // MessageDlg() - Delphi
  Result := Application.MessageBox(PChar(pTexto), 'Confirmação',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= IDYES;
end;

end.
