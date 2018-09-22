unit Form.Audio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.IOUtils, FMX.DialogService,
  FMX.Types, FMX.Controls, FMX.Media, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.StdCtrls, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmAudio = class(TForm)
    LayoutClient: TLayout;
    ToolBarPlay: TToolBar;
    ToolBar2: TToolBar;
    imgOff: TImage;
    ButtonPlay: TButton;
    ButtonPause: TButton;
    Button1: TButton;
    ButtonRec: TButton;
    MediaPlayer: TMediaPlayer;
    procedure ButtonRecClick(Sender: TObject);
    procedure imgOffClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonPlayClick(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
  private
    FMicrophone: TAudioCaptureDevice;
    function TemMicrophone: Boolean;
    function GetAudioFileName: string;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TfrmAudio.Button1Click(Sender: TObject);
begin
  if TemMicrophone and
    (FMicrophone.State = TCaptureDeviceState.Capturing) then
  begin
    FMicrophone.StopCapture;
  end;
end;

procedure TfrmAudio.ButtonPauseClick(Sender: TObject);
begin
  if MediaPlayer.State = TMediaState.Playing then
  begin
    MediaPlayer.Stop;
  end;
end;

procedure TfrmAudio.ButtonPlayClick(Sender: TObject);
begin
  if FileExists(GetAudioFileName) then
  begin
    MediaPlayer.FileName := GetAudioFileName;
    MediaPlayer.Play;
  end;
end;

procedure TfrmAudio.ButtonRecClick(Sender: TObject);
begin
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  if TemMicrophone {igua a: Assigned(FMicrophone)} then
  begin
    FMicrophone.FileName := GetAudioFileName;
    try
      FMicrophone.StartCapture;
    except
      on E: Exception do
      begin
        TDialogService.ShowMessage('Não foi possível acessar o microphone: ' +
          sLineBreak + E.Message);
      end;
    end;
  end;
end;

function TfrmAudio.GetAudioFileName: string;
begin
  Result := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'audiorec.wav');
end;

procedure TfrmAudio.imgOffClick(Sender: TObject);
begin
  TDialogService.ShowMessage('Path: ' + sLineBreak + GetAudioFileName);
end;

function TfrmAudio.TemMicrophone: Boolean;
begin
  Result := Assigned(FMicrophone);
end;

end.
