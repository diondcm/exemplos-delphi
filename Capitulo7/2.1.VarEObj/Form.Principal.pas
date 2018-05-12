unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCasa = class(TComponent)
  private
    FLog: TStrings;
    FTamanho: Integer;
    function GetTamanho: Integer;
    procedure SetTamanho(const Value: Integer);
  public
    constructor Create(pLog: TStrings); overload;
    constructor Create(AOwner: TComponent; pLog: TStrings); overload;

    destructor Destroy; override;
    property Tamanho: Integer read GetTamanho write SetTamanho;
  end;

  TfrmPrincipal = class(TForm)
    memoLog: TMemo;
    panelControles: TPanel;
    buttonExemploObj: TButton;
    buttonLerObjGlobal: TButton;
    buttonGlobalCreate: TButton;
    ButtonGlobalFree: TButton;
    procedure buttonExemploObjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonLerObjGlobalClick(Sender: TObject);
    procedure buttonGlobalCreateClick(Sender: TObject);
    procedure ButtonGlobalFreeClick(Sender: TObject);
  private
    FCasa: TCasa;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TCasa }

constructor TCasa.Create(pLog: TStrings);
begin
  FLog := pLog;
  FLog.Add(IntToStr(GetTickCount) + ' - Create - Casa');
end;

constructor TCasa.Create(AOwner: TComponent; pLog: TStrings);
begin
  inherited Create(AOwner);
  FLog := pLog;
end;

destructor TCasa.Destroy;
begin
//  FLog.Add(IntToStr(GetTickCount) + ' - Destroy');
  inherited;
end;

function TCasa.GetTamanho: Integer;
begin
  Result := FTamanho;
  FLog.Add(IntToStr(GetTickCount) + ' - Get');
end;

procedure TCasa.SetTamanho(const Value: Integer);
begin
  FTamanho := Value;
  FLog.Add(IntToStr(GetTickCount) + ' - Set');
end;

procedure TfrmPrincipal.buttonLerObjGlobalClick(Sender: TObject);
begin
  if Assigned(FCasa) { FCasa = nil } then
    Caption := IntToStr(FCasa.Tamanho);
end;

procedure TfrmPrincipal.buttonGlobalCreateClick(Sender: TObject);
begin
  if not Assigned(FCasa) then
    FCasa := TCasa.Create(memoLog.Lines);
end;

procedure TfrmPrincipal.ButtonGlobalFreeClick(Sender: TObject);
begin
  FreeAndNil(FCasa);
  //FCasa.Free;
end;

procedure TfrmPrincipal.buttonExemploObjClick(Sender: TObject);
var
  lCasa: TCasa;
begin
//  lCasa := TCasa.Create(memoLog.Lines);
////  FCasa := lCasa;
//  lCasa.Tamanho := 50;
//  lCasa.Free; // não chamar o Destroy

  lCasa := TCasa.Create(Self, memoLog.Lines);
  lCasa.Tamanho := 50;
//  lCasa.Free; // não chamar o Destroy
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := {$WARNINGS OFF} DebugHook > 0 {$WARNINGS ON}; { ou True}
  {$ENDIF}
end;

end.
