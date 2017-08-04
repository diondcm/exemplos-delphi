unit Form.Principal;

interface

uses
  System.SysUtils, System.IniFiles, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects,
  FMX.ListView, Classes.Custom.Adapter, FMX.ListView.Types, FMX.Controls.Presentation, FMX.Calendar, System.IOUtils,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  System.Threading, FMX.Edit, FMX.DateTimeCtrls, FMX.ListBox, FMX.WebBrowser, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmPrincipal = class(TForm)
    LayoutListView: TLayout;
    tmrLoadImages: TTimer;
    imgBackDrop: TImage;
    Layout1: TLayout;
    Calendar: TCalendar;
    imgDally: TImage;
    NetHTTPClient1: TNetHTTPClient;
    tmrImagem: TTimer;
    Layout2: TLayout;
    DateEdit1: TDateEdit;
    edtKeyBoardType: TEdit;
    cmbJanelaNoMobile: TComboBox;
    VertScrollBox1: TVertScrollBox;
    IdHTTP1: TIdHTTP;
    procedure tmrLoadImagesTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CalendarDateSelected(Sender: TObject);
    procedure tmrImagemTimer(Sender: TObject);
  private
    FTotal: Integer;
    FImagesLoaded: Boolean;
    FDallyImageLoaded: Boolean;
    FListView: TPresentedListView;
    FStrings: TStringList;
    FAdapter: TCustomAdapter;
    procedure ButtonClicked(Sender: TObject);
    procedure PullRefresh(Sender: TObject);
    procedure AddItems(Qtd: Integer);
    function GetCaminhoConfig: string;
    procedure CarregarImagem(const pURL: string);
  public const
    HOST = 'http://i.imgur.com/';
    ARQUIVO_INI = 'config.ini';
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.AddItems(Qtd: Integer);
const
  Cats: array [0..4] of string =
    ('SpCbHBI.jpg',
     'aMlUpJB.jpg',
     'fmXnXWn.png',
     'IWSnWNt.jpg',
     'QgA69dC.png');

  Names: array [0..9] of string =
    ('Molly', 'Charlie', 'Tigger', 'Poppy', 'Oscar', 'Smudge', 'Millie', 'Daisy', 'Max', 'Jasper');

  function NextItemText: string;
  begin
    Result := Format('[%d] [%s] [%s%s]', [FTotal, Names[FTotal mod Length(Names)], Host, Cats[FTotal mod Length(Cats)]]);
    Inc(FTotal);
  end;

var
  i: Integer;
begin
  for i := 0 to Qtd - 1 do
  begin
    FStrings.Add(NextItemText);
  end;
end;

procedure TfrmPrincipal.ButtonClicked(Sender: TObject);
var
  lBtn: TObject;
  lText: string;
begin
  lBtn := TListItemTextButton(Sender).TagObject;
  lText := TListItemText(TListItem(lBtn).View.FindDrawable('title')).Text;
  ShowMessage(lText + ' says Hi!');
end;

procedure TfrmPrincipal.CalendarDateSelected(Sender: TObject);
var
  lIni: TIniFile;
begin
  lIni := TIniFile.Create(GetCaminhoConfig);
  try
    lIni.WriteDate('config', 'UltimaData', Calendar.Date);
  finally
    lIni.Free;
  end;
end;

procedure TfrmPrincipal.CarregarImagem(const pURL: string);
var
  lStream: TMemoryStream;
  lBytes: TBytesStream;
begin
//  ITask(
//    TTask.Create(
//    procedure
//    begin
//      TThread.Queue(nil,
//      procedure
//      begin
        lStream := TMemoryStream.Create;
        //lBytes := TBytesStream.Create;
        try
          NetHTTPClient1.Get(pURL, lStream);
          //IdHTTP1.Get(pURL, lBytes);
          try
            imgDally.Bitmap.LoadFromStream(lStream);
            //imgDally.Bitmap.LoadFromStream(lBytes);
          except
            // silence
          end;
        finally
          lStream.Free;
        end;
//      end);
//    end)).Start;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lIni: TIniFile;
begin
  FListView := TPresentedListView.Create(Self);
  FListView.ControlType := TControlType.Platform;
  FStrings := TStringList.Create;

  FAdapter := TCustomAdapter.Create(FListView, FStrings);
  FAdapter.BackDropImage := imgBackDrop;
  FAdapter.OnButtonClicked := ButtonClicked;
  FListView.Adapter := FAdapter;

  FListView.Parent := LayoutListView;
  FListView.Align := TAlignLayout.Client;

  FListView.PullToRefresh := True;
  FListView.PullRefreshWait := True;
  FListView.OnPullRefresh := PullRefresh;

  lIni := TIniFile.Create(GetCaminhoConfig);
  try
    Calendar.Date := lIni.ReadDate('config', 'UltimaData', Now - 15);
  finally
    lIni.Free;
  end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListView.Adapter := nil;
  FAdapter.Free;
  FListView.Free;
  FStrings.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if not FDallyImageLoaded then
  begin
    FDallyImageLoaded := True;
    tmrImagem.Enabled := True;
  end;

  if not FImagesLoaded then
  begin
    FImagesLoaded := True;
    tmrLoadImages.Enabled := True;
  end;
end;

function TfrmPrincipal.GetCaminhoConfig: string;
begin
  {$IFDEF ANDROID}
  Result := TPath.GetDocumentsPath();
  {$ELSE}
  Result := ExtractFilePath(ParamStr(0));
  {$ENDIF}

  Result := TPath.Combine(Result, ARQUIVO_INI);
end;

procedure TfrmPrincipal.PullRefresh(Sender: TObject);
begin
  AddItems(30);
end;

procedure TfrmPrincipal.tmrImagemTimer(Sender: TObject);
begin
  tmrImagem.Enabled := False;
//  'http://i.imgur.com/SpCbHBI.jpg'
  CarregarImagem('https://apod.nasa.gov/apod/image/1707/aurora_iss052e007857.jpg');
end;

procedure TfrmPrincipal.tmrLoadImagesTimer(Sender: TObject);
begin
  tmrLoadImages.Enabled := False;
  AddItems(30);
end;

end.
