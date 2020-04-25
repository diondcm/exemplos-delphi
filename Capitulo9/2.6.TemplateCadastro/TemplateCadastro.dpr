program TemplateCadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Data.Base in 'Data.Base.pas' {dmdBase: TDataModule},
  Form.Base.Cadastro in 'Form.Base.Cadastro.pas' {frmBaseCadastro},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.Run;
end.
