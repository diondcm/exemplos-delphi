unit Classe.Register;

interface

uses Classe.DateDB, Classe.Editor.Propriedades, Vcl.DBGrids;
  { OTA: Open Tools API, cnPack, GeXpertss }

  procedure register;

implementation

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, Vcl.Controls, DesignIntf;

procedure register;
begin
  RegisterComponents('Samples', [TDBDateTimePiker]);
  RegisterPropertyEditor(TypeInfo(string), TDBDateTimePiker, 'Sobre', TShowAbout);
  RegisterComponentEditor(TDBDateTimePiker, TEditoMenu);
  RegisterComponentEditor(TDBGrid, TEditoMenu);
end;

end.
