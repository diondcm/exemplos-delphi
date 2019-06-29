unit Classe.Registro;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Classe.ImageViewer, Classe.LateralViewer;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TImageViewer, TLateralViewer]);
end;

end.
