unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.DBCtrls, Data.DB, Vcl.Mask, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    MemoLog: TMemo;
    FlowPanel1: TFlowPanel;
    ButtonStack: TButton;
    ButtonHeap: TButton;
    ButtonVars: TButton;
    ButtonErroStack: TButton;
    ButtonVariants: TButton;
    procedure ButtonErroStackClick(Sender: TObject);
    procedure ButtonStackClick(Sender: TObject);
    procedure ButtonHeapClick(Sender: TObject);
    procedure ButtonVarsClick(Sender: TObject);
    procedure ButtonVariantsClick(Sender: TObject);
  private
    FData: TDateTime;
    FCurr: Currency;
    FInt: Integer;
    FStr: string;
    FObj: TObject;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonVariantsClick(Sender: TObject);
var
  lVariant: Variant;
begin
  lVariant := Null;
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var is Null');
  end;
  if VarIsEmpty(lVariant) then
  begin
    MemoLog.Lines.Add('Var null is Empty');
  end;

  lVariant := ''; // 0 - Integer; '' - string
  if VarIsNull(lVariant) then
  begin
    MemoLog.Lines.Add('Var '''''''' is Null'); // não vai ser null
  end;
  if VarIsEmpty(lVariant) then// não vai ser Empty
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

  lVariant := Unassigned; // Para OleVars principalmente
end;

procedure TfrmPrincipal.ButtonVarsClick(Sender: TObject);
var
  lProc: TProc;
  lPrint: TProc;
begin
  begin
    var lCount: Integer := 0;

    lProc:=
      procedure
      begin
        lCount := lCount + 1;
      end;

    lPrint :=
      procedure
      begin
        MemoLog.Lines.Add('Count: ' + IntToStr(lCount));
      end;

    lProc;
    lProc;
    lProc;
  end;

  // lCount := 1;

  lProc;
  lProc;

  lPrint;
//  MemoLog.Lines.Add('Count: ' + IntToStr(lCount));
end;

procedure TfrmPrincipal.ButtonErroStackClick(Sender: TObject);
begin
  ButtonErroStackClick(Sender);
end;

procedure TfrmPrincipal.ButtonHeapClick(Sender: TObject);
begin
  MemoLog.Lines.Add('Valores na Heap');
  MemoLog.Lines.Add('Data: ' + DateTimeToStr(FData));
  MemoLog.Lines.Add('Curr: ' + FloatToStr(FCurr));
  MemoLog.Lines.Add('Int: ' + IntToStr(FInt));
  MemoLog.Lines.Add('Str: ' + FStr);
  MemoLog.Lines.Add('Obj: ' + Format('$%p', [Pointer(FObj)]));
  FObj.Free;
end;

procedure TfrmPrincipal.ButtonStackClick(Sender: TObject);
var
  lData: TDateTime;
  lCurr: Currency;
  lInt: Integer;
  lStr: string;
  lObj: TObject;
begin
  MemoLog.Lines.Add('Valores na Stack');
  MemoLog.Lines.Add('Data: ' + DateTimeToStr(lData));
  MemoLog.Lines.Add('Curr: ' + FloatToStr(lCurr));
  MemoLog.Lines.Add('Int: ' + IntToStr(lInt));
  MemoLog.Lines.Add('Str: ' + lStr);
  lObj := nil;
  MemoLog.Lines.Add('Obj: ' + Format('$%p', [Pointer(lObj)]));
  lObj.Free;
end;

end.
