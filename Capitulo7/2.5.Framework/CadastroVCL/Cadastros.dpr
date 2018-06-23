program Cadastros;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Base.Data.Imagens in '..\Base\Base.Data.Imagens.pas' {dmdImagens: TDataModule},
  Base.Data.Cadastro in '..\Base\Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule},
  Base.Form.Cadastro in '..\Base\Base.Form.Cadastro.pas' {frmBaseCadastro},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Base.Form.Pesquisa in '..\Base\Base.Form.Pesquisa.pas' {frmBasePesquisa},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadastroCliente},
  Form.Pesquisa.Cliente in 'Form.Pesquisa.Cliente.pas' {frmPesquisaCliente},
  Data.Pedido in 'Data.Pedido.pas' {dmdPedido: TDataModule},
  Form.Cadastro.Pedido in 'Form.Cadastro.Pedido.pas' {frmCadastroPedido},
  Form.Pesquisa.Pedido in 'Form.Pesquisa.Pedido.pas' {frmPesquisaPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdImagens, dmdImagens);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  //  Application.CreateForm(TdmdBaseCadastro, dmdBaseCadastro);
  //  Application.CreateForm(TfrmBase, frmBase);
  Application.Run;
end.
