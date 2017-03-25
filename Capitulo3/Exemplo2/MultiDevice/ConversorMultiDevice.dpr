program ConversorMultiDevice;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {Form4},
  Classe.Converte.Unidades in '..\Classe.Converte.Unidades.pas',
  ClientClassesUnit1 in '..\ClientClassesUnit1.pas',
  ClientModuleUnit1 in '..\ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
