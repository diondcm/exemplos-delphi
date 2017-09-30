program ConversorMoedaVCL;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  uConversorMoeda in 'uConversorMoeda.pas',
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Form.Historico.Cotacao in 'Form.Historico.Cotacao.pas' {frmHistoricoCotacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TfrmHistoricoCotacao, frmHistoricoCotacao);
  Application.Run;
end.
