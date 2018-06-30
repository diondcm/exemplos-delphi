program ProjetoExemplo;



uses
  Vcl.Forms,
  Form.Exemplo in 'Form.Exemplo.pas' {frmExemplo},
  Classe.Remote.Debug in '..\Classe.Remote.Debug.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmExemplo, frmExemplo);
  Application.Run;
end.
