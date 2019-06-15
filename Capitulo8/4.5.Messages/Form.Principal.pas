unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections, Form.Host;

const
  WM_BASE = WM_APP + WM_USER;
  WM_AVISO = WM_BASE + 1;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    CheckBoxBusca: TCheckBox;
    TimerBusca: TTimer;
    ListBoxJanelas: TListBox;
    TimerAviso: TTimer;
    Splitter1: TSplitter;
    FlowPanel1: TFlowPanel;
    ButtonClose: TButton;
    ButtonClick: TButton;
    ButtonSetText: TButton;
    ButtonAviso: TButton;
    ButtonPostMessage: TButton;
    Panel2: TPanel;
    EditCaption: TEdit;
    ButtonGetHandle: TButton;
    EditHandle: TEdit;
    ButtonWinForm: TButton;
    ButtonookWndProc: TButton;
    ButtonUnHookWndProc: TButton;
    ButtonPerform: TButton;
    ButtonHost: TButton;
    ButtonSetParent: TButton;
    Timer1: TTimer;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonGetHandleClick(Sender: TObject);
    procedure ButtonClickClick(Sender: TObject);
    procedure ButtonSetTextClick(Sender: TObject);
    procedure CheckBoxBuscaClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBoxJanelasClick(Sender: TObject);
    procedure TimerAvisoTimer(Sender: TObject);
    procedure ButtonAvisoClick(Sender: TObject);
    procedure ButtonPostMessageClick(Sender: TObject);
    procedure ButtonWinFormClick(Sender: TObject);
    procedure ButtonookWndProcClick(Sender: TObject);
    procedure ButtonUnHookWndProcClick(Sender: TObject);
    procedure ButtonPerformClick(Sender: TObject);
    procedure ButtonHostClick(Sender: TObject);
    procedure ButtonSetParentClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FWAviso: Integer;
    FListaWindows: TDictionary<string, THandle>;
    FHandleHost: HWND;
  public
    procedure WMAVISO(var Message: TMessage); message WM_AVISO;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


var
  NovaClasse: TWndClass;
  lFormWin: HWND;
  lEdtHandle: HWND;
  lBtnHandle: HWND;

  OldWndProc: TFarProc;
  NewWndProc: TFarProc;

procedure ClickButtonWin;
var
  lText: array [0..255] of Char;
begin
  GetWindowText(lEdtHandle, lText, Length(lText));
  MessageBox(lFormWin, PChar('Você digitou: "' + lText + '"'), 'Info', MB_APPLMODAL or MB_ICONINFORMATION + MB_OK);
end;

function HookWndProc(pHandle: HWND; uMsg: UINT; pWParam: WPARAM; pLParam: LPARAM): LRESULT; stdcall;
begin
  SetWindowText(StrToInt(frmPrincipal.EditHandle.Text), PChar(TimeToStr(Now)));
  Result := CallWindowProc(OldWndProc, pHandle, uMsg, pwParam, plParam);
end;

function NossaWndProc(pHandle: HWND; uMsg: UINT; pWParam: WPARAM; pLParam: LPARAM): LRESULT; stdcall;
begin
  Result := 0;
  case uMsg of
    WM_DESTROY: PostQuitMessage(0);
    WM_ACTIVATE: Winapi.Windows.SetFocus(lEdtHandle);
    WM_COMMAND:
      begin
        if pLParam = lBtnHandle then
        begin
          case pWParam of
            BN_CLICKED: ClickButtonWin;
          else
            Result := DefWindowProc(pHandle, uMsg, pWParam, pLParam);
          end;
        end;
      end
    else
      Result := DefWindowProc(pHandle, uMsg, pWParam, pLParam);
    end;
end;

