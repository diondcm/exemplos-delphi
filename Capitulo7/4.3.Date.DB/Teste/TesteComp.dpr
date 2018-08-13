program TesteComp;

uses
  Vcl.Forms,
  Form.Teste.Principal in 'Form.Teste.Principal.pas' {frmPrincipal},
  Classe.DB.DateEdit in '..\Classe.DB.DateEdit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
