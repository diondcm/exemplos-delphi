program StartMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Mobile in 'Form.Principal.Mobile.pas' {Form2},
  Classe.Conversor in 'Classe.Conversor.pas',
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
