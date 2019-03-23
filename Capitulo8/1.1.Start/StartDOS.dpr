program StartDOS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Conversor in 'Classe.Conversor.pas',
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule};


var
  lValor: string;
begin
  try
    ClientModule1 := TClientModule1.Create(nil);

    Writeln('Conversor de moeda.');
    Writeln('Informe o valor: ');
    Readln(lValor);

    Writeln(TConversor.DolarParaReal(lValor));

//    Writeln(FormatFloat('0.,00', TConversor.DolarParaReal(StrToFloat(lValor))));

//    Writeln(FormatFloat('0.,00', DolarParaReal(StrToFloat(lValor))));

    ClientModule1.Free;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
