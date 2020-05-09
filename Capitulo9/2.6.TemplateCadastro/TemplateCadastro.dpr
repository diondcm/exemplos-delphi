program TemplateCadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Data.Base in 'Data.Base.pas' {dmdBase: TDataModule},
  Form.Base.Cadastro in 'Form.Base.Cadastro.pas' {frmBaseCadastro},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadastroCliente},
  Data.Imagens in 'Data.Imagens.pas' {dmdImagens: TDataModule},
  Classe.Mensagem in '..\2.3.MensagemEPerformance\Classe.Mensagem.pas',
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadProduto},
  Data.Pedido in 'Data.Pedido.pas' {dmdPedido: TDataModule},
  Form.Cadastro.Pedido in 'Form.Cadastro.Pedido.pas' {frmCadPedido},
  Form.Pesquisa in 'Form.Pesquisa.pas' {frmPesquisa},
  Form.Cadastro.Item in 'Form.Cadastro.Item.pas' {frmCadItem},
  Classe.Grid.Helper in 'Classe.Grid.Helper.pas',
  Classe.Strings.Helper in 'Classe.Strings.Helper.pas',
  Classe.Pessoa in '..\2.1.OO\Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdImagens, dmdImagens);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
