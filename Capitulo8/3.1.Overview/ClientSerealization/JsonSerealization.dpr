program JsonSerealization;

uses
  Vcl.Forms,
  Form.Principal.Json in 'Form.Principal.Json.pas' {frmPrincipalJson},
  Classe.Pessoa in '..\shared\Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalJson, frmPrincipalJson);
  Application.Run;
end.
