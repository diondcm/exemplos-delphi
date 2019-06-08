unit Classe.Registra.Componentes;

interface

uses Classe.Panel.Obrigatorio, System.SysUtils, System.Classes;

procedure register;


implementation


procedure register;
begin
  RegisterComponents('Samples', [TPanelObrigatorio]);
end;


end.
