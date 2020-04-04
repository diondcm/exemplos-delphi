program DBFiremonkey;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Firemonkey in 'Form.Principal.Firemonkey.pas' {frmPrincipal},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadCliente},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.Run;
end.
