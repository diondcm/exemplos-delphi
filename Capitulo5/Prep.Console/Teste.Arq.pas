unit Teste.Arq;

interface

type
  TClasseFilha = class;

  [TCustomAttribute]
  TMynhaClass = class sealed
    const
      TESTE_CONST = 'TESTE';
    class var
      FTexto: string;
  public
    [TCustomAttribute]
    FCodigo: Integer;
  private
    FTeste: string;
    FFilha: TClasseFilha;
    [TCustomAttribute]
    procedure TesteObj;
    class procedure TesteClass;
  public
    [TCustomAttribute]
    property Teste: string read FTeste write FTeste;
  end;

  TClasseFilha = class(TInterfacedObject)

  end;

implementation




{ TMynhaClass }

class procedure TMynhaClass.TesteClass;
begin
   FTexto := 'Class var';
   // FTeste := '';
end;

procedure TMynhaClass.TesteObj;
begin
  FTexto := '';
  FTeste := '';
end;

end.
