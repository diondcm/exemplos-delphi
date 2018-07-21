unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Data.FireDACJSONReflect, FireDAC.Stan.StorageBin, Vcl.DBCtrls, Vcl.StdCtrls, ClientModuleUnit2, FireDAC.Stan.StorageJSON, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart;

type
  TfrmPrincipal = class(TForm)
    dtsClientes: TDataSource;
    memClientes: TFDMemTable;
    timerOpen: TTimer;
    Panel1: TPanel;
    gridClientes: TDBGrid;
    navigatorClientes: TDBNavigator;
    Button1: TButton;
    Splitter1: TSplitter;
    panelCotacao: TPanel;
    memCotacao: TFDMemTable;
    dtsCotacao: TDataSource;
    DBGrid1: TDBGrid;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    Button2: TButton;
    procedure timerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure navigatorClientesClick(Sender: TObject; Button: TNavigateBtn);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure AbrirDataSet;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AbrirDataSet;
var
  lStm: TStringStream;
//var
//  lDataSet: TFDJSONDataSets;
begin
//  lDataSet := ClientModule1.ServerMethods1Client.GetClientes;
//  memClientes.AppendData(TFDJSONDataSetsReader.GetListValue(lDataSet, 0));

  lStm := TStringStream.Create(ClientModule2.MethodsCotacaoClient.GetCotacoes);
  memCotacao.LoadFromStream(lStm, TFDStorageFormat.sfJSON);
  lStm.Free;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  AbrirDataSet;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  memCotacao.SaveToFile('teste.json', sfJSON);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  timerOpen.Enabled := True;
end;

procedure TfrmPrincipal.navigatorClientesClick(Sender: TObject; Button: TNavigateBtn);
var
  lDataset: TFDJSONDeltas;
begin
  case Button of
    nbApplyUpdates:
    begin
//      lDataset := TFDJSONDeltas.Create;
//      TFDJSONDeltasWriter.ListAdd(lDataset, 'CLIENTES', memClientes);
//      ClientModule2.ServerMethods1Client.SetClientes(lDataset);
    end;
  end;
end;

procedure TfrmPrincipal.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  AbrirDataSet;
end;

end.
