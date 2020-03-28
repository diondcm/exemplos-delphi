program CotacaoVCL;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cotacao.Historico in 'Form.Cotacao.Historico.pas' {frmCotacaoHistorico},
  Data.Cotacao in 'Data.Cotacao.pas' {dmdCotacao: TDataModule},
  ITConversorMoeda1 in 'ITConversorMoeda1.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCotacaoHistorico, frmCotacaoHistorico);
  Application.CreateForm(TdmdCotacao, dmdCotacao);
  Application.Run;
end.
