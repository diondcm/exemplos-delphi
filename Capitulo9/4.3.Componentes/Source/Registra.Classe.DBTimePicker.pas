unit Registra.Classe.DBTimePicker;

interface

procedure register;

implementation

uses System.Classes, DesignIntf, Classe.DBDateTimePicker,
  Classe.Editor.Propriedade;

procedure register;
begin
  RegisterComponents('Alunos2020', [TDBDateTimePiker]);
  RegisterComponentEditor(TDBDateTimePiker, TEditorMenu);
  RegisterPropertyEditor(TypeInfo(string), TDBDateTimePiker, 'Sobre', TShowAbout);
end;


end.
