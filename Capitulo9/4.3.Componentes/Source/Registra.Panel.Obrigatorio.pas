unit Registra.Panel.Obrigatorio;

interface

procedure Register;

implementation

uses System.Classes, Classes.Panel.Obrigatorio;

procedure Register;
begin
  RegisterComponents('Alunos2020', [TPanelObrigatorio]);
end;


end.
