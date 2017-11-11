unit Classe.Atributo.Arquivo;

interface

type
  TAlinhamentoCampo = (Direita, Esquerda);

  TAtributoCampo = class(TCustomAttribute)
  private
    FTamanho: Integer;
    FAlinhamento: TAlinhamentoCampo;
    FCaracterePreenchimento: Char;
    FFieldIndex: Integer;
  public
    constructor Create(pFieldIndex, pTamanho: Integer; pAlinhamento: TAlinhamentoCampo; pCaracterePreenchimento: Char);

    property Tamanho: Integer read FTamanho;
    property Alinhamento: TAlinhamentoCampo read FAlinhamento;
    property CaracterePreenchimento: Char read FCaracterePreenchimento;
    property FieldIndex: Integer read FFieldIndex;
  end;

  TAtributoCampoInteger = class(TAtributoCampo)
  public
    constructor Create(pFieldIndex, pTamanho: Integer);
  end;

  TAtributoCampoString = class(TAtributoCampo)
  public
    constructor Create(pFieldIndex, pTamanho: Integer);
  end;

  TAtributoCampoData = class(TAtributoCampo)
  private
    FFormatacao: string;
  public const
    // ISO 8601 - Padrão para WSs
    // https://stackoverflow.com/questions/2201925/converting-iso-8601-compliant-string-to-java-util-date
    // 2010-01-01T12:00:00+01:00
    // http://docwiki.embarcadero.com/Libraries/Seattle/en/System.DateUtils.DateToISO8601
    DATA_PADRAO = 'ISO-8601';
    // Outra forma é usar data foramto Unix -
    // http://docwiki.embarcadero.com/Libraries/Tokyo/en/System.DateUtils.UnixToDateTime
    // http://docwiki.embarcadero.com/Libraries/Tokyo/en/System.DateUtils.DateTimeToUnix
  public
    constructor Create(pFieldIndex, pTamanho: Integer; const pFormatacao: string = DATA_PADRAO);
    property Formatacao: string read FFormatacao;
  end;


implementation

{ TAtributoCampo }

constructor TAtributoCampo.Create(pFieldIndex, pTamanho: Integer; pAlinhamento: TAlinhamentoCampo;
  pCaracterePreenchimento: Char);
begin
  FFieldIndex := pFieldIndex;
  FTamanho := pTamanho;
  FAlinhamento := pAlinhamento;
  FCaracterePreenchimento := pCaracterePreenchimento;
end;

{ TAtributoCampoInteger }

constructor TAtributoCampoInteger.Create(pFieldIndex, pTamanho: Integer);
begin
  inherited Create(pFieldIndex, pTamanho, TAlinhamentoCampo.Direita, '0');
end;

{ TAtributoCampoString }

constructor TAtributoCampoString.Create(pFieldIndex, pTamanho: Integer);
begin
  inherited Create(pFieldIndex, pTamanho, TAlinhamentoCampo.Esquerda, ' ');
end;

{ TAtributoCampoData }

constructor TAtributoCampoData.Create(pFieldIndex, pTamanho: Integer; const pFormatacao: string);
begin
  inherited Create(pFieldIndex, pTamanho, TAlinhamentoCampo.Esquerda, ' ');
  FFormatacao := pFormatacao;
end;

end.
