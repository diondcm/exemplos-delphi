unit Geral.Registra.Componentes;

interface

uses
  System.SysUtils, System.Classes, Classe.DB.Grid.Plus;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CC', [TDBGridPlus]);
end;


end.
