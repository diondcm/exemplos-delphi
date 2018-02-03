unit Form.RESTGetImage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.Threading,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.DialogService, FMX.DialogS, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, FMX.Layouts, FMX.Edit, FMX.ScrollBox, FMX.Memo,
  FMX.TabControl, IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter;

type
  TfrmRESTGetImage = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    TimerLoad: TTimer;
    IdHTTP: TIdHTTP;
    LayoutData: TLayout;
    labelImagem: TLabel;
    editKey: TEdit;
    TabControl: TTabControl;
    TabImagem: TTabItem;
    image: TImage;
    TabJson: TTabItem;
    MemoJson: TMemo;
    buttonGo: TButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    NetHTTPClient: TNetHTTPClient;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    memDallyImage: TFDMemTable;
    memDallyImagetitle: TStringField;
    memDallyImageurl: TStringField;
    memDallyImagedate: TStringField;
    procedure buttonVoltarClick(Sender: TObject);
    procedure TimerLoadTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buttonGoClick(Sender: TObject);
  private
    FImageLoaded: Boolean;
    FURLComKey: string;
    procedure CarregarImagem(const pURL: string);
  private
      class var
      FInstance: TfrmRESTGetImage;
  private const
    URL_NASA = 'https://api.nasa.gov/planetary/apod?api_key=';
  public
    class function GetInstance: TfrmRESTGetImage;
  end;

implementation

{$R *.fmx}

procedure TfrmRESTGetImage.buttonGoClick(Sender: TObject);
var
  lMS: TMemoryStream;
begin
  if editKey.Text <> '' then
  begin
    FURLComKey := URL_NASA + editKey.Text;
    RESTClient.BaseURL := FURLComKey;
    try
      RESTRequest.Execute;
    except
      on E: Exception do
      begin
        TDialogService.ShowMessage('Erro ao acessar a API da NASA.' + sLineBreak + 'Erro: ' + E.QualifiedClassName + ' - ' + E.Message);
      end;
    end;

    if (not (memDallyImage.IsEmpty)) and (not (memDallyImage.FieldByName('url').AsString = '')) then
    begin
      lMS := TMemoryStream.Create;
      try
        NetHTTPClient.Get(memDallyImage.FieldByName('url').AsString, lMS);
        image.Bitmap.LoadFromStream(lMS);
      except
        on E: Exception do
        begin
          TDialogService.ShowMessage('Erro ao acessar Imagem.' + sLineBreak + 'Erro: ' + E.QualifiedClassName + ' - ' + E.Message);
        end;
      end;
      lMS.Free;
    end else begin
      TDialogService.ShowMessage('Imagem não encontrada para este dia.');
    end;
  end;
end;

procedure TfrmRESTGetImage.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRESTGetImage.CarregarImagem(const pURL: string);
begin
  ITask(
    TTask.Create(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          var
            lBytes: TBytesStream;
          begin
            lBytes := TBytesStream.Create;
            try
              IdHTTP.Get(pURL, lBytes);
              image.Bitmap.LoadFromStream(lBytes);
            except
              on E: Exception do
              begin
                TDialogService.ShowMessage('Erro ao realizar download: ' + sLineBreak + E.QualifiedClassName + ' - ' + E.Message);
              end;
            end;
            lBytes.Free;
          end);
      end)).Start;
end;

procedure TfrmRESTGetImage.FormShow(Sender: TObject);
begin
  if not FImageLoaded then
  begin
    FImageLoaded := True;
    TimerLoad.Enabled := True;
  end;
end;

class function TfrmRESTGetImage.GetInstance: TfrmRESTGetImage;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TfrmRESTGetImage.Create(Application);
  end;

  Result := FInstance;
end;

procedure TfrmRESTGetImage.TimerLoadTimer(Sender: TObject);
begin
  TimerLoad.Enabled := False;
  labelImagem.Text := ExtractFileName('https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a15pan11845-7.jpg');
  CarregarImagem('https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a15pan11845-7.jpg');
end;

end.
