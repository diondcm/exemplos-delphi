unit Geral.Registra.Componentes;

interface

uses
  System.SysUtils, System.Classes, Classe.Panel.Obrigatorio;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CC', [TPanelObrigatorio]);
end;

end.
