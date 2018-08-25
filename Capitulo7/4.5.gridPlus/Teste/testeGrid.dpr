program testeGrid;

uses
  Vcl.Forms,
  Form.Principal.Teste in 'Form.Principal.Teste.pas' {frmPrincipal},
  Classe.GridPlus in '..\Classe.GridPlus.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
