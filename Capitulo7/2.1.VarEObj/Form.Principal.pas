unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCasa = class
  private
    FLog: TStrings;
    FTamanho: Integer;
    function GetTamanho: Integer;
    procedure SetTamanho(const Value: Integer);
  public
    constructor Create(pLog: TStrings);
    destructor Destroy; override;
    property Tamanho: Integer read GetTamanho write SetTamanho;
  end;

  TfrmPrincipal = class(TForm)
    memoLog: TMemo;
    panelControles: TPanel;
    buttonExemploObj: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure buttonExemploObjClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

destructor TCasa.Destroy;
begin
  FLog.Add(IntToStr(GetTickCount) + ' - Destroy');
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

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  if Assigned(FCasa) { FCasa = nil } then
    Caption := IntToStr(FCasa.Tamanho);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  if not Assigned(FCasa) then
    FCasa := TCasa.Create(memoLog.Lines);
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  FreeAndNil(FCasa);
  //FCasa.Free;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  TButton.Create(nil);
end;

procedure TfrmPrincipal.buttonExemploObjClick(Sender: TObject);
var
  lCasa: TCasa;
begin
  lCasa := TCasa.Create(memoLog.Lines);
//  FCasa := lCasa;
  lCasa.Tamanho := 50;
  lCasa.Free; // não chamar o Destroy
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := {$WARNINGS OFF} DebugHook > 0 {$WARNINGS ON}; { ou True}
  {$ENDIF}
end;

end.
