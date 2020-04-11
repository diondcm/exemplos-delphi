program ReferenciasOO;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Pessoa in 'Classe.Pessoa.pas' {$DEFINE CONSOLE};

  procedure ListaPessoa(pPessoa: TPessoa);
  var
    lPessoaLocal: TPessoa;
  begin
    lPessoaLocal := pPessoa;
    lPessoaLocal.Nome := 'Metodo';
    Writeln('Nome: ' + pPessoa.Nome);
    Writeln('pPessoa: ' + Format('$%p - $%p', [@pPessoa, Pointer(pPessoa)]));
    Writeln('PessoaLocal: ' + Format('$%p - $%p', [@lPessoaLocal, Pointer(lPessoaLocal)]));
    //pPessoa.Free;
    lPessoaLocal.Free;
  end;

type
  TExemploMemoria = class
    constructor Create;
    destructor Destroy; override;
    class constructor Create;
    class destructor Destroy;
  end;

{ TExemploMemoria }

constructor TExemploMemoria.Create;
begin
  Writeln('Create: Exemplo Memoria');
end;

destructor TExemploMemoria.Destroy;
begin
  Writeln('Destroy: Exemplo Memoria');
  inherited;
end;

class constructor TExemploMemoria.Create;
begin
  Writeln('Create: Class Exemplo Memoria');
end;

class destructor TExemploMemoria.Destroy;
begin
  Writeln('Destroy: Class Exemplo Memoria');
end;

var
  lPessoa: TPessoa;
//  lEM: TExemploMemoria;
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  try
//    lEM := TExemploMemoria.Create;
//    lEM.Free;
//    lEM := TExemploMemoria.Create;
//    lEM.Free;
//    lEM := TExemploMemoria.Create;
//    lEM.Free;

    lPessoa := TPessoa.Create;
//
//    Writeln('nil: ' + Format('$%p', [nil]));
//    Writeln('lPessoa: ' + Format('$%p - $%p', [@lPessoa, Pointer(lPessoa)]));
//    ListaPessoa(lPessoa);
    { TODO -oUser -cConsole Main : Insert code here }
    //Writeln('lPessoa Nome: ' + lPessoa.Nome);

//    lPessoa.Free;
//    Writeln('lPessoa: ' + Format('$%p - $%p', [@lPessoa, Pointer(lPessoa)]));
    FreeAndNil(lPessoa);
    Writeln('lPessoa: ' + Format('$%p - $%p', [@lPessoa, Pointer(lPessoa)]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
