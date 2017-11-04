unit Classe.Atributo.Campo;

interface


type
  TAlinhamento = (Direita, Esquerda);

  TAtributoCampo = class(TCustomAttribute)
  private
    FTamanho: Integer;
    FAlinhamento: TAlinhamento;
    FCaracterePreenchimento: Char;
    FPosicao: Integer;
  public const
    CARACTERE_ESPACO = ' ';
    CARACTERE_ZERO = '0';
  public
    constructor Create(pPosicao, pTamanho: Integer; pAlinhamento: TAlinhamento; pCaracterePreenchimento: Char);

    property Tamanho: Integer read FTamanho write FTamanho;
    property Alinhamento: TAlinhamento read FAlinhamento write FAlinhamento;
    property CaracterePreenchimento: Char read FCaracterePreenchimento write FCaracterePreenchimento;
    property Posicao: Integer read FPosicao;
  end;

implementation

{ TAtributoCampo }

constructor TAtributoCampo.Create(pPosicao, pTamanho: Integer; pAlinhamento: TAlinhamento;
  pCaracterePreenchimento: Char);
begin
  FPosicao := pPosicao;
  FTamanho := pTamanho;
  FAlinhamento := pAlinhamento;
  FCaracterePreenchimento := pCaracterePreenchimento;
end;

end.
