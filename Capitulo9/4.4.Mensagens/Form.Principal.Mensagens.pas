unit Form.Principal.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections;

const
  WM_BASE = WM_APP + WM_USER;
  WM_AVISO = WM_BASE + 1;

type
  TfrmPrincipalMensagens = class(TForm)
    PanelHandles: TPanel;
    PanelControles: TPanel;
    PanelComps: TPanel;
    CheckBoxBusca: TCheckBox;
    ListBoxHandles: TListBox;
    ButtonSendClick: TButton;
    ButtonAviso: TButton;
    TimerBusca: TTimer;
    Splitter1: TSplitter;
    EditHandle: TEdit;
    ButtonSendText: TButton;
    ButtonClose: TButton;
    ButtonNotificacao: TButton;
    ButtonShake: TButton;
    ButtonSetParent: TButton;
    ButtonWinClass: TButton;
    Button1: TButton;
    TimerAviso: TTimer;
    ButtonCustomAviso: TButton;
    Button2: TButton;
    ButtonPerform: TButton;
    procedure ButtonAvisoClick(Sender: TObject);
    procedure ButtonSendClickClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBoxBuscaClick(Sender: TObject);
    procedure ListBoxHandlesClick(Sender: TObject);
    procedure ButtonSendTextClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonNotificacaoClick(Sender: TObject);
    procedure ButtonShakeClick(Sender: TObject);
    procedure ButtonSetParentClick(Sender: TObject);
    procedure ButtonWinClassClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimerAvisoTimer(Sender: TObject);
    procedure ButtonCustomAvisoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonPerformClick(Sender: TObject);
  private
    FWAviso: Cardinal;
    FListaWindows: TDictionary<string, THandle>;
  public
    { Public declarations }
    procedure WMAVISO(var Message: TMessage); message WM_AVISO;
  end;

var
  frmPrincipalMensagens: TfrmPrincipalMensagens;

implementation

{$R *.dfm}

var
  NovaClasse: TWndClass;
  lFormWin: HWND;
  lEdtHandle: HWND;
  lBtnHandle: NativeInt;

  OldWndProc: TFarProc;
//  NewWndProc: TFarProc;

procedure ClickButtonWin;
var
  lText: array [0..255] of Char;
begin
  GetWindowText(lEdtHandle, lText, Length(lText));
  MessageBox(lFormWin, PChar('Você digitou: "' + lText + '"'), 'Info', MB_APPLMODAL or MB_ICONINFORMATION + MB_OK);
end;

function HookWndProc(pHandle: HWND; uMsg: UINT; pWParam: WPARAM; pLParam: LPARAM): LRESULT; stdcall;
begin

  if uMsg = WM_KEYDOWN then
  begin
    SetWindowText(StrToInt(frmPrincipalMensagens.EditHandle.Text), PChar('Tecla: ' + Chr(pWParam)));
  end else begin
    SetWindowText(StrToInt(frmPrincipalMensagens.EditHandle.Text), PChar(TimeToStr(Now)));
  end;
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

procedure TfrmPrincipalMensagens.ButtonSendTextClick(Sender: TObject);
begin
  SetWindowText(StrToInt(EditHandle.Text), 'Alterado');
end;

procedure TfrmPrincipalMensagens.ButtonSetParentClick(Sender: TObject);
begin
  WinApi.Windows.SetParent(StrToInt(EditHandle.Text), PanelComps.Handle);
end;

procedure TfrmPrincipalMensagens.ButtonNotificacaoClick(Sender: TObject);
var
  I: Integer;
  fAlertaMsn: TForm;  // <- Aqui você pode definir um form pernolanizado.
  BarraIniciar: HWND; { Barra Iniciar }
  tmAltura: Integer;
  tmRect: TRect;
  xTop: Integer;
  xIniTop: Integer;
begin
  // localiza o Handle da janela iniciar
  BarraIniciar := StrToInt(EditHandle.Text);
  //BarraIniciar := FindWindow('Shell_TrayWnd', nil);

  // Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(BarraIniciar, tmRect);

  tmAltura := tmRect.Bottom - tmRect.Top;
  fAlertaMsn := TForm.Create(Self);

  with fAlertaMsn do
  begin
    Left := Screen.Width - ClientWidth;
    if tmRect.Top = -2 then
      tmAltura := 30;

    // Pega o top final
    xTop := Screen.Height - ClientHeight - tmAltura;

    // Pega o top inicial
    xIniTop := Screen.Height + ClientHeight + tmAltura;
    Top := xIniTop;

    for I := xIniTop downto xTop do
    begin
      Top := Top - 1;
      Show;
      Update;
      Application.ProcessMessages;
      Sleep(1);
    end;

    Sleep(2000);

    for I := xTop to xIniTop do
    begin
      Top := Top + 1;
      Show;
      Update;
      Application.ProcessMessages;
      Sleep(1);
    end;

    Close;
    FreeAndNil(fAlertaMsn);
  end;
end;


procedure TfrmPrincipalMensagens.ButtonPerformClick(Sender: TObject);
begin
  Caption := IntToStr(Self.Perform(WM_AVISO, 333, 1111));
end;

