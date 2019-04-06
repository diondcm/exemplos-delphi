program TestesReferencias;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Pessoa in 'Classe.Pessoa.pas';


  procedure ListaPessoa(pPessoa: TPessoa);
  var
    lPessoaLocal: TPessoa;
  begin
    lPessoaLocal := pPessoa;
    lPessoaLocal.Nome := 'Metodo';
    Writeln('Nome Metodo: ' + pPessoa.Nome);
    Writeln('pPessoa: ' + Format('$%p - $%p', [@pPessoa, Pointer(pPessoa)]));
    Writeln('PessoaLocal: ' + Format('$%p - $%p', [@lPessoaLocal, Pointer(lPessoaLocal)]));
  end;

var
  lPessoa: TPessoa;
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  ReportMemoryLeaksOnShutdown := {$WARNINGS OFF}(DebugHook > 0) {$WARNINGS ON};
  try
    lPessoa := TPessoa.Create;

    lPessoa.Tipo := TTipoPessoa.Fisica;
    case lPessoa.Tipo of
      TTipoPessoa.Fisica:
      begin

      end;

      TTipoPessoa.Juridica:
      begin

      end;
    end;

    Writeln('nil: ' + Format('$%p', [nil]));
    Writeln('lPessoa: ' + Format('$%p - $%p', [@lPessoa, Pointer(lPessoa)]));

    if Assigned(lPessoa) then
    begin
      Writeln('Preenchido');
      Writeln('Nome lpessoa: ' + lPessoa.Nome);
      ListaPessoa(lPessoa);
    end else begin
      Writeln('Sem referencia');
    end;

    if  lPessoa <> nil {Assigned(lPessoa)} then
    begin
      Writeln('Nome lpessoa: ' + lPessoa.Nome);
    end;

//    lPessoa.Free;
    FreeAndNil(lPessoa);
    Writeln('Pessoa[Depois do Free]: ' + Format('$%p - $%p', [@lPessoa, Pointer(lPessoa)]));

    if  lPessoa <> nil {Assigned(lPessoa)} then
    begin
      Writeln('Nome: ' + lPessoa.Nome);
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
