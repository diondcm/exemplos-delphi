unit Form.Analise.Dados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base, FMX.Controls.Presentation, FMXTee.Engine, FMXTee.Chart.Functions,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, Data.Cotacao, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, System.DateUtils,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.Controls3D, FMXTee.Chart3D, FMX.TabControl, FMX.DateTimeCtrls, FMX.Layouts;

type
  TfrmAnaliseDados = class(TfrmBase)
    AniIndicator1: TAniIndicator;
    ButtonGetDados: TButton;
    TabControlPrincipal: TTabControl;
    TabLista: TTabItem;
    TabGrafico: TTabItem;
    Chart1: TChart;
    Chart3D1: TChart3D;
    Chart3DChart1: TChart;
    Series1: TLineSeries;
    Series2: TFastLineSeries;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Layout1: TLayout;
    Label1: TLabel;
    DateEditIni: TDateEdit;
    Label2: TLabel;
    DateEditFim: TDateEdit;
    TimerOpen: TTimer;
    procedure ButtonGetDadosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnaliseDados: TfrmAnaliseDados;

implementation

{$R *.fmx}

procedure TfrmAnaliseDados.ButtonGetDadosClick(Sender: TObject);
begin
  BindSourceDB1.DataSource.DataSet := nil; // cuidado em runtime, pois já encontramos bugs
//  BindSourceDB1.DataSource.DataSet.DisableControls; // não fez refresh na tela
  AniIndicator1.Enabled := True;
  dmdCotacao.GetDados(
    DateEditIni.Date,
    DateEditFim.Date,
    procedure
    begin
      AniIndicator1.Enabled := False;
//      BindSourceDB1.DataSource.DataSet.EnableControls;
      BindSourceDB1.DataSource.DataSet := dmdCotacao.memCotacao;
      ShowMessage('Finalizada consulta: ' + dmdCotacao.memCotacao.RecordCount.ToString); // jamais em produção, no máximo utilizar um toast
    end);
//  Series1.DataSources.Add(dmdCotacao.memCotacao);
end;

procedure TfrmAnaliseDados.FormCreate(Sender: TObject);
begin
  inherited;
  TabControlPrincipal.ActiveTab := TabLista;
  DateEditIni.Date :=  UnixToDateTime(1501871369); // '04/08/2017'
  DateEditFim.Date :=  UnixToDateTime(1503360174); // '22/08/2017'
end;

procedure TfrmAnaliseDados.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmAnaliseDados.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  dmdCotacao.CarregaCache;
end;

end.
