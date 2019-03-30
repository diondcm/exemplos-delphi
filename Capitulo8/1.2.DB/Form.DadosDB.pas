unit Form.DadosDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmDadosDB = class(TForm)
    FDConnection: TFDConnection;
    qryClientes: TFDQuery;
    qryCriaTabelaCliente: TFDQuery;
    qryCriaTabelaImport: TFDQuery;
    PanelSair: TPanel;
    ButtonSair: TButton;
    DBGrid1: TDBGrid;
    dtsLogImportacao: TDataSource;
    qryLogImportacao: TFDQuery;
    PanelImportar: TPanel;
    ButtonImportar: TButton;
    TimerOpen: TTimer;
    cdsClienteImportacao: TClientDataSet;
    EditDescImportacao: TEdit;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    dtsClientes: TDataSource;
    qryClientesID: TFDAutoIncField;
    qryClientesNOME: TWideStringField;
    qryClientesDataNascimento: TDateTimeField;
    qryClientesCPF: TWideStringField;
    qryClientesDataCadastro: TDateTimeField;
    qryClientesCredito: TBCDField;
    qryLogImportacaoID: TFDAutoIncField;
    qryLogImportacaoDATA_IMPORTACAO: TDateTimeField;
    qryLogImportacaoDESCRICAO: TWideStringField;
    qryLogImportacaoQTD_REG_ANTERIOR: TIntegerField;
    qryLogImportacaoQTD_REG_POSTERIOR: TIntegerField;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonImportarClick(Sender: TObject);
    procedure ButtonSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosDB: TfrmDadosDB;

implementation

{$R *.dfm}

procedure TfrmDadosDB.ButtonImportarClick(Sender: TObject);
var
  lQtdAnterior: Integer;
begin
  if cdsClienteImportacao.IsEmpty then
    raise Exception.Create('Sem dados para importar');

  qryClientes.Close;
  qryClientes.Open;
  lQtdAnterior := qryClientes.RecordCount;

  // não: não existe
  //qryClientes.Data := cdsClienteImportacao.Data

  // não: trabalhoso
//  qryClientes.FieldByName('id').AsInteger := cdsClienteImportacao.FieldByName('id').AsInteger;

  qryClientes.CopyDataSet(cdsClienteImportacao, [coAppend]);

  qryLogImportacao.Append;
  qryLogImportacao.FieldByName('descricao').AsString := EditDescImportacao.Text;
  qryLogImportacao.FieldByName('qtd_reg_anterior').AsInteger := lQtdAnterior;
  qryLogImportacao.FieldByName('qtd_reg_posterior').AsInteger := qryClientes.RecordCount;
  qryLogImportacao.Post;
end;

procedure TfrmDadosDB.ButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDadosDB.FDConnectionAfterConnect(Sender: TObject);
begin
  qryCriaTabelaCliente.ExecSQL;
  qryCriaTabelaImport.ExecSQL;
end;

procedure TfrmDadosDB.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['Database'] := ExtractFilePath(ParamStr(0)) + 'dados.db';
end;

procedure TfrmDadosDB.FormShow(Sender: TObject);
begin
//  Sleep(5000);
  TimerOpen.Enabled := True;
end;

procedure TfrmDadosDB.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;
  qryLogImportacao.Open;
  qryClientes.Open;
//  Sleep(5000);
end;

end.
