unit Classe.Veiculo;

interface

uses
  Vcl.Graphics;

type
  TVeiculo = class
  private
    FPlaca: string;
  public
    class var FRenavam: string;
    class constructor Create;
    class destructor Destroy;
    function GetTotalRodas: Integer;

    constructor CreateComPlaca(APlaca: string);
    destructor Destroy; override;
    procedure ExibeInfos; virtual;
    property Placa: string read FPlaca write FPlaca;
    property TotaRodas: Integer read GetTotalRodas;
  end;

  TClasseNaoUtilizada = class
    class constructor Create;
  end;

  TCarro = class(TVeiculo)
  private
    FCor: TColor;
    procedure SetCor(const Value: TColor);

  public

    procedure ExibeInfos; override;
    property Cor: TColor read FCor write SetCor;
  end;

  TCaminhao = class(TVeiculo)
  private
    FLimiteCarga: Integer;
  public
    procedure ExibeInfos; override;
    property LimiteCarga: Integer read FLimiteCarga write FLimiteCarga;
  end;


implementation

uses
  System.SysUtils;

{ TVeiculo }

class constructor TVeiculo.Create;
begin
  Writeln('LOG: Classe inicializada');
end;

constructor TVeiculo.CreateComPlaca(APlaca: string);
begin
  FPlaca := APlaca;
  Writeln('LOG: Objeto veiculo criado.');
end;

class destructor TVeiculo.Destroy;
begin
  Writeln('LOG: Classe destruida');
end;

destructor TVeiculo.Destroy;
begin
  Writeln('LOG: Objeto veiculo destruido');
  inherited;
end;

procedure TVeiculo.ExibeInfos;
begin
  //Writeln(format('Classe: %p', [@Self]));
  Write('Placa: ');
  Writeln(FPlaca);

//  Write('Renavam: ');
//  Writeln(FRenavam);
end;

function TVeiculo.GetTotalRodas: Integer;
begin
  Result := 1 + 1 + 2;
end;

{ TCarro }

procedure TCarro.ExibeInfos;
begin
  inherited;
  Write('Cor: ');
  Writeln(FCor);
end;

procedure TCarro.SetCor(const Value: TColor);
begin
  FCor := Value;
end;

{ TCaminhao }

procedure TCaminhao.ExibeInfos;
begin
  inherited;
  Write('Limite de carga: ');
  Writeln(FLimiteCarga);
end;

{ TClasseNaoUtilizada }

class constructor TClasseNaoUtilizada.Create;
begin
  Write('Classe não utilizada');
end;

end.
