unit Classe.Pessoa;

interface

uses
  System.Classes, System.StrUtils, System.SysUtils, System.Generics.Collections;

type
  TPessoa = class
  private
    FNome: string;
    FCodigo: Integer;
    FID: Integer;
  public
    property Nome: string read FNome write FNome;
    property Codigo: Integer read FCodigo write FCodigo;
    property ID: Integer read FID write FID;
  end;

  TListaPessoa = class(TList<TPessoa>)
  private
    FGerente: TPessoa;
  public
    property Gerente: TPessoa read FGerente write FGerente;
  end;

  TPessoaComOwner = class(TComponent)

  end;


  // outra unit
  TValidaPessoa = class
    procedure ValidaCampos(pPessoa: TPessoa);
  end;

  TPessoaRegras = class(TPessoa)
  private
    function GetPreencheuNome: Boolean;
  public

    property PreencheuNome: Boolean read GetPreencheuNome;
  end;

implementation

{ TPessoaRegras }

function TPessoaRegras.GetPreencheuNome: Boolean;
begin
  Result := (Trim(Nome) <> '');
end;

{ TValidaPessoa }

procedure TValidaPessoa.ValidaCampos(pPessoa: TPessoa);
begin

end;

end.
