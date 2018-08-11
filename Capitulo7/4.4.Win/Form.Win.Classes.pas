unit Form.Win.Classes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes, Form.Parent;

type
  TfrmWinClasses = class(TForm)
    checkAtivo: TCheckBox;
    timerCaptura: TTimer;
    buttonClose: TButton;
    panelList: TPanel;
    listHandles: TListBox;
    labelCaption: TLabel;
    labelClass: TLabel;
    buttonSimulaKey: TButton;
    editTexto: TEdit;
    buttonParent: TButton;
    procedure checkAtivoClick(Sender: TObject);
    procedure timerCapturaTimer(Sender: TObject);
    procedure listHandlesClick(Sender: TObject);
    procedure buttonCloseClick(Sender: TObject);
    procedure buttonSimulaKeyClick(Sender: TObject);
    procedure buttonParentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWinClasses: TfrmWinClasses;

implementation

{$R *.dfm}

procedure TfrmWinClasses.buttonParentClick(Sender: TObject);
begin
  if listHandles.ItemIndex <> -1 then
  begin
    frmParent.Show;
    Winapi.Windows.SetParent(StrToInt(listHandles.Items[listHandles.ItemIndex]), frmParent.Handle);
  end;
end;

procedure TfrmWinClasses.buttonSimulaKeyClick(Sender: TObject);
begin
  if listHandles.ItemIndex <> -1 then
  begin
    //Keybd_Event(ShiftKeys[i].vkey, MapVirtualKey(ShiftKeys[i].vkey, 0), 0, 0);
    PostMessage(StrToInt(listHandles.Items[listHandles.ItemIndex]),
      WM_KEYDOWN, vkA, MakeLong(0, MapVirtualKey(vkA, 0)));
    PostMessage(StrToInt(listHandles.Items[listHandles.ItemIndex]),
      WM_KEYDOWN, VK_SPACE, MakeLong(0, MapVirtualKey(VK_SPACE, 0)));
    // lembra de executar o KeyUp, sleep de 10 - 100 ms
  end;
end;

procedure TfrmWinClasses.buttonCloseClick(Sender: TObject);
var
  lHandle: Cardinal;
begin
  lHandle := FindWindow('Notepad', nil);
  if lHandle <> INVALID_HANDLE_VALUE then
  begin
//    SendMessage(lHandle, WM_CLOSE, 0, 0);
    PostMessage(lHandle, WM_CLOSE, 0, 0);
    ShowMessage('Closed');
  end;
end;

procedure TfrmWinClasses.checkAtivoClick(Sender: TObject);
begin
  timerCaptura.Enabled := checkAtivo.Checked;
end;

procedure TfrmWinClasses.listHandlesClick(Sender: TObject);
var
  lCaption: array [0..255] of Char;
begin
  if listHandles.ItemIndex <> -1 then
  begin
    GetWindowText(StrToInt(listHandles.Items[listHandles.ItemIndex]), @lCaption, Length(lCaption));
    labelCaption.Caption := string(lCaption);

    WinApi.Windows.GetClassName(StrToInt(listHandles.Items[listHandles.ItemIndex]), @lCaption, Length(lCaption));
    labelClass.Caption := string(lCaption);
  end;
end;

procedure TfrmWinClasses.timerCapturaTimer(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: Cardinal;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);

  listHandles.Items.Add(IntToStr(lHandle));
end;

end.
