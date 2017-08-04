unit Form.Imagem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Calendar,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.DateTimeCtrls, System.IOUtils,
  FMX.ListBox, FMX.Layouts, System.Net.URLClient, System.Net.HttpClient, System.Threading,
  System.Net.HttpClientComponent, System.IniFiles, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmImagem = class(TForm)
    Layout1: TLayout;
    imgDally: TImage;
    NetHTTPClient1: TNetHTTPClient;
    Layout2: TLayout;
    Calendar: TCalendar;
    tmrImagem: TTimer;
    Layout4: TLayout;
    IdHTTP1: TIdHTTP;
    cmbJanelaNoMobile: TComboBox;
    DateEdit1: TDateEdit;
    edtKeyBoardType: TEdit;
    procedure tmrImagemTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CalendarDateSelected(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDallyImagesLoaded: Boolean;
    function GetCaminhoConfig: string;
    procedure CarregarImagem(const pURL: string);
  private const
    ARQUIVO_INI = 'config.ini';
  public
    { Public declarations }
  end;

var
  frmImagem: TfrmImagem;

implementation

{$R *.fmx}

procedure TfrmImagem.CalendarDateSelected(Sender: TObject);
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

procedure TfrmImagem.CarregarImagem(const pURL: string);
var
  lStream: TMemoryStream;
  lBytes: TBytesStream;
begin
  ITask(
    TTask.Create(
    procedure
    begin
      TThread.Queue(nil,
      procedure
      begin
//        lStream := TMemoryStream.Create;
        lBytes := TBytesStream.Create;
        try
//          NetHTTPClient1.Get(pURL, lStream);
          IdHTTP1.Get(pURL, lBytes);
          try
//            imgDally.Bitmap.LoadFromStream(lStream);
            imgDally.Bitmap.LoadFromStream(lBytes);
          except
            // silence
          end;
        finally
//          lStream.Free;
          lBytes.Free;
        end;
      end);
    end)).Start;
end;

procedure TfrmImagem.FormCreate(Sender: TObject);
var
  lIni: TIniFile;
begin
  lIni := TIniFile.Create(GetCaminhoConfig);
  try
    Calendar.Date := lIni.ReadDate('config', 'UltimaData', Now - 15);
  finally
    lIni.Free;
  end;
end;

procedure TfrmImagem.FormShow(Sender: TObject);
begin
  if not FDallyImagesLoaded then
  begin
    FDallyImagesLoaded := True;
    tmrImagem.Enabled := True;
  end;
end;

function TfrmImagem.GetCaminhoConfig: string;
begin
  {$IFDEF ANDROID}
  Result := TPath.GetDocumentsPath();
  {$ELSE}
  Result := ExtractFilePath(ParamStr(0));
  {$ENDIF}

  Result := TPath.Combine(Result, ARQUIVO_INI);
end;

procedure TfrmImagem.tmrImagemTimer(Sender: TObject);
begin
  tmrImagem.Enabled := False;
//  'http://i.imgur.com/SpCbHBI.jpg'
  CarregarImagem('https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a15pan11845-7.jpg');
  //'https://apod.nasa.gov/apod/image/1707/aurora_iss052e007857.jpg);
end;

end.
