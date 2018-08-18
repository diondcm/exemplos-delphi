unit Geral.Registro;

interface

uses ToolsAPI, Classe.AutoSave.OTA;

  procedure register;

implementation


procedure register;
begin
  TAutoSaveWizard.WizardIndex := (BorlandIDEServices as IOTAWizardServices).AddWizard(InitialiseWizard(BorlandIDEServices));
end;

end.
