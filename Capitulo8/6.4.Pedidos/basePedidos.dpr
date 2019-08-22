program basePedidos;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Base in 'Form.Base.pas' {frmBase},
  Form.Analise.Dados in 'Form.Analise.Dados.pas' {frmAnaliseDados},
  Data.Cotacao in 'Data.Cotacao.pas' {dmdCotacao: TDataModule},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAnaliseDados, frmAnaliseDados);
  Application.CreateForm(TdmdCotacao, dmdCotacao);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.Run;
end.
