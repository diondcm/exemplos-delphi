unit Form.Audio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.MultiView, FMX.Layouts, System.Actions, FMX.ActnList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Media, System.IOUtils;

type
  TfrmAudio = class(TfrmBaseMultiView)
    toolPlay: TToolBar;
    toolRec: TToolBar;
    Button1: TButton;
    Button2: TButton;
    btnStopRecord: TButton;
    btnStartRecord: TButton;
    imgOff: TImage;
    ActionList1: TActionList;
    actStartRecord: TAction;
    actStopRecord: TAction;
    procedure actStartRecordExecute(Sender: TObject);
    procedure actStopRecordExecute(Sender: TObject);
  private
    FMicrophone: TAudioCaptureDevice;
    function HasMicrophone: Boolean;
    function GetAudioFile: string;
  public
    { Public declarations }
  end;

var
  frmAudio: TfrmAudio;

implementation

{$R *.fmx}

procedure TfrmAudio.actStartRecordExecute(Sender: TObject);
begin
  inherited;
  //actStop.Excute;

  FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
  if HasMicroPhone then
  begin
    FMicrophone.FileName := GetAudioFile;
    try
      FMicrophone.StartCapture;
    except
      on E: Exception do
      begin
        ShowMessage('Não foi possível execitar o microfone: ' + sLineBreak + E.Message);
      end;
    end;
  end;

end;

procedure TfrmAudio.actStopRecordExecute(Sender: TObject);
begin
  inherited;
  if Assigned(FMicrophone) and
  (FMicrophone.State = TCaptureDeviceState.Capturing) then
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