procedure CriaControlesWin;
begin
  lEdtHandle := CreateWindowEx(WS_EX_CLIENTEDGE,
    'EDIT',
    '',
    WS_CHILD OR WS_VISIBLE OR ES_AUTOVSCROLL OR ES_NOHIDESEL,
    8, 16, 160, 21,
    lFormWin,
    0,
    HInstance,
    nil);

  lBtnHandle := CreateWindow(
    'BUTTON',
    'Exibe Texto',
    WS_CHILD OR WS_VISIBLE OR BS_PUSHBUTTON OR BS_TEXT,
    8, 40, 96, 25,
    lFormWin,
    0,
    HInstance,
    nil);
end;

procedure TfrmPrincipal.ButtonPerformClick(Sender: TObject);
begin
  Perform(WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipal.ButtonPostMessageClick(Sender: TObject);
var
  lVal: Integer;
  lResultado: LongBool;
begin
  lVal := Random(10000);
  lResultado := PostMessage( StrToInt(EditHandle.Text) , WM_AVISO, lVal, 0);
  Caption := lVal.ToString + ' - ' + lResultado.ToString;
end;

procedure TfrmPrincipal.ButtonookWndProcClick(Sender: TObject);
begin
  OldWndProc := TFarProc(GetWindowLongPtr(StrToInt(EditHandle.Text), GWL_WNDPROC));
//  NewWndProc := MakeObjectInstance(HookWndProc);
  SetWindowLongPtr(StrToInt(EditHandle.Text), GWL_WNDPROC, LongInt(@HookWndProc));
  Caption := 'Ok - ' + TimeToStr(Now);
end;

procedure TfrmPrincipal.ButtonUnHookWndProcClick(Sender: TObject);
begin
  SetWindowLongPtr(StrToInt(EditHandle.Text), GWL_WNDPROC, LongInt(@OldWndProc));
//  if assigned(NewWndProc) then
//    FreeObjectInstance(NewWndProc);
  Caption := 'UnOk - ' + TimeToStr(Now);
end;

procedure TfrmPrincipal.ButtonSetParentClick(Sender: TObject);
begin
  WinApi.Windows.SetParent(StrToInt(EditHandle.Text), FHandleHost);
end;

procedure TfrmPrincipal.ButtonAvisoClick(Sender: TObject);
var
  lVal: Integer;
  lResultado: LRESULT;
begin
  lVal := Random(10000);
  lResultado := SendMessage( StrToInt(EditHandle.Text) , WM_AVISO, lVal, 0);
  Caption := lVal.ToString + ' - ' + lResultado.ToString;
end;

procedure TfrmPrincipal.ButtonClickClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONDOWN, 0, 0);
  Sleep(100);
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONUP, 0, 0);
end;

procedure TfrmPrincipal.ButtonSetTextClick(Sender: TObject);
begin
 SetWindowText(StrToInt(EditHandle.Text), 'Alterado');
end;

procedure TfrmPrincipal.ButtonWinFormClick(Sender: TObject);
begin
  NovaClasse.style := 0;
  NovaClasse.lpfnWndProc := @NossaWndProc;//DefWindowProc;
  NovaClasse.cbClsExtra := 0;
  NovaClasse.cbWndExtra := 0;
  NovaClasse.hInstance := HInstance;
  NovaClasse.hIcon := 0;
  NovaClasse.hCursor := LoadCursor(0, IDC_ARROW);
  NovaClasse.hbrBackground := COLOR_WINDOW;
  NovaClasse.lpszMenuName := nil;
  NovaClasse.lpszClassName := 'TMainForm';

  Winapi.Windows.RegisterClass(NovaClasse);

  lFormWin := CreateWindow('TMainForm',
    'Criação Componentes',
    WS_OVERLAPPEDWINDOW,
    Integer(CW_USEDEFAULT),
    Integer(CW_USEDEFAULT),
    320, 200,
    0,
    0,
    hInstance,
    nil);

  CriaControlesWin;

  ShowWindow(lFormWin, SW_SHOWNORMAL);
end;

