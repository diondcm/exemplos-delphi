program testParams;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Cliente in 'Classe.Cliente.pas',
  Classe.Parametros in 'Classe.Parametros.pas';

var
  lCliente: TCliente;
  lStr: string;
  lInt: Integer;
  lData: TDateTime;
  lVal: Double;
begin
  try
    lStr := 'Teste';
    lInt := -2;
//    Writeln(Format('$%p Str: %s', [@lStr, lStr]));
//    Writeln(Format('$%p Int: %d', [@lInt, lInt]));
//    TParametros.ExecutAlgoVar({TDateTime()}lData, lVal, lInt, lStr);
//    Writeln(Format('$%p Str: %s', [@lStr, lStr]));
//    Writeln(Format('$%p Int: %d', [@lInt, lInt]));

    Writeln(Format('@%p $%p Str: %s', [Pointer(lStr), @lStr, lStr]));
    Writeln(Format('@%p $%p Int: %d', [Pointer(lInt), @lInt, lInt]));
    TParametros.ExecutAlgoConst(Now, 0.5, lInt, lStr);
    Writeln(Format('@%p $%p Str: %s', [Pointer(lStr), @lStr, lStr]));
    Writeln(Format('@%p $%p Int: %d', [Pointer(lInt), @lInt, lInt]));

    /// Sem definição
//    Writeln(Format('$%p Str: %s', [@lStr, lStr]));
//    Writeln(Format('$%p Int: %d', [@lInt, lInt]));
//    TParametros.ExecutAlgo(Now, 0.5, lInt, lStr);
//    Writeln(Format('$%p Str: %s', [@lStr, lStr]));
//    Writeln(Format('$%p Int: %d', [@lInt, lInt]));

//    TCliente.ClassValidaCliente;
// Não compila por não ser class: TCliente.ClienteInadimplente;

//    lCliente := TCliente.Create;
//    lCliente.Free;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
