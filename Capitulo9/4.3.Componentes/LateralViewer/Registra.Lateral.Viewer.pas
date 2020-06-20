unit Registra.Lateral.Viewer;

interface

procedure register;

implementation

uses System.Classes, Classe.LateralViewer;

procedure register;
begin
  RegisterComponents('Alunos2020', [TLateralViewer]);
end;

end.
