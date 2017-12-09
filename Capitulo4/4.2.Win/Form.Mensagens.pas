unit Form.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

const
  C_BASE = WM_APP + 456;
  WM_PRIVADO_AVISO = C_BASE + 1;
  WM_PRIVADO_SAIR = C_BASE + 2;
  WM_PRIVADO_MAXIMIZAR = C_BASE + 3;

type
  TControlLocal = class(Vcl.Controls.TControl);

  THandleComponente = class;

  TProcessaHandle = reference to procedure (pHC: THandleComponente);

  THandleComponente = class(TComponent)
  private
    FHandle: THandle;
    FTextComponente: string;
    FNomeClasse: string;
  public
    constructor Create(AOwner: TComponent; AHandle: THandle; AText, ANomeClasse: string); reintroduce;
    property Handle: THandle read FHandle write FHandle;
    property TextComponente: string read FTextComponente write FTextComponente;
    property NomeClasse: string read FNomeClasse write FNomeClasse;
  end;

  TfrmMensagens = class(TForm)
    listBoxJanelas: TListBox;
    Splitter1: TSplitter;
    timerCaptura: TTimer;
    panelControles: TPanel;
    buttonAlteraTexto: TButton;
    checkAtivarCaptura: TCheckBox;
    buttonGetHandle: TButton;
    editText: TEdit;
    buttonClose: TButton;
    buttonMoveJanela: TButton;
    buttonTravaJanela: TButton;
    buttonFechaJanelaPost: TButton;
    Button1: TButton;
    buttonEnviaAviso: TButton;
    buttonEnviaAvisoPost: TButton;
    buttonMaximizar: TButton;
    buttonPerform: TButton;
    procedure buttonGetHandleClick(Sender: TObject);
    procedure checkAtivarCapturaClick(Sender: TObject);
    procedure timerCapturaTimer(Sender: TObject);
    procedure buttonAlteraTextoClick(Sender: TObject);
    procedure buttonCloseClick(Sender: TObject);
    procedure buttonMoveJanelaClick(Sender: TObject);
    procedure buttonTravaJanelaClick(Sender: TObject);
    procedure buttonFechaJanelaPostClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buttonEnviaAvisoClick(Sender: TObject);
    procedure buttonEnviaAvisoPostClick(Sender: TObject);
    procedure buttonMaximizarClick(Sender: TObject);
    procedure buttonPerformClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    procedure ExecutaAcaoJanela(pProc: TProcessaHandle);
    procedure MouseDownControles(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    procedure WmMeuAviso(var Msg: TMessage); message WM_PRIVADO_AVISO;
    procedure WmMeuMaximizar(var Msg: TMessage); message WM_PRIVADO_MAXIMIZAR;
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

procedure TfrmMensagens.Button1Click(Sender: TObject);
begin
//  RegisterWindowMessage()
end;

procedure TfrmMensagens.buttonAlteraTextoClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      SetWindowText(pHc.Handle, editText.Text);
    end);
end;

procedure TfrmMensagens.buttonCloseClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      SendMessage(pHC.Handle, WM_CLOSE, 0, 0);
    end);
end;

procedure TfrmMensagens.buttonEnviaAvisoClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      SendMessage(pHC.Handle, WM_PRIVADO_AVISO, 0, 0);
    end);
end;

procedure TfrmMensagens.buttonEnviaAvisoPostClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      PostMessage(pHC.Handle, WM_PRIVADO_AVISO, 0, 0);
    end);
end;

procedure TfrmMensagens.buttonFechaJanelaPostClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      PostMessage(pHC.Handle, WM_CLOSE, 0, 0);
    end);
end;

procedure TfrmMensagens.buttonGetHandleClick(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: Cardinal;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);

  listBoxJanelas.Items.Add(IntToStr(lHandle));
end;