procedure TfrmPrincipal.CheckBoxBuscaClick(Sender: TObject);
begin
  TimerBusca.Enabled := CheckBoxBusca.Checked;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaWindows := TDictionary<string, THandle>.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListaWindows.Free;
end;

procedure TfrmPrincipal.ListBoxJanelasClick(Sender: TObject);
begin
  if ((FListaWindows.Count > 0) and (FListaWindows.ContainsKey(ListBoxJanelas.Items[ListBoxJanelas.ItemIndex]))) then
  begin
    EditHandle.Text := IntToStr(FListaWindows[ListBoxJanelas.Items[ListBoxJanelas.ItemIndex]]);
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
// na unit Vcl.StdCtrls
//  public
//    class var
//      FButtonCount: Integer;
//      FButtonClick: Integer;

//procedure TCustomButton.Click;
//var
//  Form: TCustomForm;
//begin
//  Inc(FButtonClick);

//constructor TCustomButton.Create(AOwner: TComponent);
//  . . .
//  Inc(FButtonCount);

  Caption := 'Count: ' + TCustomButton.FButtonCount.ToString + ' Clicks: ' + TCustomButton.FButtonClick.ToString;
end;

procedure TfrmPrincipal.TimerAvisoTimer(Sender: TObject);
begin
  TimerAviso.Enabled := False;

  Application.MessageBox(PCHar('Aviso: ' + IntToStr(FWAviso)), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  FWAviso := 0;
end;

procedure TfrmPrincipal.TimerBuscaTimer(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: HWND;
  lArrCaption: array [0..255] of Char;
  lCaption: string;
  lClassName: string;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);

  GetWindowText(lHandle, @lArrCaption, Length(lArrCaption));
  lCaption := string(lArrCaption);

  WinApi.Windows.GetClassName(lHandle, @lArrCaption, Length(lArrCaption));
  lClassName := string(lArrCaption);

  if not FListaWindows.ContainsKey(lCaption + ' - ' + lClassName) then
  begin
    if not FListaWindows.ContainsKey(lClassName) then
    begin
      if not FListaWindows.ContainsKey(IntToStr(lHandle)) then
      begin
        if lCaption <> '' then
        begin
          ListBoxJanelas.Items.Add(lCaption + ' - ' + lClassName);
          FListaWindows.Add(lCaption + ' - ' + lClassName, lHandle);
        end else if lClassName <> '' then
        begin
          ListBoxJanelas.Items.Add(lClassName);
          FListaWindows.Add(lClassName, lHandle);
        end else begin
          ListBoxJanelas.Items.Add(IntToStr(lHandle));
          FListaWindows.Add(IntToStr(lHandle), lHandle);
        end;
      end else begin
        ListBoxJanelas.ItemIndex := ListBoxJanelas.Items.IndexOf(IntToStr(lHandle));
      end;
    end else begin
      ListBoxJanelas.ItemIndex := ListBoxJanelas.Items.IndexOf(lClassName);
    end;
  end else begin
    ListBoxJanelas.ItemIndex := ListBoxJanelas.Items.IndexOf(lCaption + ' - ' + lClassName);
  end;
end;

procedure TfrmPrincipal.WMAVISO(var Message: TMessage);
begin
  Sleep(6000);
  FWAviso := Message.WParam;
  Message.Result := 321;
  TimerAviso.Enabled := True;
end;

procedure TfrmPrincipal.ButtonCloseClick(Sender: TObject);
begin
//  SendMessage(Handle, WM_CLOSE, 0, 0);
  SendMessage( StrToInt(EditHandle.Text) , WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipal.ButtonGetHandleClick(Sender: TObject);
begin
  EditHandle.Text := IntToStr(FindWindow(nil, PChar(EditCaption.Text)));// PAnsiChar
end;

procedure TfrmPrincipal.ButtonHostClick(Sender: TObject);
var
  lfrm: TfrmHost;
begin
  lfrm := TfrmHost.Create(Application);
  FHandleHost := lfrm.Handle;
  lfrm.Show;
end;

end.
