program CotacaoVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cotacao.Historico in 'Form.Cotacao.Historico.pas' {frmCotacaoHistorico},
  Data.Cotacao in 'Data.Cotacao.pas' {dmdCotacao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCotacaoHistorico, frmCotacaoHistorico);
  Application.CreateForm(TdmdCotacao, dmdCotacao);
  Application.Run;
end.
