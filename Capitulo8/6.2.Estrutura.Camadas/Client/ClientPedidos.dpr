program ClientPedidos;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {Form1},
  Form.Cotacao in 'Form.Cotacao.pas' {frmCotacao},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Form.Clientes in 'Form.Clientes.pas' {frmClientes},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCotacao, frmCotacao);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.Run;
end.
