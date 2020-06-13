unit Registra.Classes;

interface

procedure Register;

implementation

uses System.Classes, Classe.DBDateTimePicker; // Classes.Panel.Obrigatorio,

procedure Register;
begin
//  RegisterComponents('Alunos2020', [TPanelObrigatorio]);
  RegisterComponents('Alunos2020', [TDBDateTimePiker]);
end;


end.
