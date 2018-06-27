unit Form.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmClasses = class(TForm)
    memTipoEstoque: TFDMemTable;
    memEstoque: TFDMemTable;
    dtsEstoque: TDataSource;
    DBGrid1: TDBGrid;
    memTipoEstoqueID: TIntegerField;
    memTipoEstoqueDescricao: TStringField;
    memEstoqueID_estoque: TIntegerField;
    memEstoqueDescricao: TStringField;
    memEstoqueID_Tipo: TIntegerField;
    memEstoqueDesc_Tipo_estoque: TStringField;
    procedure FormShow(Sender: TObject);
    procedure memTipoEstoqueAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClasses: TfrmClasses;

implementation

{$R *.dfm}

procedure TfrmClasses.FormShow(Sender: TObject);
begin
  memEstoque.Open;
  memTipoEstoque.Open;

  memEstoque.Append;
  memEstoque.FieldByName('ID_ESTOQUE').AsInteger := 1;
  memEstoque.FieldByName('DESCRICAO').AsString := 'Estoque 1';
  memEstoque.FieldByName('ID_TIPO').AsInteger := 2;
  memEstoque.Post;

  memEstoque.Append;
  memEstoque.FieldByName('ID_ESTOQUE').AsInteger := 2;
  memEstoque.FieldByName('DESCRICAO').AsString := 'Estoque 2';
  memEstoque.FieldByName('ID_TIPO').AsInteger := 4;
  memEstoque.Post;

  memEstoque.Append;
  memEstoque.FieldByName('ID_ESTOQUE').AsInteger := 3;
  memEstoque.FieldByName('DESCRICAO').AsString := 'Estoque 3';
  memEstoque.FieldByName('ID_TIPO').AsInteger := 1;
  memEstoque.Post;
end;

procedure TfrmClasses.memTipoEstoqueAfterOpen(DataSet: TDataSet);
begin
  DataSet.Append;
  DataSet.FieldByName('ID').AsInteger := 1;
  DataSet.FieldByName('DESCRICAO').AsString := 'Estoque Local';
  DataSet.Post;

  DataSet.Append;
  DataSet.FieldByName('ID').AsInteger := 2;
  DataSet.FieldByName('DESCRICAO').AsString:= 'Estoque Virtual';
  DataSet.Post;

  DataSet.Append;
  DataSet.FieldByName('ID').AsInteger := 3;
  DataSet.FieldByName('DESCRICAO').AsString:= 'Estoque Previsto';
  DataSet.Post;

  DataSet.Append;
  DataSet.FieldByName('ID').AsInteger := 4;
  DataSet.FieldByName('DESCRICAO').AsString:= 'Estoque Negativo';
  DataSet.Post;
end;

end.
