program TiposEObjetos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, WinApi.Windows, System.Classes, System.IOUtils, System.Variants;

type
  TArr = array [0..4] of string;

  function RetornaArray: TArr;
  const
    TEST= '';
  type
    tipo_rec = record
      Valor: integer;
    end;

  begin


  end;

type
   TDateRec = record
     Year: Integer;
     Month: (Jan, Feb, Mar, Apr, May, Jun,
             Jul, Aug, Sep, Oct, Nov, Dec);
     Day: 1..31;
   end;


var
  //lValor: Currency; // 4 casas
  lValor: Double; // 名
  lAnsi: Ansistring;
  名, i: Integer;

  lArr: array [0..0] of array [0..40] of string;
  lArrP: packed array of char;

  Arq: File of TDateRec;
  Arq2: TextFile;
  lStl: TStringList;
//  lBol: Boolean;

  lData: TDateRec;
  lI: IEnumerator;

//  n: Variant;
  lStr: string;
  lStr2: string[30];
  lVarD:  TVarData;
  lp: TPoint;
  lVar: Variant;
begin
  try
    lVar := null;
//    lvar := Integer(Pointer(TStringList.Create));
    lvar := lData;
    lvar := lI;

    // VarIsClear()
//    VarIsEmpty() // ''
//    VarIsNull()
//    VarToStr(lVar);
//    lInt := lVar;




    名 := 1;
    lData.Year := 2018;
    //i.ToString

    //RetornaArray

//    BoolToStr()
//    S_OK

    lStr:= 'teste名 char' + CHar(67) + #66;
    Writeln(lStr + lStr2[0]);
    Writeln(Ord('F'));
    lAnsi := 'Outro Teste';
    Write(lAnsi[1] + ' - '); // lAnsi[0] => Erro
    Writeln(SizeOf(lAnsi[1]));

    Write(lStr[1] + ' - ');  // lStr[0] => Erro
    Writeln(SizeOf(lStr[1]));

//    lStl.LoadFromFile();

    Readln(Arq2, lStr);
    Write(Arq, lData);


//    string(PCHar[0])[1]
//    StrPas(PCHar)

    // PChar()// agora unicode, no sistema OP WideFunctions, antes as functions ansi; CNAB
    // for i := 1 to Length(lStr) + SizeOf(Char){ 4 antes = 2} do


    lValor := 0.00001;
    if (lValor - 0.00001) > 0.0001 then
    begin
      Write('Teste');
      Writeln('Outro teste');
    end;



    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
