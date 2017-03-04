unit Form.Microfone;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form.Base.Detalhe, FMX.Controls.Presentation, FMX.Objects, System.Actions,
  FMX.ActnList, FMX.Media, FMX.Layouts, System.IOUtils;

type
  TfrmMicrofone = class(TfrmBaseDetalhe)
    btnStartStop: TButton;
    ActionList1: TActionList;
    imgOff: TImage;
    imgOn: TImage;
    Layout1: TLayout;
    Button2: TButton;
    Button3: TButton;
    MediaPlayer1: TMediaPlayer;
    procedure btnStartStopClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FIsRecording: Boolean;
    FMicrophone: TAudioCaptureDevice; // FMX.Media
    FFileName: string;
  public
    { Public declarations }
  end;

var
  frmMicrofone: TfrmMicrofone;

implementation

{$R *.fmx}

procedure TfrmMicrofone.btnStartStopClick(Sender: TObject);
begin
  inherited;
  FIsRecording := not FIsRecording;
  if FIsRecording then
  begin
    // todo: trocar imagem durante captura
    FMicrophone := TCaptureDeviceManager.Current.DefaultAudioCaptureDevice;
    if Assigned(FMicrophone) then // caso contrário, sem microfone
    begin
      FMicrophone.FileName := FFileName;
      try
        FMicrophone.StartCapture;
      except
        on E: Exception do
        begin
          ShowMessage('Sem acesso ao microfone' + sLineBreak + E.QualifiedClassName + ' - ' + E.Message);
        end;
      end;
    end;
  end else begin
    FMicrophone.StopCapture;
  end;
end;

procedure TfrmMicrofone.Button2Click(Sender: TObject);
begin
  inherited;
  if not FIsRecording then
  begin
    MediaPlayer1.FileName := FFileName;
    MediaPlayer1.Play;
  end;
end;

procedure TfrmMicrofone.Button3Click(Sender: TObject);
begin
  inherited;
  if not FIsRecording then
  begin
    MediaPlayer1.Stop;
  end;
end;

procedure TfrmMicrofone.FormCreate(Sender: TObject);
begin
  inherited;
  FFileName := TPath.Combine(TPath.GetDocumentsPath, 'teste.wav'); // System.IOUtils
end;

end.
