program ClientDS2010;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
