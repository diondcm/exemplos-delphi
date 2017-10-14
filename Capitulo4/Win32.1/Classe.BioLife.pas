unit Classe.BioLife;

interface

uses
  System.Classes, System.SysUtils;

type
  TVertebrados = class(TObject) // (TComponent)
  private
    FQuantidadeOssos: Cardinal;
  published
    property QuantidadeOssos: Cardinal read FQuantidadeOssos write FQuantidadeOssos;
  end;

  TMamifero = class(TVertebrados)
  private
    FDiasDeGestacao: Cardinal;
    FPeriodoAmamentacao: Cardinal;
    FQuantidadeMamas: Cardinal;
  public
    procedure ListaPropriedades(pLista: TStrings); virtual { VMT }; // dynamic { DMT } // static
    property DiasDeGestacao: Cardinal read FDiasDeGestacao write FDiasDeGestacao;
    property PeriodoAmamentacao: Cardinal read FPeriodoAmamentacao write FPeriodoAmamentacao;
    property QuantidadeMamas: Cardinal read FQuantidadeMamas write FQuantidadeMamas;
  end;

  TCao = class(TMamifero)
  private
    FNome: string;
  public
    procedure ListaPropriedades(pLista: TStrings); override;

//    procedure ListaPropriedadesDoCao(pLista: TStrings); // Como não fazer
    property Nome: string read FNome write FNome;
  end;

  TBaleiaAzul = class(TMamifero)
  private
    FTempoDeSubmercao: Cardinal;
  public
    procedure ListaPropriedades(pLista: TStrings); override;
    property TempoDeSubmercao: Cardinal read FTempoDeSubmercao write FTempoDeSubmercao;
  end;

  TMorcego = class(TMamifero)
  private
    FAlturaMaximaVoo: Cardinal;
  public
    procedure ListaPropriedades(pLista: TStrings); override;

    property AlturaMaximaVoo: Cardinal read FAlturaMaximaVoo write FAlturaMaximaVoo;
  end;

implementation

{ TMamifero }

procedure TMamifero.ListaPropriedades(pLista: TStrings);
begin
  pLista.Add('Dias de Gestação: ' + FDiasDeGestacao.ToString + ' em dias');
  pLista.Add('Período amamentação: ' + FPeriodoAmamentacao.ToString);
  pLista.Add('');
//  pLista.Add('Nome: ' + FNome);
end;

{ TCao }

//procedure TCao.ListaPropriedadesDoCao(pLista: TStrings);
//begin
//  pLista.Add('');
//  pLista.Add('Dias de Gestação: ' + FDiasDeGestacao.ToString + ' em das');
//  pLista.Add('Período amamentação: ' + FPeriodoAmamentacao.ToString);
//  pLista.Add('Nome: ' + FNome);
//end;

{ TCao }

procedure TCao.ListaPropriedades(pLista: TStrings);
begin
  pLista.Add('Nome: ' + FNome);
  inherited;
//  pLista.Add('Nome: ' + FNome);
end;

{ TBaleiaAzul }

procedure TBaleiaAzul.ListaPropriedades(pLista: TStrings);
begin
  pLista.Add('Tempo de Submerção: ' + FTempoDeSubmercao.ToString + ' segundos');
  inherited;
end;

{ TMorcego }

procedure TMorcego.ListaPropriedades(pLista: TStrings);
begin
  pLista.Add('Altura Máx. Voo: ' + FAlturaMaximaVoo.ToString + ' metros');
  inherited;
end;

end.
