unit Teste.Arq;

interface

uses
  Variants;

type
  TClasseFilha = class;
  TArr = array [0..1] of string;

  TRecSemFields = record
  end;

  TRecInicializado = record
    ValorA: string;
  end;

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
    //function RetornaArray: TArr; // não compila
    function RetornaRect: TRecSemFields;

    [TCustomAttribute]
    property Teste: string read FTeste write FTeste;
  end;

  TClasseFilha = class(TInterfacedObject)

  end;

//var
//  VarGLobalRec: TRecInicializado =

implementation




{ TMynhaClass }

function TMynhaClass.RetornaRect: TRecSemFields;
begin

end;

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

//function TMynhaClass.RetornaArray: TArr;
//begin
//
//end;

end.
