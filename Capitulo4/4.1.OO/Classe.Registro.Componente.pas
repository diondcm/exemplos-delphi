unit Classe.Registro.Componente;

interface

uses
  System.Classes, Classes.Pessoa;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CriacaoOnLine', [TDependente]);
end;


end.
