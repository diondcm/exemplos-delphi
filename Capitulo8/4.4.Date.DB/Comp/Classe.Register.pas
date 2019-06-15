unit Classe.Register;

interface

uses Classe.DateDB;

  procedure register;

implementation

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.Controls{, DesignIntf};

procedure register;
begin
  RegisterComponents('Samples', [TDBDateTimePiker]);
end;

end.
