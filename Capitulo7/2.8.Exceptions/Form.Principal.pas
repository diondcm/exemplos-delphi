unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    memoLog: TMemo;
    panelControles: TPanel;
    buttonFinally: TButton;
    Splitter1: TSplitter;
    buttonExcept: TButton;
    procedure buttonFinallyClick(Sender: TObject);
    procedure buttonExceptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonExceptClick(Sender: TObject);
var
  lval: Integer;
  lVal1: Integer;
begin
  memoLog.Lines.Add(TimeToStr(now) + ' try');
  try
    //raise Exception.Create('Error Message');
    //Abort;
//    lVal1 := 0;
//    lval := Trunc(1/lVal1);
    StrToInt('FD');
    memoLog.Lines.Add(TimeToStr(now) + ' Linha 1');
    memoLog.Lines.Add(FloatToStr(lVal));
  except
    // não ocultar o erro
    on E: EDivByZero do
      memoLog.Lines.Add(TimeToStr(now) + ' Div');
    on E: EAbort do
      memoLog.Lines.Add(TimeToStr(now) + ' Abort');
    on E: Exception do
    begin
      memoLog.Lines.Add(TimeToStr(now) + ' Except');
    end;
  end;
end;

procedure TfrmPrincipal.buttonFinallyClick(Sender: TObject);
var
  lObj: TStringList;
begin
  lObj := TStringList.Create;
  memoLog.Lines.Add('try');
  try
    lObj.Add(TimeToStr(now) + 'Teste');
    //Exit;
    Abort;
    //Application.Terminate;
    //Halt; // único que não passa no finally
    memoLog.Lines.Add('Finally');
  finally
    lObj.SaveToFile('teste.txt');
    lObj.Free; // Semre será executado;
  end;
end;

end.
