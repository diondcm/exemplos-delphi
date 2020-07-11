program RelGrupos;

uses
  Vcl.Forms,
  Form.Selecao.Relatorio in 'Form.Selecao.Relatorio.pas' {frmSelcaoRelatorio},
  Vcl.Themes,
  Vcl.Styles,
  Data.Relatorios in 'Data.Relatorios.pas' {dmdRelatorios: TDataModule},
  Form.Visualiza.Dados in 'Form.Visualiza.Dados.pas' {frmVisualizaDados},
  Form.Filtros in 'Form.Filtros.pas' {frmFiltros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TfrmSelcaoRelatorio, frmSelcaoRelatorio);
  Application.CreateForm(TdmdRelatorios, dmdRelatorios);
  Application.CreateForm(TfrmVisualizaDados, frmVisualizaDados);
  Application.CreateForm(TfrmFiltros, frmFiltros);
  Application.Run;
end.
