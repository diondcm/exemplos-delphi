unit Form.RESTGetImage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.DialogService, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmRESTGetImage = class(TForm)
    ToolBar1: TToolBar;
    buttonVoltar: TButton;
    image: TImage;
    TimerLoad: TTimer;
    IdHTTP: TIdHTTP;
    procedure buttonVoltarClick(Sender: TObject);
    procedure TimerLoadTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarImagem(const pURL: string);
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmRESTGetImage.buttonVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRESTGetImage.CarregarImagem(const pURL: string);
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
end;

procedure TfrmRESTGetImage.FormShow(Sender: TObject);
begin
  TimerLoad.Enabled := True;
end;

procedure TfrmRESTGetImage.TimerLoadTimer(Sender: TObject);
begin
  TimerLoad.Enabled := False;
  CarregarImagem('https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a15pan11845-7.jpg');
end;

end.
