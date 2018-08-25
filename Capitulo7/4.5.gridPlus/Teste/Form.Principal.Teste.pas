unit Form.Principal.Teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Classe.GridPlus, Datasnap.DBClient, DateUtils;

type
  TfrmPrincipal = class(TForm)
    navDados: TDBNavigator;
    memDados: TFDMemTable;
    memDadosCodigo: TIntegerField;
    memDadosDescricao: TStringField;
    memDadosDataCadastro: TDateField;
    dtsDados: TDataSource;
    memDadosTempoCadastro: TIntegerField;
    procedure memDadosAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure memDadosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  memDados.Open;
end;

procedure TfrmPrincipal.memDadosAfterOpen(DataSet: TDataSet);
begin
  if DataSet.isEmpty then
  begin
    DataSet.Append;
    DataSet.FieldByName('Codigo').AsInteger := GetTickCount;
    DataSet.FieldByName('Descricao').AsString := 'Teste';
    DataSet.FieldByName('DataCadastro').AsDateTime := Now;
    DataSet.Post;

    DataSet.Append;
    DataSet.FieldByName('Codigo').AsInteger := GetTickCount;
    DataSet.FieldByName('Descricao').AsString := 'Teste 2';
    DataSet.FieldByName('DataCadastro').AsDateTime := Now;
    DataSet.Post;

    DataSet.Append;
    DataSet.FieldByName('Codigo').AsInteger := GetTickCount;
    DataSet.FieldByName('Descricao').AsString := 'Teste 3 Teste 3 Teste 3';
    DataSet.FieldByName('DataCadastro').AsDateTime := Now;
    DataSet.Post;
  end;

  GridPlus1.DataSource := dtsDados;
  GridPlus1.Align := alClient;
  GridPlus1.AjustaColunas;
end;

procedure TfrmPrincipal.memDadosCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('tempoCadastro').AsInteger := MilliSecondsBetween(Now, DataSet.FieldByName('datacadastro').AsDateTime);
end;

end.
