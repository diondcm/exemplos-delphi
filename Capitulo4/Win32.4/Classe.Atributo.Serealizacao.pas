unit Classe.Atributo.Serealizacao;

interface

type
  TAtrSerealizacaoTabela = class(TCustomAttribute)
  private
    FTabela: string;
  public
    constructor Create(const pTabela: string);
    property Tabela: string read FTabela write FTabela;
  end;

  TAtrSerealizacaoField = class(TCustomAttribute)
  private
    FField: string;
  public
    constructor Create(const pField: string);
    property Field: string read FField write FField;
  end;

implementation

{ TAtrSerealizacaoTabela }

constructor TAtrSerealizacaoTabela.Create(const pTabela: string);
begin
  FTabela := pTabela;
end;

{ TAtrSerealizacaoField }

constructor TAtrSerealizacaoField.Create(const pField: string);
begin
  FField := pField;
end;

end.
