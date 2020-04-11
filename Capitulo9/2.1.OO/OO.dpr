program OO;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Visualiza.Pessoa in 'Form.Visualiza.Pessoa.pas' {frmVisualizaPessoa},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Data.Pessoa in 'Data.Pessoa.pas' {dmdPessoa: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmVisualizaPessoa, frmVisualizaPessoa);
  Application.CreateForm(TdmdPessoa, dmdPessoa);
  Application.Run;
end.
