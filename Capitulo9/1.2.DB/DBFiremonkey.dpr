program DBFiremonkey;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal.Firemonkey in 'Form.Principal.Firemonkey.pas' {frmPrincipal},
  Form.Cadastro.Cliente.FMX in 'Form.Cadastro.Cliente.FMX.pas' {frmCadCliente},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule},
  Form.Cadastro.Produto.FMX in 'Form.Cadastro.Produto.FMX.pas' {frmCadProduto},
  Classe.QrCode in 'Classe.QrCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.CreateForm(TdmdProduto, dmdProduto);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.Run;
end.
