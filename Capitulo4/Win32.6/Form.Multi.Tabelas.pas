unit Form.Multi.Tabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Conexao,
  FireDAC.Stan.StorageXML, System.IOUtils, Classe.Helper.DataSet;

type
  TfrmMultiTabelas = class(TForm)
    panelOrders: TPanel;
    labelOrders: TLabel;
    dtsOrders: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    panelItems: TPanel;
    Label1: TLabel;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    dtsItems: TDataSource;
    qryOrders: TFDQuery;
    qryItems: TFDQuery;
    memOrders: TFDMemTable;
    memItems: TFDMemTable;
    panelXML: TPanel;
    panelControlesXML: TPanel;
    checkImportador: TCheckBox;
    gridOrdersXML: TDBGrid;
    Splitter1: TSplitter;
    gridItemsXML: TDBGrid;
    dtsOrdersXML: TDataSource;
    dtsItemsXML: TDataSource;
    buttomCarregaXML: TButton;
    OpenDialog: TOpenDialog;
    buttomEnviaOrdem: TButton;
    checkLiberaCommit: TCheckBox;
    timerImport: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure buttomCarregaXMLClick(Sender: TObject);
    procedure buttomEnviaOrdemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerImportTimer(Sender: TObject);
    procedure checkImportadorClick(Sender: TObject);
  private
    procedure EnviarOrdem;
  public
    { Public declarations }
  end;

var
  frmMultiTabelas: TfrmMultiTabelas;

implementation

{$R *.dfm}

procedure TfrmMultiTabelas.buttomCarregaXMLClick(Sender: TObject);
var
  lFileName: string;
begin
  memOrders.Close;
  memItems.Close;

  lFileName := 'C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\orders.xml';
  if (not TFile.Exists(lFileName)) and OpenDialog.Execute then
    lFileName := OpenDialog.FileName;

  if TFile.Exists(lFileName) then
  begin
    memOrders.LoadFromFile(lFileName);
    memItems.LoadFromFile(ExtractFilePath(lFileName) + 'items.xml');
  end;
end;

procedure TfrmMultiTabelas.buttomEnviaOrdemClick(Sender: TObject);
begin
  EnviarOrdem;
end;

procedure TfrmMultiTabelas.checkImportadorClick(Sender: TObject);
begin
  timerImport.Enabled := checkImportador.Checked;
end;

procedure TfrmMultiTabelas.EnviarOrdem;
var
  i: Integer;
begin
  if not memOrders.IsEmpty then
  begin
    qryOrders.Connection.StartTransaction;
    try
      qryOrders.Append;
      for i := 0 to qryOrders.FieldCount - 1 do
      begin
        qryOrders.Fields[i].Value := memOrders.FieldByName(qryOrders.Fields[i].FieldName).Value;
      end;
      qryOrders.Post;

      memItems.ForEach(
        procedure (pDataset: TDataSet)
        var
          j: Integer;
        begin
          qryItems.Append;
          for j := 0 to qryItems.FieldCount - 1 do
          begin
            qryItems.Fields[j].Value := memItems.FieldByName(qryItems.Fields[j].FieldName).Value;
          end;
          qryItems.Post;
        end);

      while not checkLiberaCommit.Checked do
      begin
        Sleep(50);
        Caption := 'Aguradando para commit ' + TimeToStr(Now);
        Application.ProcessMessages;
      end;

      qryOrders.Connection.Commit;
      Caption := 'Commit Executado';
    except
      on E: Exception do
      begin
        qryOrders.Connection.Rollback;
        Caption := 'Rollback';
        raise;
      end;
    end;

    memOrders.Next;
  end;
end;

procedure TfrmMultiTabelas.FormActivate(Sender: TObject);
begin
  qryOrders.Open;
  qryItems.Open;
end;

procedure TfrmMultiTabelas.FormShow(Sender: TObject);
begin
{$IFDEF DEBUG}
  buttomCarregaXML.Click;
{$ENDIF}
end;

procedure TfrmMultiTabelas.timerImportTimer(Sender: TObject);
begin
  timerImport.Enabled := False;
  EnviarOrdem;
  timerImport.Enabled := True;
end;

end.
