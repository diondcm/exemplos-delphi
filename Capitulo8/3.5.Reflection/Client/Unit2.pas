unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClientModuleUnit1, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Data.FireDACJSONReflect, FireDAC.Stan.StorageBin, Vcl.DBCtrls, ClasseStatus;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dtsPessoa: TDataSource;
    memProduto: TFDMemTable;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    dtsProduto: TDataSource;
    memPessoa: TFDMemTable;
    Button1: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lList: TFDJSONDataSets;
begin
  lList := ClientModule1.ServerMethods1Client.GetDados;

  memPessoa.Close;
  memPessoa.AppendData(TFDJSONDataSetsReader.GetListValueByName(lList, 'Pessoa'));
  memPessoa.First;

  memProduto.Close;
  memProduto.AppendData(TFDJSONDataSetsReader.GetListValueByName(lList, 'Produto'));
  memProduto.First;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  lList: TFDJSONDataSets;
  lResultado: TStatus;
begin
  lList := TFDJSONDataSets.Create;

  memPessoa.StatusFilter := [rtModified, rtInserted, rtDeleted];
  memProduto.StatusFilter := [rtModified, rtInserted, rtDeleted];

  TFDJSONDataSetsWriter.ListAdd(lList, 'Pessoa', memPessoa);
  TFDJSONDataSetsWriter.ListAdd(lList, 'Produto', memProduto);

  lResultado := ClientModule1.ServerMethods1Client.SetDados(lList);

  if lResultado.Erro <> '' then
  begin
    raise Exception.Create(lResultado.Msg + sLineBreak + lResultado.Erro);
  end else if lResultado.Persistido then
  begin
    ShowMessage(lResultado.Msg);
  end else if lResultado.Msg <> '' then
  begin
    ShowMessage(lResultado.Msg);
  end;

  memPessoa.StatusFilter := [];
  memProduto.StatusFilter := [];
end;

end.
