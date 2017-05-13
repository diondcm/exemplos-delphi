unit Classe.Atributo.Campo;

interface

type
  TAlinhamentoCampo = (Direita, Esquerda);

  TAtributoCampo = class(TCustomAttribute)
  private
    FTamanho: Integer;
    FAlinhamento: TAlinhamentoCampo;
    FCaracterePreenchimento: Char;
    FPosicao: Integer;
  public const
    CARACTERE_ESPACO = ' ';
    CARACTERE_ZERO = '0';
  public
    constructor Create(pPosicao, pTamanho: Integer;
      pAlinhamento: TAlinhamentoCampo; pCaracterePreenchimento: Char);
    property Tamanho: Integer read FTamanho write FTamanho;
    property Alinhamento: TAlinhamentoCampo read FAlinhamento write FAlinhamento;
    property CaracterePreenchimento: Char read FCaracterePreenchimento write FCaracterePreenchimento;
    property Posicao: Integer read FPosicao write FPosicao;
  end;

implementation

{ TAtributoCampo }

constructor TAtributoCampo.Create(pPosicao, pTamanho: Integer;
  pAlinhamento: TAlinhamentoCampo; pCaracterePreenchimento: Char);
begin
  FPosicao := pPosicao;
  FTamanho := pTamanho;
  FAlinhamento := pAlinhamento;
  FCaracterePreenchimento := pCaracterePreenchimento;
end;

end.
