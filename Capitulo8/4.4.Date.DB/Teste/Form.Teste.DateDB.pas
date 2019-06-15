unit Form.Teste.DateDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Classe.DateDB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXPickers;

type
  TfrmTesteDateDB = class(TForm)
    DBEdit1: TDBEdit;
    dtsPessoa: TDataSource;
    dtsPedido: TDataSource;
    memData: TFDMemTable;
    memDatadata_atual: TDateField;
    dtsData: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBDateTimePiker1: TDBDateTimePiker;
    TimePicker1: TTimePicker;
    MonthCalendar1: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTesteDateDB: TfrmTesteDateDB;

implementation

{$R *.dfm}

procedure TfrmTesteDateDB.Button1Click(Sender: TObject);
begin
  ShowMessage('Outro teste');
end;

procedure TfrmTesteDateDB.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

//  DBDateTimePiker1.DataSource := dtsData;
//  DBDateTimePiker1.DataField := 'data_atual';

  memData.Append;
  memData.FieldByName('data_atual').asDateTime := Now - 30;
end;

end.
