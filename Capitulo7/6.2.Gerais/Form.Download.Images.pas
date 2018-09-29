unit Form.Download.Images;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.TabControl, FMX.Objects, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FMX.DialogService, System.Threading, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IPPeerClient, FMX.ScrollBox, FMX.Memo, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TfrmDownloadImage = class;
  TCarregaImagem = reference to procedure (pForm: TfrmDownloadImage; const pImagem: string);
  TfrmDownloadImage = class(TForm)
    LayoutClient: TLayout;
    ToolBar: TToolBar;
    ButtonVoltar: TButton;
    Edit1: TEdit;
    ButtonGo: TButton;
    ScrollBox: TScrollBox;
    LayoutControles: TLayout;
    TabControl: TTabControl;
    TabCalendario: TTabItem;
    tabData: TTabItem;
    Layout1: TLayout;
    ButtonDiaAnterior: TButton;
    ButtonProximoDia: TButton;
    LabelDia: TLabel;
    TimerLoad: TTimer;
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    RESTClient: TRESTClient;
    RESTResponse: TRESTResponse;
    RESTRequest: TRESTRequest;
    tabJson: TTabItem;
    MemoJson: TMemo;
    VertScrollBox1: TVertScrollBox;
    ImagePrincipal: TImage;
    procedure ButtonVoltarClick(Sender: TObject);
    procedure TimerLoadTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MemoJsonClick(Sender: TObject);
  private
    const
      URL_IMAGEM_NASA = 'https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a15pan11845-7.jpg';
  public
    class var
      FCarregaImagem: TCarregaImagem;
  public

  end;

implementation

{$R *.fmx}

procedure TfrmDownloadImage.ButtonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDownloadImage.FormShow(Sender: TObject);
begin
  TimerLoad.Enabled := True;
end;

procedure TfrmDownloadImage.MemoJsonClick(Sender: TObject);
begin
  RESTClient.BaseURL := 'https://jsonplaceholder.typicode.com/posts';
  // RESTRequest.Params.ParameterByName => Case Sensitive
  if Assigned(RESTRequest.Params.ParameterByName('userId')) then
  begin
    RESTRequest.Params.ParameterByName('userId').Value := '4';
  end;
  RESTRequest.Execute;
  MemoJson.Text := RESTRequest.Response.Content;
end;

procedure TfrmDownloadImage.TimerLoadTimer(Sender: TObject);
begin
  TimerLoad.Enabled := False;
  if Assigned(FCarregaImagem) then
  begin
    FCarregaImagem(Self, URL_IMAGEM_NASA);
  end;

  //CarregarImagem(URL_IMAGEM_NASA);
end;

end.
