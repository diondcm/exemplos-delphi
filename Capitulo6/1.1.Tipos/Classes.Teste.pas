unit Classes.Teste;

interface


type
//  OlaMundo2 = object >> verificar help
//  end;

  OlaMundo = class;

  TEvento = procedure (pOla: OlaMundo);


  TValo =(Val1);

  OlaMundo = class {sealed}(TObject)
    class procedure &Teste2;
    class constructor Create;
    class destructor Destroy;
  protected
    Get: Integer;

    procedure FazAlgo_tem_que_inicializar_chamar_o_Create;
    class procedure FazAlgo_Nao_precisa_Inicializar({const}var{out} pValor: TObject);
    class procedure parametros(const pValor: string; const pDouble: Double);

    procedure Evento(pEv: TEvento);

    function RetornoValor: Integer;{pVar Integer}
  published
    procedure teste;
  end;


  OlaMundo2 = class
    class constructor Create;
    class destructor Destroy;
  end;

//  TComp = class(TComponent)
    // published
//  end;

implementation

{ OlaMundo }

class constructor OlaMundo.Create;
begin
  Writeln('Create - OlaMundo');
end;

class destructor OlaMundo.Destroy;
begin
  Writeln('Destroy - OlaMundo');
end;

procedure OlaMundo.Evento(pEv: TEvento);
begin

end;

class procedure OlaMundo.FazAlgo_Nao_precisa_Inicializar(var pValor: TObject);
begin
end;

procedure OlaMundo.FazAlgo_tem_que_inicializar_chamar_o_Create;
//var
//  strict: Integer;
begin

end;

class procedure OlaMundo.parametros(const pValor: string;
  const pDouble: Double);
begin

end;

function OlaMundo.RetornoValor: Integer; {var Result: Integer}
begin
//  RetornoValor := -9;
  Result := RetornoValor * 2;
end;

procedure OlaMundo.teste;
begin

end;

class procedure OlaMundo.Teste2;
begin

end;

{ OlaMundo2 }

class constructor OlaMundo2.Create;
begin
  Writeln('Create - OlaMundo2');
end;

class destructor OlaMundo2.Destroy;
begin
  Writeln('Destroy - OlaMundo2');
end;

initialization
  Writeln('initialization');

finalization
  Writeln('finalization');

end.
