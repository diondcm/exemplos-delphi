program EmailSerealizador;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Classe.Email in 'Classe.Email.pas',
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Form.Multi.Tabelas in 'Form.Multi.Tabelas.pas' {frmMultiTabelas},
  Classe.Helper.DataSet in '..\Win32.4\Classe.Helper.DataSet.pas',
  Classe.Atributo.Campo in 'Classe.Atributo.Campo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMultiTabelas, frmMultiTabelas);
  Application.Run;
end.
