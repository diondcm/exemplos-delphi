program Variaveis;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TRecCliente = record
    Nome: string;
    ID: Integer;
  end;

  procedure ParametroDefRec(pRec: TRecCliente);
  begin
    Writeln(format('Rec Def: $%p', [@pRec]));
  end;

  procedure ParametroConstRec(const [Ref] pRec: TRecCliente);
  begin
    Writeln(format('Rec Const: $%p', [@pRec]));
  end;

  procedure ParametroDefault(P1: string; p2: Integer; p3: Currency);
  begin
    P2 := 45 - P2;
    P1 := P1 + IntToStr(P2);
    Writeln(format('P1: %s P2: %d P3: %f', [P1, P2, P3]));
    Writeln(format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(P1), @P2, @P3]));
  end;

  procedure ParametroVar(var P1: string; var p2: Integer; var p3: Currency);
  //procedure ParametroVar(out P1: string; out p2: Integer; out p3: Currency);
  begin
    P2 := 45 - P2;
    P1 := P1 + IntToStr(P2);
    Writeln(format('P1: %s P2: %d P3: %f', [P1, P2, P3]));
    Writeln(format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(P1), @P2, @P3]));
  end;

  procedure ParametroConst(const P1: string; const p2: Integer; const p3: Currency);
  begin
//    P2 := 45 - P2;
//    P1 := P1 + IntToStr(P2);
    Writeln(format('P1: %s P2: %d P3: %f', [P1, P2, P3]));
    Writeln(format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(P1), Pointer(@P2), Pointer(@P3)]));
  end;

var
  lStr: string;
  lInt: Integer;
  lCurr: Currency;
  lRec: TRecCliente;
begin
  lStr := 'Olá';
  lInt := 12;
  lCurr := 23.7;
//  Writeln(format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(lStr), Pointer(@lInt), Pointer(@lCurr)]));
//  ParametroDefault(lStr, lInt, lCurr);
  //ParametroVar(lStr, lInt, lCurr);
  //ParametroVar('Olá', lInt, lCurr);
  //ParametroConst(lStr, lInt, lCurr);

  lRec.Nome := 'Teste';
  lRec.ID := 10;
  Writeln(format('Rec Var: $%p ', [@lRec]));
  ParametroDefRec(lRec);
  ParametroConstRec(lRec);

  Readln;
end.
