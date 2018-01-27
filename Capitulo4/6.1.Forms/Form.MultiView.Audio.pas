unit Form.MultiView.Audio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Base.Form.MultiView, FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Media, FMX.DialogService, System.IOUtils, FMX.Objects;

type
  TfrmAudio = class(TfrmBaseMultiView)
    ToolBar1: TToolBar;
    buttonStopRecord: TButton;
    buttonStartRecord: TButton;
    ActionList: TActionList;
    actStart: TAction;
    ActStop: TAction;
    imgOff: TImage;
    procedure actStartExecute(Sender: TObject);
    procedure ActStopExecute(Sender: TObject);
  private
    FMicrophone: TAudioCaptureDevice;
    function GetAudioFile: string;
    function HasMicrophone: Boolean;
  public
    { Public declarations }
  end;

var
  frmAudio: TfrmAudio;

implementation

{$R *.fmx}

procedure TfrmAudio.actStartExecute(Sender: TObject);
begin
  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  if HasMicrophone then
  begin
    FMicrophone.FileName := GetAudioFile;
    try
      FMicrophone.StartCapture;
    except
      on E: Exception do
      begin
        TDialogService.ShowMessage('Não foi possível acessar o microfone.' + sLineBreak + E.Message);
      end;
    end;
  end;
end;

procedure TfrmAudio.ActStopExecute(Sender: TObject);
begin
  if HasMicrophone and (FMicrophone.State = TCaptureDeviceState.Capturing) then
  begin
    FMicrophone.StopCapture;
  end;
end;

function TfrmAudio.GetAudioFile: string;
begin
  Result := TPath.Combine(TPath.GetDocumentsPath, 'teste.wav');
end;

function TfrmAudio.HasMicrophone: Boolean;
begin
  Result := Assigned(FMicrophone);
end;

end.
