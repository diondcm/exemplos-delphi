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
  Base.Form.Cadastro in '..\Base\Base.Form.Cadastro.pas' {frmBaseCadastro};

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
  Application.Run;
end.
