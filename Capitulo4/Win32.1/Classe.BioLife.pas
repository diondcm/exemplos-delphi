unit Classe.BioLife;

interface

uses
  System.Classes, System.SysUtils;

type
  TMamifero = class
  private
    FDiasDeGestacao: Cardinal;
    FPeriodoAmamentacao: Cardinal;
  public
    procedure ListaPropriedades(pLista: TStrings); virtual { VMT }; // dynamic { DMT } // static
    property DiasDeGestacao: Cardinal read FDiasDeGestacao write FDiasDeGestacao;
    property PeriodoAmamentacao: Cardinal read FPeriodoAmamentacao write FPeriodoAmamentacao;
  end;

  TCao = class(TMamifero)
  private
    FNome: string;
  public
    procedure ListaPropriedades(pLista: TStrings); override;

//    procedure ListaPropriedadesDoCao(pLista: TStrings);
    property Nome: string read FNome write FNome;
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

end.
