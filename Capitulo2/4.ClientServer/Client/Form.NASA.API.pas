unit Form.NASA.API;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, FMX.Objects, FMX.Edit, System.Threading,
  IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, REST.Client, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.DBScope, REST.Response.Adapter, Data.Bind.Components, System.DateUtils,
  Data.Bind.ObjectScope, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Calendar;

type
  TfrmNASAAPI = class(TForm)
    ToolBar1: TToolBar;
    btnExit: TButton;
    edtImgURL: TEdit;
    imgPrincipal: TImage;
    nctGetImage: TNetHTTPClient;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    bdsJSON: TBindSourceDB;
    memJSON: TFDMemTable;
    RESTResponse1: TRESTResponse;
    memJSONdate: TStringField;
    memJSONexplanation: TStringField;
    memJSONhdurl: TStringField;
    memJSONurl: TStringField;
    memJSONmedia_type: TStringField;
    memJSONservice_version: TStringField;
    memJSONtitle: TStringField;
    lblTitulo: TLabel;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    Button1: TButton;
    Calendar1: TCalendar;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Calendar1DayClick(Sender: TObject);
  private const
    URL_API = 'https://api.nasa.gov/planetary/apod?api_key=';
    API_KEY = '';
  private
    FDataBase: string;
    procedure CarregaImagem;
  public
    { Public declarations }
  end;

var
  frmNASAAPI: TfrmNASAAPI;

implementation

{$R *.fmx}

procedure TfrmNASAAPI.btnExitClick(Sender: TObject);
begin
  Hide;
end;

procedure TfrmNASAAPI.Button1Click(Sender: TObject);
begin
  Calendar1.Visible := not Calendar1.Visible;
end;

procedure TfrmNASAAPI.Calendar1DayClick(Sender: TObject);
begin
  if DateOF(Calendar1.Date) <= DateOF(Now) then
  begin
    Calendar1.Visible := not Calendar1.Visible;
    FDataBase := FormatDateTime('yyyy-mm-dd', Calendar1.Date);
    //FDataBase := YearOF(Calendar1.Date).ToString + '-' + MonthOf(Calendar1.Date).ToString + '-' + DayOf(Calendar1.Date).ToString;
    CarregaImagem;
  end else begin
    ShowMessage('Não pode ser selecionada uma data maior que a atual: ' + DateToStr(DateOf(Now)));
  end;
end;

procedure TfrmNASAAPI.CarregaImagem;
var
  lStm: TMemoryStream;
  lUrl: string;
begin
  ITask(
    TTask.Create(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          begin
            lUrl := edtImgURL.Text;

            // remover para produção
            if API_KEY = '' then
              raise Exception.Create('Gere sua Key no site da NASA e informe na constante.');

            RESTClient1.BaseURL := URL_API + API_KEY;

            if FDataBase <> '' then
            begin
              RESTClient1.BaseURL := RESTClient1.BaseURL + '&date=' + FDataBase;
            end;

            RESTRequest1.Execute;
            if not memJSON.IsEmpty then
            begin
              lUrl := memJSONurl.AsString;
              edtImgURL.Text := lUrl;
            end;

            // try -> não seria errado, porém se ocorrer erro no create, o finally gerará access violation
            lStm := TMemoryStream.Create;
            try
              // todo: thread
              nctGetImage.Get(lUrl, lStm);
              imgPrincipal.Bitmap.LoadFromStream(lStm);
            finally
              lStm.Free;
            end;
          end)
      end)
    ).Start;
end;

procedure TfrmNASAAPI.FormShow(Sender: TObject);
begin
  CarregaImagem;
end;

end.
