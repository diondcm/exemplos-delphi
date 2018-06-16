program ClassHelpers;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmGridHelper},
  Classe.DBGrid.Helper in '..\classes\Classe.DBGrid.Helper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGridHelper, frmGridHelper);
  Application.Run;
end.
