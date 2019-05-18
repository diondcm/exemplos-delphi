program TesteCargaSimples;

uses
  Vcl.Forms,
  Form.Principal.Client in 'Form.Principal.Client.pas' {frmTesteCargaPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTesteCargaPrincipal, frmTesteCargaPrincipal);
  Application.Run;
end.
