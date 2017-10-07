unit Form.Chat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Data.DB, Data.SqlExpr, Data.DBXDataSnap,
  Data.DBXCommon, Data.DbxHTTPLayer, Datasnap.DSCommon, Datasnap.DSProxy,
  System.JSON, Data.DBXJSON;

type
  TCallBackClient = class(TDBXCallBack)
  public
    function Execute(const Arg: TJSONValue): TJSONValue; override;
  end;

  TfrmChat = class(TForm)
    lsvLog: TListView;
    pnlTexto: TPanel;
    edtTexto: TButtonedEdit;
    ImageList1: TImageList;
    SQLConnection: TSQLConnection;
    DSClientCallbackChannelManager: TDSClientCallbackChannelManager;
    procedure edtTextoRightButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lsvLogColumnClick(Sender: TObject; Column: TListColumn);
    procedure lsvLogCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
  private
    FSortedColumn: Integer;
    FDescending: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChat: TfrmChat;

implementation

{$R *.dfm}

procedure TfrmChat.edtTextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    edtTextoRightButtonClick(Sender);
  end;
end;

procedure TfrmChat.edtTextoRightButtonClick(Sender: TObject);
var
  lDsAdmin: TDSAdminClient;
begin
  SQLConnection.Open;
  lDsAdmin := TDSAdminClient.Create(SQLConnection.DBXConnection);
  try
    lDsAdmin.BroadcastToChannel(DSClientCallbackChannelManager.ChannelName,
      TJsonString.Create(edtTexto.Text));
    edtTexto.Text := '';
  finally
    lDsAdmin.Free;
  end;
end;

{ TCallBackClient }

function TCallBackClient.Execute(const Arg: TJSONValue): TJSONValue;
var
  lMsg: string;
begin
  lMsg := Arg.Value;

  TThread.Queue(nil,
    procedure
    var
      lItem: TListItem;
    begin
      lItem := frmChat.lsvLog.Items.Add;
      lItem.Caption := TimeToStr(Now);
      lItem.SubItems.Add(lMsg);
    end);

  Result := TJSONTrue.Create;
end;

procedure TfrmChat.FormCreate(Sender: TObject);
begin
  DSClientCallbackChannelManager.ManagerId :=
    TDSSessionHelper.GenerateSessionId;

  DSClientCallbackChannelManager.RegisterCallback(
    TDSSessionHelper.GenerateSessionId, TCallBackClient.Create);
end;

procedure TfrmChat.lsvLogColumnClick(Sender: TObject; Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FSortedColumn then
  begin
    FSortedColumn := Column.Index;
    FDescending := False;
  end else
    FDescending := not FDescending;

  TListView(Sender).SortType := stText;
end;

procedure TfrmChat.lsvLogCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  if FSortedColumn = 0 then
  begin
    Compare := CompareText(Item1.Caption, Item2.Caption)
  end else if FSortedColumn <> 0 then
  begin
    Compare := CompareText(Item1.SubItems[FSortedColumn-1],
      Item2.SubItems[FSortedColumn-1]);
  end;

  if FDescending then
  begin
    Compare := -Compare;
  end;
end;

end.
