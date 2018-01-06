unit Geral.Registra.Componentes;

interface

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.Controls, Classe.Panel.Obrigatorio, Classe.DB.DateEdit, DesignIntf, Classe.Editor.Propriedade;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CC', [TPanelObrigatorio, TDBDateTimePicker]);
  RegisterPropertyEditor(TypeInfo(string), TPanelObrigatorio, 'Sobre', TShowAbout);

  RegisterComponentEditor(TPanelObrigatorio, TEditorMenu);

//  RegisterPropertyEditor(TypeInfo(TCaption), TLabel, 'Caption', TShowAbout);
end;

end.
