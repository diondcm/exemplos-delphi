program TesteHash;

uses
  Vcl.Forms,
  Form.Cliente.Hash in 'Form.Cliente.Hash.pas' {frmHash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHash, frmHash);
  Application.Run;
end.
