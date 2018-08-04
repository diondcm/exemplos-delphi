program TestesComps;

uses
  Vcl.Forms,
  Form.Principal.Testes in 'Form.Principal.Testes.pas' {frmPrincipalTestes},
  Classe.Panel.Obrigatorio in '..\Classe.Panel.Obrigatorio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalTestes, frmPrincipalTestes);
  Application.Run;
end.
