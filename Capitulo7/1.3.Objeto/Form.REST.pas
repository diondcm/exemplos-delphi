unit Form.REST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid, Data.Bind.DBScope,
  Data.Bind.Controls, Vcl.Buttons, Vcl.Bind.Navigator, System.DateUtils;

type
  TfrmREST = class(TForm)
    memoLog: TMemo;
    panelControle: TPanel;
    StringGrid1: TStringGrid;
    buttonCarregaInfos: TButton;
    Splitter1: TSplitter;
    IdHTTP: TIdHTTP;
    buttonCarregaGrid: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    memDados: TFDMemTable;
    memDadosdateAt: TStringField;
    memDadosvalue: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    memDadosData: TDateTimeField;
    memDadosValor: TIntegerField;
    procedure buttonCarregaInfosClick(Sender: TObject);
    procedure buttonCarregaGridClick(Sender: TObject);
    procedure memDadosCalcFields(DataSet: TDataSet);
    procedure panelControleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREST: TfrmREST;

implementation

{$R *.dfm}

//uses
//  Form.Principal;

type
  TClasse2 = class

  end;



procedure TfrmREST.buttonCarregaGridClick(Sender: TObject);
begin
  RESTClient1.BaseURL := 'http://www.webservicex.net/price/MSNUM';
  RESTRequest1.Execute;
  if not memDados.IsEmpty then
  begin
    Caption := memDados.RecordCount.ToString;
  end;
end;

procedure TfrmREST.buttonCarregaInfosClick(Sender: TObject);
var
  lStm: TStringStream;
begin
  lStm := TStringStream.Create;
  try
    IdHTTP.Get('http://www.webservicex.net/price/MSNUM', lStm);
//    lStm.Seek(0, soFromBeginning);
    lStm.Position := 0;
    memoLog.Text := lStm.DataString;
  finally
    lStm.Free;
  end;
end;

procedure TfrmREST.memDadosCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Data').AsDateTime := ISO8601ToDate(DataSet.FieldByName('dateAt').AsString);
  DataSet.FieldByName('Valor').AsInteger := StrToIntDef(DataSet.FieldByName('value').AsString, 0);
end;

procedure TfrmREST.panelControleClick(Sender: TObject);
begin
//  FDMemTable1.OnCalcFields := memDados.OnCalcFields;
  //FDMemTable1.Data := memDados.Data;
//  FDMemTable1.CopyDataSet(memDados, [coStructure, coCalcFields, coAppend]);
end;

end.
