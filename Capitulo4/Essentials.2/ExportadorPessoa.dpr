program ExportadorPessoa;

uses
  Vcl.Forms,
  Form.Consulta.Pessoa in 'Form.Consulta.Pessoa.pas' {frmConsultaPessoa},
  Form.Cadastro.Pessoa in 'Form.Cadastro.Pessoa.pas' {frmCadastroPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConsultaPessoa, frmConsultaPessoa);
  Application.CreateForm(TfrmCadastroPessoa, frmCadastroPessoa);
  Application.Run;
end.
