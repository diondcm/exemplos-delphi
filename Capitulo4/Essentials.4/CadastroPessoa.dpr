program CadastroPessoa;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Pessoa in 'Data.Pessoa.pas' {dmdPessoa: TDataModule},
  Form.Cadastro.Pessoa in 'Form.Cadastro.Pessoa.pas' {frmCadPessoa},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Form.Cadastro.Classe.Pessoa in 'Form.Cadastro.Classe.Pessoa.pas' {frmCadClassePessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdPessoa, dmdPessoa);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadClassePessoa, frmCadClassePessoa);
  Application.Run;
end.
