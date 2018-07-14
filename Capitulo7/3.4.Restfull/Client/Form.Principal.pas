unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Data.FireDACJSONReflect, ClientModuleUnit1, FireDAC.Stan.StorageBin, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    gridClientes: TDBGrid;
    dtsClientes: TDataSource;
    memClientes: TFDMemTable;
    timerOpen: TTimer;
    navigatorClientes: TDBNavigator;
    Button1: TButton;
    procedure timerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure navigatorClientesClick(Sender: TObject; Button: TNavigateBtn);
    procedure Button1Click(Sender: TObject);
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
  lDataSet: TFDJSONDataSets;
begin
  lDataSet := ClientModule1.ServerMethods1Client.GetClientes;
  memClientes.AppendData(TFDJSONDataSetsReader.GetListValue(lDataSet, 0));
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  AbrirDataSet;
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
      lDataset := TFDJSONDeltas.Create;
      TFDJSONDeltasWriter.ListAdd(lDataset, 'CLIENTES', memClientes);
      ClientModule1.ServerMethods1Client.SetClientes(lDataset);
    end;
  end;
end;

procedure TfrmPrincipal.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  AbrirDataSet;
end;

end.
