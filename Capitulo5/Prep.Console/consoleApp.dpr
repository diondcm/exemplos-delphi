program consoleApp;

uses
  WinApi.Windows,
  System.Win.ComObj,
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  DateUtils,
  Data.DB,
  Teste.Arq in 'Teste.Arq.pas';


type
  ITeste = interface

  end;

  ITeste2 = interface(IInterface)

  end;

  function NovoTeste(pValor: ShortInt): integer; overload;
  begin
    Writeln('Short');
    Result := 3;
  end;

  function NovoTeste(pValor: Integer): integer; overload;
  begin
    Writeln('Integer');
    Result := 3;
  end;

type
  TMeArr = array of integer;

  function TesteArrInt: TMeArr;
  begin
    Writeln('TesteIf1');
    Result := [3];
  end;

  function TesteIf1: integer;
  begin
    Writeln('TesteIf1');
    Result := 3;
  end;

  function TesteIf2: integer;// dynamic - fake;  // register; //cdecl; // stdcall;
  begin
    Writeln('FFFFFF');
    Result := 2;
  end;

resourcestring
  CreateError = 'Cannot create file %s';

var
  lp: TPoint;
  lStr: string;
  lStr2: string;
  &Type: Integer;
  lVarInt1: Pointer;
  lVarInt2: Integer;
  lSt: TStrings;
  lStl: TStringList;
  Word: Variant;
  lA: Char;
  lValorData: Double;
begin
  //DateTimeToUnix()

//  AllocMem()
//  FreeMemory()

//  GetMem();
//  FreeMem();

//  StrAlloc()
//  StrDispose();

  NovoTeste(5000);
//  lValorData := 25;
//  DateTimeToString('', lValorData);

//  lA := 'A';
//  lVarInt1 := @lVarInt2;
  //lVarInt2.ToString
//  Integer(lVarInt1^) := 50;

//  Writeln('A at: $' +Format('%p', [@lA]));
//  Writeln('Var2 at: $' +Format('%p', [@lVarInt2]));
//  Writeln('Val2: ' + Format('%d', [lVarInt2]));

//  if {(lA = '') and} (TesteIf1 = 3) and (TesteIf2 = 2) then
//  begin
//    Beep
//  end else begin
//    Writeln('Beep');
//  end;

  //if Assgned(FObj) and (FObj.Nome = '') then

//  begin
//    begin
//      begin
//        begin
//        end;
//      end;
//    end;
//  end;


  TMynhaClass.FTexto := 'Teste';
//  TMynhaClass.FCodigo := 0;
  Writeln('Teste');
  Writeln(DateTimeToStr(IncDay(0, -1)));

//  Word := CreateOleObject('Word.Basic');
//  Word.FileNew('Normal');
//  Word.Insert('This is the first line'#13);
//  Word.Insert342('This is the second line'#13);
//  Word.FileSaveAs('c:\temp\test.txt', 3);

//  lSt := TStringList.Create;
//  lSt := TStrings.Create;
//  try
//    if (lSt is TStringList) then
//    begin
//      lStl := TStringList(lSt);
//      TStringList(lSt).OwnsObjects := True; // type cast c-style
//    end;
//    (lSt as TStringList).OwnsObjects := True; // safe
//  finally
//    lSt.Free;
//  end;

  {$IFDEF Win32Platform}
  asm
    mov eax, 2;
  end;
  {$ENDIF}



//  lStr := 'ABC';
//  lStr2 := 'abc';
//  Writeln(lStr(.2.));
//  if lStr = lStr2 then
//    Writeln('Igual')
//  else
//    Writeln('Diff');

  (*
  {
  Ctrl + ;(Teclado pt) /


  }
  *)
 // TObject.Create;
  Readln;
end.
