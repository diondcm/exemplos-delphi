unit Form.JSONFromRest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.JSON, System.JSON.Readers, System.JSON.Types,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo, IPPeerClient, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, REST.Client, Data.Bind.ObjectScope, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, FMX.Layouts, FMX.Grid.Style, FMX.Grid,
  FMX.TabControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmJSONFromRest = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    buttonGetJSON: TButton;
    IdHTTP: TIdHTTP;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    BindingsList1: TBindingsList;
    SwitchID: TSwitch;
    labelTipoClient: TLabel;
    labelTipos: TLabel;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    Layout1: TLayout;
    buttonCarregaJSON: TButton;
    TabControl: TTabControl;
    tabMemo: TTabItem;
    tabGrid: TTabItem;
    memoJSON: TMemo;
    Grid1: TGrid;
    LinkControlToField1: TLinkControlToField;
    memDados: TFDMemTable;
    BindSourceDB: TBindSourceDB;
    procedure buttonVoltarClick(Sender: TObject);
    procedure buttonGetJSONClick(Sender: TObject);
    procedure buttonCarregaJSONClick(Sender: TObject);
  private
    class var
      FInstance: TfrmJSONFromRest;
  public
    class function GetInstance: TfrmJSONFromRest;
  end;

implementation

{$R *.fmx}

{ TfrmJSONFromRest }

procedure TfrmJSONFromRest.buttonCarregaJSONClick(Sender: TObject);
var
  lSR: TStringReader;
  lTextJson: TJsonTextReader;
  lJson: string;
begin
  if memoJSON.Text <> '' then
  begin
    lSR := TStringReader.Create('{"result": ' +  memoJSON.Text + '}');
    lTextJson := TJsonTextReader.Create(lSR);

    while lTextJson.Read do
    begin
      case lTextJson.TokenType of
        TJsonToken.PropertyName:
          lJson := lJson + sLineBreak + lTextJson.Value.AsString;

        TJsonToken.String:
          lJson := lJson + ' = ' + lTextJson.Value.AsString;

        TJsonToken.Integer:
          lJson := lJson + ' = ' + lTextJson.Value.AsInteger.ToString;
      end;
    end;

    ShowMessage(lJson);

    lTextJson.Free;
    lSR.Free;
  end;

end;

procedure TfrmJSONFromRest.buttonGetJSONClick(Sender: TObject);
var
  lSStm: TStringStream;
begin
  if SwitchID.IsChecked then
  begin
    lSStm := TStringStream.Create;
    try
      IdHTTP.Get('https://jsonplaceholder.typicode.com/posts', lSStm);
      lSStm.Position := 0;
      memoJSON.Text := lSStm.DataString;
    finally
      lSStm.Free;
    end;
  end else begin
    RESTClient.BaseURL := 'https://jsonplaceholder.typicode.com/posts';
    if Assigned(RESTRequest.Params.ParameterByName('userId')) then
    begin
      RESTRequest.Params.ParameterByName('userId').Value := '1';
    end;
    RESTRequest.Execute;
  end;
end;

procedure TfrmJSONFromRest.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

class function TfrmJSONFromRest.GetInstance: TfrmJSONFromRest;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmJSONFromRest.Create(Application);
  end;

  Result := FInstance;
end;

end.
