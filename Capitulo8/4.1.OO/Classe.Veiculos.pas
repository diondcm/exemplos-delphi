unit Classe.Veiculos;

interface

uses System.SysUtils, Classe.Base, Classe.Patrimonio;

type
  TVeiculo = class(TClasseBase, IPatrimonio)
  strict private
    FMotor: string;
    FRegistro: string;
    FDataFabricacao: TDateTime;
    FCusto: Currency;
    FGravarLog: TProc<string>;
  private
    FDataCompra: TDateTime;
    //procedure 'Do'GravaLog(pMsg: string);
    procedure ExecutaLog(pMsg: string);
    procedure SetDataFabricacao(const Value: TDateTime);
    procedure CarregaDoBanco;
    procedure SetValorCompra(const Value: Currency);
    procedure SetDataDepreciacao(const Value: TDateTime);

    { IPatrimonio }
    function GetDataCompra: TDateTime;
    function GetValorCompra: Currency;
    function GetDataDepreciacao: TDateTime;
  public
    constructor Create;
    procedure ExecutarRota; virtual; abstract;
    procedure Ligar; virtual;// comenta o virtual, o que acontece??
    property GravarLog: TProc<string> read FGravarLog write FGravarLog;
    property Motor: string read FMotor write FMotor;
    property Registro: string read FRegistro write FRegistro;
    property DataFabricacao: TDateTime read FDataFabricacao write SetDataFabricacao;
    property Custo: Currency read FCusto write FCusto;

    property DataCompra: TDateTime read GetDataCompra write FDataCompra;
    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao write SetDataDepreciacao;
  end;

  TCarro = class(TVeiculo)
  public
    procedure AlteraData(pData: TDateTime);
    procedure ExecutarRota; override;
    // procedure Ligar; ??? o que acontece
  end;

  TNavio = class(TVeiculo)
  public
    procedure ExecutarRota; override;
  end;


implementation

{ TVeiculo }

procedure TVeiculo.CarregaDoBanco;
begin
  FDataFabricacao := Now;
  FDataCompra := Now;
end;

constructor TVeiculo.Create;
begin
  CarregaDoBanco;
end;

procedure TVeiculo.ExecutaLog(pMsg: string);
begin
  if Assigned(FGravarLog) then
  begin
    GravarLog(pMsg);
  end;
end;

function TVeiculo.GetDataCompra: TDateTime;
begin
  Result := FDataCompra;
end;

function TVeiculo.GetDataDepreciacao: TDateTime;
begin
  Result := Now + Random(100);
end;

function TVeiculo.GetValorCompra: Currency;
begin
  Result := Random(10000)/(1+Random(123));
end;

procedure TVeiculo.Ligar;
begin
  ExecutaLog('Ligado');
//  if Assigned(FGravarLog) then
//  begin
//    GravarLog('Ligado');
//  end;
end;

procedure TVeiculo.SetDataDepreciacao(const Value: TDateTime);
begin

end;

procedure TVeiculo.SetDataFabricacao(const Value: TDateTime);
begin
  if FDataFabricacao <> 0 then
  begin
    raise Exception.Create('Data de fabricação não pode ser alterada.');
  end;

  FDataFabricacao := Value;
end;

procedure TVeiculo.SetValorCompra(const Value: Currency);
begin

end;

{ TCarro }

procedure TCarro.AlteraData(pData: TDateTime);
begin
//  FDataFabricacao := pData;
end;

procedure TCarro.ExecutarRota;
begin
  ExecutaLog('Executa rota de A -> B');
end;

{ TNavio }

procedure TNavio.ExecutarRota;
begin
  ExecutaLog('Navega de A -> B');
end;

end.
