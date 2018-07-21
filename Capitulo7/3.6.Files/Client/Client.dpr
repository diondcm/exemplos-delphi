program Client;

uses
  Vcl.Forms,
  Form.Principal.Client in 'Form.Principal.Client.pas' {frmPrincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Classe.Pessoa in '..\Classes\Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
