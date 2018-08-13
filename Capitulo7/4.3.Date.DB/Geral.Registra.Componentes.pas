unit Geral.Registra.Componentes;

interface

uses Form.Sobre, Classe.Editor.Propriedade;

  procedure register;

implementation

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.Controls, Classe.DB.DateEdit, DesignIntf;

procedure register;
begin
  RegisterComponents('Samples', [TDBDateTime]);

  RegisterPropertyEditor(TypeInfo(string), TDBDateTime, 'Sobre', TShowAbout);
  RegisterComponentEditor(TDBDateTime, TEditorMenu);
end;

end.
