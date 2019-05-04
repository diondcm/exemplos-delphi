program TempleteCadastro;

uses
  Vcl.Forms,
  Midaslib,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadCliente},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Data.Imagens in 'Data.Imagens.pas' {dmdImanges: TDataModule},
  Data.Base in 'Data.Base.pas' {dmdBase: TDataModule},
  Form.Base.Cadastro in 'Form.Base.Cadastro.pas' {frmCadBase},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadProduto},
  Data.Pedido in 'Data.Pedido.pas' {dmdPedido: TDataModule},
  Form.Cadastro.Pedido in 'Form.Cadastro.Pedido.pas' {frmCadPedido},
  Form.Cadastro.Item in 'Form.Cadastro.Item.pas' {frmCadItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.CreateForm(TdmdImanges, dmdImanges);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TdmdProduto, dmdProduto);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.CreateForm(TdmdPedido, dmdPedido);
  Application.CreateForm(TfrmCadPedido, frmCadPedido);
  Application.CreateForm(TfrmCadItem, frmCadItem);
  Application.Run;
end.
