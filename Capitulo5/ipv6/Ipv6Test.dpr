program Ipv6Test;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Test.Ipv6 in 'Form.Test.Ipv6.pas' {Form1},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
