program CadastroComObjeto;

uses
  Vcl.Forms,
  MidasLib,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro.Pessoa in 'Form.Cadastro.Pessoa.pas' {frmCadastroPessoa},
  Classe.Pessoa in 'Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPessoa, frmCadastroPessoa);
  Application.Run;
end.
