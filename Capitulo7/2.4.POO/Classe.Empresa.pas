unit Classe.Empresa;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TEmpresa = class
  private
    FCNPJ: string;
    FRazaoSocial: string;
  public
    function ToString: string; override;

    property CNPJ: string read FCNPJ write FCNPJ;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
  end;

  TFrigorifico = class(TEmpresa)
  private
    FCapacidadeAbates: Integer;
  public
    function ToString: string; override;
    property CapacidadeAbates: Integer read FCapacidadeAbates write FCapacidadeAbates;
  end;

  TIndustria = class(TEmpresa)

  end;

  TIndustriaCalcado = class(TIndustria)
  private
    FVendeExportacao: Boolean;
  public
    function ToString: string; override;
    property VendeExportacao: Boolean read FVendeExportacao write FVendeExportacao;
  end;

  THolding = class(TEmpresa)
  private
    class var
      FInstancia: THolding;
  private
    FListaEmpresa: TObjectList<TEmpresa>;
    class function GetInstancia: THolding; static;
  public
    constructor Create;
    destructor Destroy; override;
    property ListaEmpresa: TObjectList<TEmpresa> read FListaEmpresa write FListaEmpresa;
    class property Instancia: THolding read GetInstancia;
  end;

//var -- nope
//  FHoldingPrincipal: THolding;

implementation

{ TEmpresa }

{ TEmpresa }

function TEmpresa.ToString: string;
begin
  Result := 'Razao social: ' + FRazaoSocial + sLineBreak + 'CNPJ: ' + FCNPJ;
end;

{ THolding }

constructor THolding.Create;
begin
  FListaEmpresa := TObjectList<TEmpresa>.Create;
end;

destructor THolding.Destroy;
begin
  FListaEmpresa.Free;
  inherited;
end;

class function THolding.GetInstancia: THolding;
begin
  if not Assigned(THolding.FInstancia) then
  begin
    THolding.FInstancia := THolding.Create;
  end;

  Result := THolding.FInstancia;
end;

{ TFrigorifico }

function TFrigorifico.ToString: string;
begin
  Result := inherited ToString + sLineBreak +
    'Capacidade abates: ' + IntToStr(FCapacidadeAbates);
end;

{ TIndustriaCalcado }

function TIndustriaCalcado.ToString: string;
begin
  Result := inherited ToString + sLineBreak + 'Vende Expo: ' + BoolToStr(FVendeExportacao, True);
end;

end.
