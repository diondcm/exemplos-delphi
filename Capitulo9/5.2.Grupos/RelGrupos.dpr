program RelGrupos;

uses
  Vcl.Forms,
  Form.Selecao.Relatorio in 'Form.Selecao.Relatorio.pas' {frmSelcaoRelatorio},
  Vcl.Themes,
  Vcl.Styles,
  Data.Relatorios in 'Data.Relatorios.pas' {dmdRelatorios: TDataModule},
  Form.Visualiza.Dados in 'Form.Visualiza.Dados.pas' {frmVisualizaDados},
  Form.Filtros in 'Form.Filtros.pas' {frmFiltros},
  Data.Master.Detail.Detail in 'Data.Master.Detail.Detail.pas' {dmdMasterDetailDetail: TDataModule},
  Data.Connection in 'Data.Connection.pas' {dmdConnection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TdmdConnection, dmdConnection);
  Application.CreateForm(TfrmSelcaoRelatorio, frmSelcaoRelatorio);
  Application.CreateForm(TdmdRelatorios, dmdRelatorios);
  Application.CreateForm(TfrmVisualizaDados, frmVisualizaDados);
  Application.CreateForm(TfrmFiltros, frmFiltros);
  Application.CreateForm(TdmdMasterDetailDetail, dmdMasterDetailDetail);
  Application.Run;
end.
