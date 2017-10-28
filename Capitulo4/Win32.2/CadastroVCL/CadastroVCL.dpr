program CadastroVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Ajuda in 'Form.Ajuda.pas' {frmAjuda},
  Base.Form in '..\Base\Base.Form.pas' {frmBase},
  Base.Form.Ajuda in '..\Base\Base.Form.Ajuda.pas' {frmBaseAjuda},
  Base.Data in '..\Base\Base.Data.pas' {dmdBase: TDataModule},
  Base.Data.Cadastro in '..\Base\Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule},
  Base.Form.Dados in '..\Base\Base.Form.Dados.pas' {frmBaseDados},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Base.Form.Pesquisa in '..\Base\Base.Form.Pesquisa.pas' {frmBasePesquisa},
  Base.Form.Cadastro in '..\Base\Base.Form.Cadastro.pas' {frmBaseCadastro},
  Data.Country in 'Data.Country.pas' {dmdCountry: TDataModule},
  Form.Cadastro.Country in 'Form.Cadastro.Country.pas' {frmCadCountry},
  Form.Pesquisa.Country in 'Form.Pesquisa.Country.pas' {frmPesquisaPaises},
  Classe.DBGrid.Helper in '..\Base\Classe.DBGrid.Helper.pas',
  Data.Cadastro.Vendors in 'Data.Cadastro.Vendors.pas' {dmdCadVendors: TDataModule},
  Form.Cadastro.Vendors in 'Form.Cadastro.Vendors.pas' {frmCadastroVendors},
  Form.Pesquisa.Vendors in 'Form.Pesquisa.Vendors.pas' {frmPesquisaVendors},
  Data.Cadastro.Biolife in 'Data.Cadastro.Biolife.pas' {dmdCadBiolife: TDataModule},
  Form.Cadastro.Biolife in 'Form.Cadastro.Biolife.pas' {frmCadBioLife},
  Form.Pesquisa.Biolife in 'Form.Pesquisa.Biolife.pas' {frmPesquisaBiolife};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
//  TfrmBase.FormAjudaClass := TfrmAjuda.Create(Application);
  TfrmBase.FormAjudaClass := TFrmAjuda;
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdCadVendors, dmdCadVendors);
  Application.CreateForm(TfrmCadastroVendors, frmCadastroVendors);
  Application.CreateForm(TfrmPesquisaVendors, frmPesquisaVendors);
  Application.CreateForm(TdmdCadBiolife, dmdCadBiolife);
  Application.CreateForm(TfrmCadBioLife, frmCadBioLife);
  Application.CreateForm(TfrmPesquisaBiolife, frmPesquisaBiolife);
  Application.Run;
end.
