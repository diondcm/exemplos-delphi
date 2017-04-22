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
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSobreFinal, frmSobreFinal);
  Application.CreateForm(TfrmBaseCadastro, frmBaseCadastro);
  Application.CreateForm(TfrmBasePesquisa, frmBasePesquisa);
  Application.CreateForm(TdmdBase, dmdBase);
  Application.CreateForm(TdmdConexao, dmdConexao);
  //  Application.CreateForm(TdmdBaseCadastro, dmdBaseCadastro);
  //  Application.CreateForm(TfrmBase, frmBase);
  //  Application.CreateForm(TfrmBaseSobre, frmBaseSobre);
  Application.CreateForm(TfrmSobreHerdado, frmSobreHerdado);
  Application.Run;
end.
