program Parametros;

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
    Writeln(Format('Ref Def: $%p', [@pRec]));
  end;

  procedure ParametroConstRec(const pRec: TRecCliente; const [Ref] pRecRef: TRecCliente);
  // http://docwiki.embarcadero.com/RADStudio/Tokyo/en/Parameters_%28Delphi%29#Constant_Parameters
  begin
    Writeln(Format('Ref Const: $%p', [@pRec]));
    Writeln(Format('Ref [Ref] Const: $%p', [@pRecRef]));
  end;

  procedure ParametroDef(pS: string; pI: Integer; pC: Currency);
  begin
    pS := 'Novo valo?';
    pI := pI div 2;
    pC := pC * 6;

    Writeln('Param Def');
    Writeln('Valor Str: ' + pS);
    Writeln('Valor Int: ' + IntToStr(pI));
    Writeln('Valor Curr: ' + FloatToStr(pC));

    Writeln(Format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(pS), @pI, @pC]));
    Writeln('');
  end;

  procedure ParametroConst(const pS: string; const {[Ref]} pI: Integer; const {[Ref]} pC: Currency);
  begin
//    pS := 'Novo valo?';
//    pI := pI div 2;
//    pC := pC * 6;

    Writeln('Param Const');
    Writeln('Valor Str: ' + pS);
    Writeln('Valor Int: ' + IntToStr(pI));
    Writeln('Valor Curr: ' + FloatToStr(pC));

    Writeln(Format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(pS), @pI, @pC]));
    Writeln('');
  end;

  procedure ParametroVar(var pS: string; var pI: Integer; var pC: Currency); //out >> Igual >> porém não considera o valor Inicial
  begin
    pS := 'Novo valo?';
    pI := pI div 2;
    pC := pC * 6;

    Writeln('Param Var');
    Writeln('Valor Str: ' + pS);
    Writeln('Valor Int: ' + IntToStr(pI));
    Writeln('Valor Curr: ' + FloatToStr(pC));

    Writeln(Format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(pS), @pI, @pC]));
    Writeln('');
  end;


var
  lStr: string;
  lInt: Cardinal;
  lCurr: Currency;
//  lRec: TRecCliente;
begin
  try
    lStr := 'Teste';
    lInt := 30;
    lCurr := 54.6;

    //
    ParametroDef(lStr, lInt, lCurr);
    ParametroConst(lStr, lInt, lCurr);
    ParametroVar(lStr, Integer(lInt), lCurr);
//      ParametroDefRec(lRec);
//      ParametroConstRec(lRec, lRec);

    //

//    Writeln('');
//    Writeln(Format('Rec: $%p', [@lRec]));
    Writeln('Valor final Str: ' + lStr);
    Writeln('Valor final Int: ' + IntToStr(lInt));
    Writeln('Valor final Curr: ' + FloatToStr(lCurr));
    Writeln(Format('Str: $%p '#10#13'Int: $%p '#10#13'Curr: $%p', [Pointer(lStr), @lInt, @lCurr]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
