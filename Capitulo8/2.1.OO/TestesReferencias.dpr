program TestesReferencias;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Pessoa in 'Classe.Pessoa.pas';

type
  TClasseSimples = class
    class constructor Create;
    class destructor Destroy;

    constructor Create;
    destructor Destroy; override;
  end;

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
{ TClasseSimples }

class constructor TClasseSimples.Create;
begin
  Writeln('Class constructor: TClasseSimples');
end;

class destructor TClasseSimples.Destroy;
begin
  Writeln('Class destructor: TClasseSimples');
end;

constructor TClasseSimples.Create;
begin
  Writeln('Constructor: TClasseSimples');
end;

destructor TClasseSimples.Destroy;
begin
  Writeln('Destructor: TClasseSimples');
  inherited;
end;

var
  lCS: TClasseSimples;
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

//  ReportMemoryLeaksOnShutdown := {$WARNINGS OFF}(DebugHook > 0) {$WARNINGS ON};
  try

    lCS := TClasseSimples.Create;

    lCS.Free;


   (* lPessoa := TPessoa.Create;

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
    end; *)

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
