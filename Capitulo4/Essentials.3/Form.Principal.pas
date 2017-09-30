unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Generics.Collections;

type
  TForm1 = class(TForm)
    buttonSingleRandom: TButton;
    Memo1: TMemo;
    editRange: TEdit;
    editLoops: TEdit;
    buttomMultiRandom: TButton;
    Button1: TButton;
    procedure buttonSingleRandomClick(Sender: TObject);
    procedure buttomMultiRandomClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ComparaLoops(pRange, pContador: Integer; pMultiRandom: Boolean);
    procedure ComparaLoopsThr(pRange, pContador: Integer; pMultiRandom: Boolean);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.buttomMultiRandomClick(Sender: TObject);
begin
  ComparaLoops(StrToInt(editRange.Text), StrToInt(editLoops.Text), True);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ComparaLoopsThr(StrToInt(editRange.Text), StrToInt(editLoops.Text), True);
end;

procedure TForm1.buttonSingleRandomClick(Sender: TObject);
begin
  ComparaLoops(StrToInt(editRange.Text), StrToInt(editLoops.Text), False);
end;

procedure TForm1.ComparaLoops;
var
  lListaInt: TList<Integer>;
  lRange: Integer;
  lContador: Integer;
  lRepeticoes: Integer;
  lInicio: Int64;
  i: Integer;
  ltempValor: Integer;
  lFim: Int64;
  lfrequency64: Int64;
  lMiliSecs: Extended;
begin
  lListaInt := TList<Integer>.Create;
  lRange := pRange;
  lContador := pContador;
  lRepeticoes := 0;
  // ['{A4FBF59F-1A00-4315-A84F-53780DBD3A1C}']
  // ['{9FB23AA9-A199-45A4-BD64-A27EE63C3D09}']
  // Sift + Ctrl + G
  QueryPerformanceCounter(lInicio);
  for i := 1 to lContador do
  begin
    if pMultiRandom then
    begin
      ltempValor := Random(Random(Random(lRange)));
    end else begin
      ltempValor := Random(lRange);
    end;

    if lListaInt.Contains(ltempValor) then
    begin
      Inc(lRepeticoes);
    end else begin
      lListaInt.Add(ltempValor);
    end;
  end;
  QueryPerformanceCounter(lFim);
  QueryPerformanceFrequency(lfrequency64);
  lMiliSecs := 1000 * (lFim - lInicio) / lfrequency64;

  Memo1.Lines.Add('');
  Memo1.Lines.Add('MultiRandom: ' + BoolToStr(pMultiRandom, True));
  Memo1.Lines.Add('Range: ' + lRange.ToString);
  Memo1.Lines.Add('Número de Loops: ' + lContador.ToString);
  Memo1.Lines.Add('Número de repetições: ' + lRepeticoes.ToString);
  Memo1.Lines.Add('Tempo despendido: ' + lMiliSecs.ToString);

  lListaInt.Free;
end;

procedure TForm1.ComparaLoopsThr(pRange, pContador: Integer;
  pMultiRandom: Boolean);
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      lListaInt: TList<Integer>;
      lRange: Integer;
      lContador: Integer;
      lRepeticoes: Integer;
      lInicio: Int64;
      i: Integer;
      ltempValor: Integer;
      lFim: Int64;
      lfrequency64: Int64;
      lMiliSecs: Extended;
    begin
      lListaInt := TList<Integer>.Create;
      lRange := pRange;
      lContador := pContador;
      lRepeticoes := 0;
      // ['{A4FBF59F-1A00-4315-A84F-53780DBD3A1C}']
      // ['{9FB23AA9-A199-45A4-BD64-A27EE63C3D09}']
      // Sift + Ctrl + G
      QueryPerformanceCounter(lInicio);
      for i := 1 to lContador do
      begin
        if pMultiRandom then
        begin
          ltempValor := Random(Random(Random(lRange)));
        end else begin
          ltempValor := Random(lRange);
        end;

        if lListaInt.Contains(ltempValor) then
        begin
          Inc(lRepeticoes);
        end else begin
          lListaInt.Add(ltempValor);
        end;
      end;
      QueryPerformanceCounter(lFim);
      QueryPerformanceFrequency(lfrequency64);
      lMiliSecs := 1000 * (lFim - lInicio) / lfrequency64;

      TThread.Synchronize(nil,
        procedure
        begin
          Memo1.Lines.Add('');
          Memo1.Lines.Add('MultiRandom: ' + BoolToStr(pMultiRandom, True));
          Memo1.Lines.Add('Range: ' + lRange.ToString);
          Memo1.Lines.Add('Número de Loops: ' + lContador.ToString);
          Memo1.Lines.Add('Número de repetições: ' + lRepeticoes.ToString);
          Memo1.Lines.Add('Tempo despendido: ' + lMiliSecs.ToString);
        end);

      lListaInt.Free;
    end).Start;
end;

end.