procedure TfrmMensagens.buttonMaximizarClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    var
      lResultado: LRESULT;
    begin
      lResultado := SendMessage(pHC.Handle, WM_PRIVADO_MAXIMIZAR, 0, 0);
      case lResultado of
        150: Caption := 'Maximizado';
        151: Caption := 'Já Maximizado'
      else
        Caption := 'Retorno Desconhecido(' + lResultado.ToString + ')';
      end;
    end);
end;

procedure TfrmMensagens.buttonMoveJanelaClick(Sender: TObject);
begin
  ExecutaAcaoJanela(
    procedure(pHC: THandleComponente)
    begin
      SetWindowPos(pHC.Handle, pHC.Handle, 10, 10, 300, 300, 0);
    end);
end;

procedure TfrmMensagens.buttonPerformClick(Sender: TObject);
begin
  Self.Perform(WM_PRIVADO_AVISO, 0, 0);
//  Self.Perform(WM_PRIVADO_AVISO_INI, 0, 0);
//  Self.Perform(WM_PRIVADO_AVISO_FIM, 0, 0);
end;

procedure TfrmMensagens.buttonTravaJanelaClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 100000 do
  begin
    Application.ProcessMessages;
    if Application.Terminated then
      Break;

    Sleep(40);
  end;
end;

{ THandleComponente }

constructor THandleComponente.Create(AOwner: TComponent; AHandle: THandle; AText, ANomeClasse: string);
begin
  inherited Create(AOwner);
  FHandle := AHandle;
  FTextComponente := AText;
  FNomeClasse := ANomeClasse
end;

procedure TfrmMensagens.checkAtivarCapturaClick(Sender: TObject);
begin
  timerCaptura.Enabled := checkAtivarCaptura.Checked;
end;

procedure TfrmMensagens.ExecutaAcaoJanela(pProc: TProcessaHandle);
var
  lHc: THandleComponente;
begin
  if (listBoxJanelas.ItemIndex <> -1) and Assigned(listBoxJanelas.Items.Objects[listBoxJanelas.ItemIndex]) then
  begin
    if listBoxJanelas.Items.Objects[listBoxJanelas.ItemIndex] is THandleComponente then
    begin
      lHc := THandleComponente(listBoxJanelas.Items.Objects[listBoxJanelas.ItemIndex]);
      if Assigned(pProc) then
        pProc(lHc);
    end else begin
      ShowMessage('Item Selecionado não é um HC: ' + listBoxJanelas.Items.Objects[listBoxJanelas.ItemIndex].QualifiedClassName);
    end;
  end else begin
    ShowMessage('Selecione um componente');
  end;
end;

procedure TfrmMensagens.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[i] is TWinControl then
    begin
      TControlLocal(Self.Components[i]).OnMouseDown := MouseDownControles;
    end;
  end;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    // Key preview
    SendMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    Key := 0;
  end;
end;

procedure TfrmMensagens.MouseDownControles(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Sender is TWinControl then
  begin
    ReleaseCapture;
    PostMessage(TWinControl(Sender).Handle, WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TfrmMensagens.timerCapturaTimer(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: Cardinal;
  lCaption: array [0..255] of Char;
  lNomeClasse: string;
  lText: string;
  lhc: THandleComponente;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);

  Winapi.Windows.GetClassName(lHandle, @lCaption, Length(lCaption));
  lNomeClasse := string(lCaption);

  Winapi.Windows.GetWindowText(lHandle, @lCaption, Length(lCaption));
  lText := string(lCaption);

  lhc := THandleComponente.Create(Self, lHandle, lNomeClasse, lText);
  listBoxJanelas.Items.InsertObject(0, FormatFloat('$#######0', lHandle) + ' - ' + lText, lhc);
end;

procedure TfrmMensagens.WmMeuAviso(var Msg: TMessage);
begin
  ShowMessage('Aviso Recebido');
end;

procedure TfrmMensagens.WmMeuMaximizar(var Msg: TMessage);
begin
  Msg.Result := 150;
  case Self.WindowState of
    TWindowState.wsMinimized,
    TWindowState.wsNormal: Self.WindowState := TWindowState.wsMaximized;
    TWindowState.wsMaximized: Msg.Result := 151;
  end;
end;

end.
