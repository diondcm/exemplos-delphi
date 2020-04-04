program DBVCL;

uses
  Vcl.Forms,
  Form.Principal.VCL in 'Form.Principal.VCL.pas' {frmPrincipalVCL},
  Form.Cadastro.Cliente.VCL in 'Form.Cadastro.Cliente.VCL.pas' {frmCadClienteVCL},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Cadastro.Produto.VCL in 'Form.Cadastro.Produto.VCL.pas' {frmCadProduto},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalVCL, frmPrincipalVCL);
  Application.CreateForm(TfrmCadClienteVCL, frmCadClienteVCL);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TdmdProduto, dmdProduto);
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.Run;
end.
