program ExemploML2;

uses
  Vcl.Forms,
  Form.Principal.Test in 'Form.Principal.Test.pas' {frmRegrassao},
  gsl in 'gsl.pas',
  Form.ETL.Exemplo in 'Form.ETL.Exemplo.pas' {frmETLExemplo},
  Form.NNTest in 'Form.NNTest.pas' {frmNNTest},
  data in 'units\data.pas',
  defs in 'units\defs.pas',
  FANN in 'units\FANN.pas',
  FannNetwork in 'units\FannNetwork.pas',
  func in 'units\func.pas',
  Data.Dados in 'Data.Dados.pas' {dmdDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdDados, dmdDados);
  Application.CreateForm(TfrmRegrassao, frmRegrassao);
  Application.CreateForm(TfrmETLExemplo, frmETLExemplo);
  Application.CreateForm(TfrmNNTest, frmNNTest);
  Application.Run;
end.
