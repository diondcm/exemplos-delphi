program ClienteRADServer;

uses
  Vcl.Forms,
  Form.Principal.Cliente in 'Form.Principal.Cliente.pas' {frmPrincipalCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalCliente, frmPrincipalCliente);
  Application.Run;
end.
