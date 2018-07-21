program TesteHash;

uses
  Vcl.Forms,
  Form.Cliente.Hash in 'Form.Cliente.Hash.pas' {frmHash},
  Classe.Cotacao in 'Classe.Cotacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHash, frmHash);
  Application.Run;
end.
