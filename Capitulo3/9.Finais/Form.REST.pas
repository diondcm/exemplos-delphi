unit Form.REST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.Json, REST.JSON;

type
  TfrmREST = class(TForm)
    memLog: TMemo;
    btnExecuta: TButton;
    edtURL: TEdit;
    IdHTTP: TIdHTTP;
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmREST: TfrmREST;

implementation

{$R *.dfm}

procedure TfrmREST.btnExecutaClick(Sender: TObject);
var
  lResponse: TStream;
  lRequest: TStream;
begin
  lResponse := TMemoryStream.Create;
  lRequest := TMemoryStream.Create;
  try
    IdHTTP.Get(edtURL.Text, lResponse);
//    lRequest.Write('{ "user": "EU", "pass": "pass crypto"}', SizeOf('{ "user": "EU", "pass": "pass crypto"}'));
//    lRequest.Position := 0;
//    IdHTTP.Post(edtURL.Text, lRequest, lResponse);
    lResponse.Position := 0;
    memLog.Lines.LoadFromStream(lResponse);

// Objeto para json:    memLog.Lines.Text := TJson.ObjectToJsonString(lResponse);
// TJSonObject >> JSon para Object

  finally
    lResponse.Free;
    lRequest.Free;
  end;
end;

end.
