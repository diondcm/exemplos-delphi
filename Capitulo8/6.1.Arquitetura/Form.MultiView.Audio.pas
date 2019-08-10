unit Form.MultiView.Audio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.MultiView.Base, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects,
  System.Actions, FMX.ActnList, FMX.Media, System.IOUtils, FMX.DialogService;

type
  TfrmMultiViewAudio = class(TfrmBaseMultiView)
    imgOff: TImage;
    ToolBar1: TToolBar;
    ButtonStart: TButton;
    ButtonStop: TButton;
    ActionList1: TActionList;
    ActionStart: TAction;
    ActionStop: TAction;
    ToolBar2: TToolBar;
    ButtonPlay: TButton;
    ButtonPause: TButton;
    MediaPlayer: TMediaPlayer;
    TimerHint: TTimer;
    LabelToast: TLabel;
    procedure ActionStartExecute(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonPlayClick(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure TimerHintTimer(Sender: TObject);
    procedure imgOffClick(Sender: TObject);
  private
    FMicrofone: TAudioCaptureDevice;
  public
    procedure ExibeToast(pMsg: string);
    function HasMicrofone: Boolean;
    function GetAudioFile: string;
    { Public declarations }
  end;

var
  frmMultiViewAudio: TfrmMultiViewAudio;

implementation

{$R *.fmx}

procedure TfrmMultiViewAudio.ActionStartExecute(Sender: TObject);
begin
  FMicrofone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  if HasMicrofone then
  begin
    FMicrofone.FileName := GetAudioFile;
    try
      FMicrofone.StartCapture;
      ExibeToast('Gravação iniciada...');
    except
      on E: Exception do
      begin
        TDialogService.ShowMessage('Não foi possível acessar o microfone.' + sLineBreak + E.Message);
      end;
    end;
  end;
end;

procedure TfrmMultiViewAudio.ButtonPauseClick(Sender: TObject);
begin
  if MediaPlayer.State = TMediaState.Playing then
  begin
    MediaPlayer.Stop;
    ExibeToast('Stopped.');
  end;
end;

procedure TfrmMultiViewAudio.ButtonPlayClick(Sender: TObject);
begin
  if FileExists(GetAudioFile) then
  begin
    MediaPlayer.FileName := GetAudioFile;
    MediaPlayer.Play;
    ExibeToast('Playing...');
  end;
end;

procedure TfrmMultiViewAudio.ButtonStopClick(Sender: TObject);
begin
  if HasMicrofone and (FMicrofone.State = TCaptureDeviceState.Capturing) then
  begin
    FMicrofone.StopCapture;
    ExibeToast('...Gravação finalizada');
  end;
end;

procedure TfrmMultiViewAudio.ExibeToast(pMsg: string);
begin
  LabelToast.Text := pMsg;

  TimerHint.Enabled := True;
  LabelToast.Visible := True;
end;

function TfrmMultiViewAudio.GetAudioFile: string;
begin
  Result := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'teste.wav');
end;

function TfrmMultiViewAudio.HasMicrofone: Boolean;
begin
  Result := Assigned(FMicrofone);
end;

procedure TfrmMultiViewAudio.imgOffClick(Sender: TObject);
begin
  MediaPlayer.Stop;
  ExibeToast('Stopped.');
end;

procedure TfrmMultiViewAudio.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled := False;
  LabelToast.Visible := False;
end;

end.
