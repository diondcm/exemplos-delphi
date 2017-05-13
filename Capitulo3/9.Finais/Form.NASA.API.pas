unit Form.NASA.API;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, System.DateUtils, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, JPEG, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.DBScope, Vcl.Grids, Vcl.DBGrids, System.Threading;

type
// Based in:
// https://github.com/EmbarcaderoPublic/FunWithRADStudio/
  TfrmNASAAPI = class(TForm)
    ImageList1: TImageList;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    DataSource1: TDataSource;
    fmtJSON: TFDMemTable;
    NetHTTPClient1: TNetHTTPClient;
    fmtJSONcopyright: TStringField;
    fmtJSONdate: TStringField;
    fmtJSONexplanation: TStringField;
    fmtJSONhdurl: TStringField;
    fmtJSONmedia_type: TStringField;
    fmtJSONservice_version: TStringField;
    fmtJSONtitle: TStringField;
    fmtJSONurl: TStringField;
    Panel1: TPanel;
    Image1: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    Label1: TLabel;
    lblAPIKey: TLinkLabel;
    edtURL: TButtonedEdit;
    LinkControlToField1: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
  private const
    API_KEY = 'DEMO_KEY';
    URL = 'https://api.nasa.gov/planetary/apod?api_key=%s';
  private
    FURLBase: string;
    FDate: string;

    procedure GetImagem;
  public
    { Public declarations }
  end;

var
  frmNASAAPI: TfrmNASAAPI;

implementation

{$R *.dfm}

procedure TfrmNASAAPI.FormCreate(Sender: TObject);
begin
  FURLBase := Format(URL, [API_KEY]);
end;

procedure TfrmNASAAPI.GetImagem;
var
  lURL: string;
  lRespose: TMemoryStream;
  lJpg: TJPEGImage;
begin
  lURL := FURLBase;
  if FDate <> '' then
  begin
    lURL := FURlBase + '&date=' + FDate;
  end;

  ITask(
    TTask.Create(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          begin
            RESTClient1.BaseURL := lURL;
            RESTRequest1.Execute;
            lRespose := TMemoryStream.Create;
            try
              if fmtJSONurl.AsString <> '' then
              begin
                NetHTTPClient1.Get(fmtJSONurl.AsString, lRespose);
                lRespose.Position := 0;
                lJpg := TJPEGImage.Create;
                try
                  lJpg.LoadFromStream(lRespose);
                  Image1.Picture.Assign(lJpg);
                finally
                  lJpg.Free;
                end;
              end;
            finally
              lRespose.Free;
            end;
          end);
      end)).Start;
end;

procedure TfrmNASAAPI.MonthCalendar1Click(Sender: TObject);
var
  lFormatTemp: string;
begin
  if DateOf(MonthCalendar1.Date) <= DateOf(Now()) then
  begin
    lFormatTemp := FormatSettings.ShortDateFormat;
    try
      FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
      FDate := DateToStr(MonthCalendar1.Date, FormatSettings);
      GetImagem;
    finally
      FormatSettings.ShortDateFormat := lFormatTemp;
    end;
  end else begin
    raise Exception.Create('Data não pode ser maior que a atual.');
  end;
end;

end.
