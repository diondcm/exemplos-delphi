unit Registra.Card.Viewer;

interface

procedure register;

implementation

uses System.Classes, Classe.Card.Viewer;

procedure register;
begin
  RegisterComponents('Alunos2020', [TImageViewer]);
end;

end.