procedure TfrmPrincipalMensagens.ButtonShakeClick(Sender: TObject);

  procedure WindowShake(wHandle: THandle);
  const
    MAXDELTA = 4;
    SHAKETIMES = 500;
  var
    oRect, wRect :TRect;
    deltax: integer;
    deltay: integer;
    cnt: integer;
    dx, dy: integer;
  begin
    //lembre da posição original
    GetWindowRect(wHandle,wRect);
    oRect := wRect;
    Randomize;
    for cnt := 0 to SHAKETIMES do
    begin
      deltax := Round(Random(MAXDELTA));
      deltay := Round(Random(MAXDELTA));
      dx := Round(1 + Random(2));
      if dx = 2 then
        dx := -1;
        dy := Round(1 + Random(2));
        if dy = 2 then
          dy := -1;
          OffsetRect(wRect,dx * deltax, dy * deltay);
          MoveWindow(wHandle, wRect.Left,wRect.Top,wRect.Right -
          wRect.Left,wRect.Bottom - wRect.Top,true);
    end;
    //returna à posição de início
    MoveWindow(wHandle, oRect.Left,oRect.Top,oRect.Right -
    oRect.Left,oRect.Bottom - oRect.Top,true);
  end;

begin
  WindowShake(StrToInt(EditHandle.Text));
end;

procedure TfrmPrincipalMensagens.ButtonWinClassClick(Sender: TObject);
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

procedure TfrmPrincipalMensagens.Button1Click(Sender: TObject);
begin
  OldWndProc := TFarProc(GetWindowLongPtr(StrToInt(EditHandle.Text), GWL_WNDPROC));
//  NewWndProc := MakeObjectInstance(HookWndProc);
  SetWindowLongPtr(StrToInt(EditHandle.Text), GWL_WNDPROC, LongInt(@HookWndProc));
  Caption := 'Ok - ' + TimeToStr(Now);
end;

procedure TfrmPrincipalMensagens.Button2Click(Sender: TObject);
var
  lVal: Integer;
  lResultado: LRESULT;
begin
  lVal := Random(10000);
  {lResultado :=  }PostMessage( StrToInt(EditHandle.Text) , WM_AVISO, lVal, 0);
  Caption := lVal.ToString + ' - ' + lResultado.ToString;
end;

procedure TfrmPrincipalMensagens.ButtonAvisoClick(Sender: TObject);
begin
  ShowMessage('Clicado');
end;

procedure TfrmPrincipalMensagens.ButtonCloseClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandle.Text) , WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipalMensagens.ButtonCustomAvisoClick(Sender: TObject);
var
  lVal: Integer;
  lResultado: LRESULT;
begin
  lVal := Random(10000);
  lResultado := SendMessage( StrToInt(EditHandle.Text) , WM_AVISO, lVal, 0);
  Caption := lVal.ToString + ' - ' + lResultado.ToString;
end;

procedure TfrmPrincipalMensagens.ButtonSendClickClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONDOWN, 0, 0);
  Sleep(100);
  SendMessage( StrToInt(EditHandle.Text) , WM_LBUTTONUP, 0, 0);
end;

procedure TfrmPrincipalMensagens.CheckBoxBuscaClick(Sender: TObject);
begin
  TimerBusca.Enabled := CheckBoxBusca.Checked;
end;

procedure TfrmPrincipalMensagens.FormCreate(Sender: TObject);
begin
  FListaWindows := TDictionary<string, THandle>.Create;
end;

procedure TfrmPrincipalMensagens.FormDestroy(Sender: TObject);
begin
  FListaWindows.Free;
end;

procedure TfrmPrincipalMensagens.ListBoxHandlesClick(Sender: TObject);
begin
  if ((FListaWindows.Count > 0) and (FListaWindows.ContainsKey(ListBoxHandles.Items[ListBoxHandles.ItemIndex]))) then
  begin
    EditHandle.Text := IntToStr(FListaWindows[ListBoxHandles.Items[ListBoxHandles.ItemIndex]]);
  end;
end;

procedure TfrmPrincipalMensagens.TimerAvisoTimer(Sender: TObject);
begin
  TimerAviso.Enabled := False;
  ShowMessage('Aviso "' + FWAviso.ToString + '" recebido.');
end;

procedure TfrmPrincipalMensagens.TimerBuscaTimer(Sender: TObject);
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
          ListBoxHandles.Items.Add(lCaption + ' - ' + lClassName);
          FListaWindows.Add(lCaption + ' - ' + lClassName, lHandle);
        end else if lClassName <> '' then
        begin
          ListBoxHandles.Items.Add(lClassName);
          FListaWindows.Add(lClassName, lHandle);
        end else begin
          ListBoxHandles.Items.Add(IntToStr(lHandle));
          FListaWindows.Add(IntToStr(lHandle), lHandle);
        end;
      end else begin
        ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(IntToStr(lHandle));
      end;
    end else begin
      ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(lClassName);
    end;
  end else begin
    ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(lCaption + ' - ' + lClassName);
  end;
end;

procedure TfrmPrincipalMensagens.WMAVISO(var Message: TMessage);
begin
  //Sleep(6000);
  FWAviso := Message.WParam;
  Message.Result := 321;
  TimerAviso.Enabled := True;
end;

end.
