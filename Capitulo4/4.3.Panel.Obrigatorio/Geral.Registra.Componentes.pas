unit Geral.Registra.Componentes;

interface

uses
  System.SysUtils, System.Classes, Classe.Panel.Obrigatorio, Classe.DB.DateEdit;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CC', [TPanelObrigatorio, TDBDateTimePicker]);
end;

end.
