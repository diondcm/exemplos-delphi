unit Classe.Mensagem;

interface

uses Forms, Windows;

type
  TMensagem = class
    class function Confirmacao(const pMsg: string): Boolean;
    class procedure Aviso(const pMsg: string);
  end;

implementation

{ TMensagem }

class procedure TMensagem.Aviso(const pMsg: string);
begin
  Application.MessageBox(PChar(pMsg), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
end;

class function TMensagem.Confirmacao(const pMsg: string): Boolean;
begin
  Result := Application.MessageBox(PChar(pMsg), 'Confirmação', MB_OKCANCEL + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDOK;
end;

end.
