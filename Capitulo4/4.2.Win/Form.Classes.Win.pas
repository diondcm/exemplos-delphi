unit Form.Classes.Win;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmClassesWin = class(TForm)
    buttonCriaJanela: TButton;
    procedure buttonCriaJanelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  end;

var
  frmClassesWin: TfrmClassesWin;

implementation

{$R *.dfm}

var
  NovaClasse: TWndClass;
  lFormWin: HWND;
  lEdtHandle: HWND;
  lBtnHandle: HWND;

  procedure ClickButtonWin;
  var
    lText: array [0..255] of Char;
  begin
    GetWindowText(lEdtHandle, lText, Length(lText));
    MessageBox(lFormWin, PChar('Você digitou: "' + lText + '"'), 'Info', MB_APPLMODAL or MB_ICONINFORMATION + MB_OK);
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


procedure TfrmClassesWin.buttonCriaJanelaClick(Sender: TObject);
begin
//   SetWindowLong(hwnd, GWL_WNDPROC, myNewWndProc);

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

//  RegisterClass();
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

  Caption := IntToStr(lFormWin);

  ShowWindow(lFormWin, SW_SHOWNORMAL);
end;

procedure TfrmClassesWin.WMSysCommand(var Message: TWMSysCommand);
begin
  if (Message.CmdType and $FFF0 = SC_MINIMIZE) then
    Application.Minimize
  else
    inherited;
end;

end.
