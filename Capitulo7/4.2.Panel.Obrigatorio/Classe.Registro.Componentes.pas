unit Classe.Registro.Componentes;

interface

  procedure register;

implementation


uses
  System.Sysutils,  System.Classes, Vcl.StdCtrls,
  Vcl.Controls, Classe.Panel.Obrigatorio;

procedure register;
begin
  RegisterComponents('PaletaTestes', [TPanelObrigatorio]);
end;


end.
