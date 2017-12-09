unit Classes.Pessoa;

interface

uses
  System.SysUtils, System.Classes, Classe.Base;

type
  TPessoa = class(TClasseBase)
  protected
    function ConsultaDB(pID: Integer): Boolean; override;
    function GetNovoID: Integer; override; abstract;
  end;

  TPessoaFisica = class(TPessoa)
  private
    FNome: string;
    FRG: string;
    FCPF: string;
    FDataNacimento: TDate;
    FCodigo: Integer;
  public
    function ToString: string; override;

    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property RG: string read FRG write FRG;
    property CPF: string read FCPF write FCPF;
    property DataNacimento: TDate read FDataNacimento write FDataNacimento;
//  published
//    property ID;
  end;

//  TNivelDependente = (Nenhum, Filho = 5, Esposa, Marido, Neto); { TNivelDependente.Filho } { ndFilho }
  TDependente = class(TPessoaFisica)
  type
    TNivelDependente = (Nenhum, Filho = 5, Esposa, Marido, Neto); { TNivelDependente.Filho } { ndFilho }
  const
    DESC_FILHO = 'Filho';
  private
    FNivel: TNivelDependente;
    FNivelStr: string;
    function GetNivelStr: string;
    procedure SetNivelStr(const Value: string);
  public
    function GetNivelDependente: string;
    function ToString: string; override;
    property Nivel: TNivelDependente read FNivel write FNivel;
  published
    property NivelStr: string read GetNivelStr write SetNivelStr;
    property Nome;
    property RG;
    property CPF;
  end;

//  procedure Register;

implementation

//procedure Register;
//begin
//  RegisterComponents('CriacaoOnLine', [TDependente]);
//end;


{ TPessoa }

function TPessoa.ConsultaDB(pID: Integer): Boolean;
begin
  Result := True;
end;

{ TPessoaFisica }

function TPessoaFisica.ToString: string;
begin
  //FID := 0;
  Result := inherited;
  Result := Result + sLineBreak + 'Nome: ' + FNome;
end;

{ TDepedente }

function TDependente.GetNivelDependente: string;
begin

end;

function TDependente.GetNivelStr: string;
begin
//  Result := 'Nenhum';
  case FNivel of
    Filho: Result := DESC_FILHO;
    Esposa: Result := 'Esposa';
    Marido: Result := 'Marido';
    Neto: Result := 'Neto'
  else
    Result := 'Nenhum';
  end;
end;

procedure TDependente.SetNivelStr(const Value: string);
begin
  if CompareStr(DESC_FILHO, Value) = 0 then
  begin
    FNivel := TNivelDependente.Filho;
  end;// ...

end;

function TDependente.ToString: string;
begin
  Result := inherited;
  Result := Result + sLineBreak + 'Nível: ' + GetNivelStr;
end;

end.
