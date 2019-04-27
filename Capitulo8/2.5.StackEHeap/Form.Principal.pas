unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TRec = record
    ValorX: Integer;
    ValorY: Integer;
  end;

  TValores = class
    FValorInt: Integer;
    FObj: TObject;
    FData: TDate;
    FCurr: Currency;
  end;

  TfrmPrincipal = class(TForm)
    MemoLog: TMemo;
    PanelControles: TPanel;
    ButtonVars: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure ButtonVarsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  lI: Integer;
  lStr: string;
begin
//  lI := 342423;
//  lStr := '32423';
  Caption := lI.ToString + ' - ' + lStr;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  lVal: TValores;
begin
  MemoLog.Lines.Add('Valor na Heap');
  lVal := TValores.Create;

  MemoLog.Lines.Add('Date: ' + DateTimeToStr(lVal.FData));
  MemoLog.Lines.Add('Curr: ' + FloatToStr(lVal.FCurr));
  MemoLog.Lines.Add('Int: ' + lVal.FValorInt.ToString);
  MemoLog.Lines.Add('Ptr: ' + Format('$%p', [Pointer(lVal.FObj)]));

  lVal.Free;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  try
    Button3Click(Sender);
  except
    on E: Exception do
      Caption := E.Message;
  end;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
var
  lVariant: Variant;
begin
  lVariant := Null;
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var is Null');
  end;

  lVariant := '';
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var '''''''' is Null');
  end;
  if VarIsEmpty(lVariant) then
  begin
    MemoLog.Lines.Add('Var '''''''' is Empty');
  end;

  lVariant := 'Teste';
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var teste is Null');
  end;
  if VarIsEmpty(lVariant) then
  begin
    MemoLog.Lines.Add('Var teste is Empty');
  end;

  lVariant := 4353453;
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var 4353453 is Null');
  end;
  if VarIsEmpty(lVariant) then
  begin
    MemoLog.Lines.Add('Var 4353453 is Empty');
  end;
end;

procedure TfrmPrincipal.ButtonVarsClick(Sender: TObject);
var
  lValorInt: Integer;
  lObj: TObject;
  lData: TDate;
  lCurr: Currency;
begin
  MemoLog.Lines.Add('Valor na Stack');
  if Assigned(lObj) then
  begin
    MemoLog.Lines.Add('Ptr: ' + Format('$%p', [Pointer(lObj)]));
    lObj := nil;
  end;

  lObj.Free;

  MemoLog.Lines.Add('Date: ' + DateTimeToStr(lData));
  MemoLog.Lines.Add('Curr: ' + FloatToStr(lCurr));
  MemoLog.Lines.Add('Int: ' + IntToStr(lValorInt)); // lValorInt.ToString
end;

end.
