program Cadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Sobre.Final in 'Form.Sobre.Final.pas' {frmSobreFinal},
  Base.Form.Sobre in '..\Base\Base.Form.Sobre.pas' {frmBaseSobre},
  Form.Sobre.Herdado in 'Form.Sobre.Herdado.pas' {frmSobreHerdado},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Base.Form.Cadastro in '..\Base\Base.Form.Cadastro.pas' {frmBaseCadastro},
  Base.Form.Pesquisa in '..\Base\Base.Form.Pesquisa.pas' {frmBasePesquisa},
  Base.Data in '..\Base\Base.Data.pas' {dmdBase: TDataModule},
  Base.Data.Cadastro in '..\Base\Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Base.Form.Dados in '..\Base\Base.Form.Dados.pas' {frmBaseDados},
  Data.Categoria in 'Data.Categoria.pas' {dmdCategoria: TDataModule},
  Form.Pesquisa.Categoria in 'Form.Pesquisa.Categoria.pas' {frmPesquisaCategoria},
  Base.Mensagem in '..\Base\Base.Mensagem.pas',
  Form.Cadastro.Categoria in 'Form.Cadastro.Categoria.pas' {frmCadastroCategorias},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadastroProduto},
  Form.Pesquisa.Produto in 'Form.Pesquisa.Produto.pas' {frmPesquisaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
