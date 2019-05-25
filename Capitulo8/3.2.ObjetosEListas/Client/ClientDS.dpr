program ClientDS;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincpial},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  SMGeral in 'SMGeral.pas',
  Classe.Pessoa in '..\Server\Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincpial, frmPrincpial);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
