program ParametrosOO;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TRecCliente = record
    Codigo: Integer;
    Nome: string;
  end;

// IEEE -> Float
// Intel 8086/87 -> Integers
// Delphi -> string, record

//  Writeln(Format('Var pStr($%p): ' + pStr, [Pointer(pStr)]));
//
//procedure ParametroVar(const pStr: string; const pInt: Cardinal; const pCurr: Currency; const pRecCliente: TRecCliente);
//procedure ParametroVar(pStr: string; pInt: Cardinal; pCurr: Currency; pRecCliente: TRecCliente);

// referência -> mesma var
procedure ParametroVar(var{out} pStr: string; var pInt: Cardinal; var pFloat: Currency; var pCli: TRecCliente);
begin
  Writeln('');
  Writeln(Format('pInt INI($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
  Writeln(Format('pFloat INI($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
  Writeln(Format('pStr INI($%p): ' + pStr, [Pointer(@pStr)]));
  Writeln(Format('pCli INI($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
  Writeln('');

  pInt := 67890;
  pFloat := 9876.54;
  pStr := 'Alterado string de teste';
  pCli.Codigo := 2;
  pCli.Nome := 'B';
  Writeln('Valores alterados');

  Writeln('');
  Writeln(Format('pInt FIM($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
  Writeln(Format('pFloat FIM($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
  Writeln(Format('pStr FIM($%p): ' + pStr, [Pointer(@pStr)]));
  Writeln(Format('pCli FIM($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
  Writeln('');
end;

// Valor -> outra var(depende)
procedure ParametroConst(const pStr: string; const pInt: Cardinal; const pFloat: Currency; const pCli: TRecCliente);
begin
  Writeln('');
  Writeln(Format('pInt INI($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
  Writeln(Format('pFloat INI($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
  Writeln(Format('pStr INI($%p): ' + pStr, [Pointer(@pStr)]));
  Writeln(Format('pCli INI($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
  Writeln('');

//  pInt := 67890;
//  pFloat := 9876.54;
//  pStr := 'Alterado string de teste';
//  pCli.Codigo := 2;
//  pCli.Nome := 'B';
  Writeln('Valores não alterados');

  Writeln('');
//  Writeln(Format('pInt FIM($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
//  Writeln(Format('pFloat FIM($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
//  Writeln(Format('pStr FIM($%p): ' + pStr, [Pointer(@pStr)]));
//  Writeln(Format('pCli FIM($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
//  Writeln('');
end;

// Valor -> mas permite alteração
procedure Parametro(pStr: string; pInt: Cardinal; pFloat: Currency; pCli: TRecCliente);
begin
  Writeln('');
  Writeln(Format('pInt INI($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
  Writeln(Format('pFloat INI($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
  Writeln(Format('pStr INI($%p): ' + pStr, [Pointer(@pStr)]));
  Writeln(Format('pCli INI($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
  Writeln('');

  pInt := 67890;
  pFloat := 9876.54;
  pStr := 'Alterado string de teste';
  pCli.Codigo := 2;
  pCli.Nome := 'B';
  Writeln('Valores nao alterados');

  Writeln('');
  Writeln(Format('pInt FIM($%p): ' + IntToStr(pInt), [Pointer(@pInt)]));
  Writeln(Format('pFloat FIM($%p): ' + FloatToStr(pFloat), [Pointer(@pFloat)]));
  Writeln(Format('pStr FIM($%p): ' + pStr, [Pointer(@pStr)]));
  Writeln(Format('pCli FIM($%p): ' + IntToStr(pCli.Codigo) + ' - ' + pCli.Nome, [Pointer(@pCli)]));
  Writeln('');
end;

var
  lInt: Cardinal; // Int, Short...
  lFloat: Currency; //Double, Single, Real
  lStr: string;
  lCli: TRecCliente; // record
begin
  try
    lInt := 12345;
    lFloat := 543.21;
    lStr := 'string de teste';
    lCli.Codigo := 1;
    lCli.Nome := 'A';

    Writeln(Format('lInt($%p): ' + IntToStr(lInt), [Pointer(@lInt)]));
    Writeln(Format('lFloat($%p): ' + FloatToStr(lFloat), [Pointer(@lFloat)]));
    Writeln(Format('lStr($%p): ' + lStr, [Pointer(@lStr)]));
    Writeln(Format('lCli($%p): ' + IntToStr(lCli.Codigo) + ' - ' + lCli.Nome, [Pointer(@lCli)]));
    Writeln('');

//    ParametroVar(lStr, lInt, lFloat, lCli);
//    ParametroConst(lStr, lInt, lFloat, lCli);
    Parametro(lStr, lInt, lFloat, lCli);

    Writeln('');
    Writeln(Format('FINAL: lInt($%p): ' + IntToStr(lInt), [Pointer(@lInt)]));
    Writeln(Format('FINAL: lFloat($%p): ' + FloatToStr(lFloat), [Pointer(@lFloat)]));
    Writeln(Format('FINAL: lStr($%p): ' + lStr, [Pointer(@lStr)]));
    Writeln(Format('FINAL: lCli($%p): ' + IntToStr(lCli.Codigo) + ' - ' + lCli.Nome, [Pointer(@lCli)]));
    Writeln('');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
