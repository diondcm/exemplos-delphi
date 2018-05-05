program CadastroComObjeto;

uses
  Vcl.Forms,
  MidasLib,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro.Pessoa in 'Form.Cadastro.Pessoa.pas' {frmCadastroPessoa},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Form.REST in 'Form.REST.pas' {frmREST};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPessoa, frmCadastroPessoa);
  Application.CreateForm(TfrmREST, frmREST);
  Application.Run;
end.
