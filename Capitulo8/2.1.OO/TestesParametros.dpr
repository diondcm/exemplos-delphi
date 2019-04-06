program TestesParametros;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TRecCliente = record
    Nome: string;
    ID: Integer;
  end;

procedure ParametroDef(pStr: string; pInt: Cardinal; pCurr: Currency; pRecCliente: TRecCliente);
begin
  pStr := TimeToStr(now);
  pInt := 100;
  pCurr := 3.00;
  pRecCliente.Nome := 'Alterado';

  Writeln(Format('Valor pStr($%p): ' + pStr, [Pointer(pStr)]));
  Writeln(Format('Valor pInt($%p): ' + IntToStr(pInt), [@pInt]));
  Writeln(Format('Valor pCurr($%p): ' + CurrToStr(pCurr), [@pCurr]));
  Writeln(Format('Valor Rec($%p): ' + pRecCliente.Nome, [@pRecCliente]));
  Writeln('');
end;

procedure ParametroConst(const pStr: string; const pInt: Cardinal; const pCurr: Currency; const {[ref]} pRecCliente: TRecCliente);
begin
//  pStr := TimeToStr(now);
//  pInt := 100;
//  pCurr := 3.00;
//  pRecCliente.Nome := 'Const alt';

  Writeln(Format('Valor Const pStr($%p): ' + pStr, [Pointer(pStr)]));
  Writeln(Format('Valor Const pInt($%p): ' + IntToStr(pInt), [@pInt]));
  Writeln(Format('Valor Const pCurr($%p): ' + CurrToStr(pCurr), [@pCurr]));
  Writeln(Format('Valor Const Rec($%p): ' + pRecCliente.Nome, [@pRecCliente]));
  Writeln('');
end;


procedure ParametroVar(var pStr: string; var pInt: Cardinal; var pCurr: Currency; var pRecCliente: TRecCliente);
begin
  pStr := 'Teste Var';
  pInt := 342343;
  pCurr := 7843.98;
  pRecCliente.Nome := 'Var alt';

  Writeln(Format('Var pStr($%p): ' + pStr, [Pointer(pStr)]));
  Writeln(Format('Var pInt($%p): ' + IntToStr(pInt), [@pInt]));
  Writeln(Format('Var pCurr($%p): ' + CurrToStr(pCurr), [@pCurr]));
  Writeln(Format('Var Rec($%p): ' + pRecCliente.Nome, [@pRecCliente]));
  Writeln('');
end;

var
  lStr: string;
  lInt: Cardinal; // Integer, sem sinal
  lCurr: Currency;
  lRecCliente: TRecCliente;
begin
  try
    lStr := 'Teste';
    lInt := 30;
    lCurr := 43.9;
    lRecCliente.Nome := 'Nome inicial';

    ParametroDef(lStr, lInt, lCurr, lRecCliente);
    ParametroConst(lStr, lInt, lCurr, lRecCliente);
    ParametroVar(lStr, lInt, lCurr, lRecCliente);

    Writeln(Format('Valor final Str($%p): ' + lStr, [Pointer(lStr)]));
    Writeln(Format('Valor final Int($%p): ' + IntToStr(lInt), [@lInt]));
    Writeln(Format('Valor final Curr($%p): ' + CurrToStr(lCurr), [@lCurr]));
    Writeln(Format('Valor final Rec($%p): ' + lRecCliente.Nome, [@lRecCliente]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
