unit Geral.Registra.Classes;

interface

  procedure Register;

implementation

uses
  Classe.GridPlus, System.Classes;

procedure Register;
begin
  RegisterComponents('Samples', [TGridPlus]);
end;

end.
