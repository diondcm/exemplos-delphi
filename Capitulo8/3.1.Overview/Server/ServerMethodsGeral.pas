unit ServerMethodsGeral;

interface

uses Winapi.Windows,
    System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth;

type
{$METHODINFO ON}
  TSMGeral = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  class var
    FTotalInstancias: Integer;
    FInstanciasAbertas: Integer;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetID: Integer;
    function GetThreadID: Integer;

    function GetTotalInstanciasAbertas: Integer;
    function GetTotalInstancias: Integer;

    function GetDataServer: TDateTime;
    function GetServerVersion: string;
    function GetServerCost: Currency;

    function GetObject: TObject;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TSMGeral.DataModuleCreate(Sender: TObject);
begin
  Tag := GetTickCount;
  InterlockedIncrement(FTotalInstancias); // inc não serve, pois não é thread-safe
  InterlockedIncrement(FInstanciasAbertas);
end;

procedure TSMGeral.DataModuleDestroy(Sender: TObject);
begin
  InterlockedDecrement(FInstanciasAbertas);
end;

function TSMGeral.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMGeral.GetDataServer: TDateTime;
begin
  Result := Now;
end;

function TSMGeral.GetID: Integer;
begin
  Result := Tag;
end;

function TSMGeral.GetObject: TObject;
begin
  Result := TObject.Create;
end;

function TSMGeral.GetServerCost: Currency;
begin
  Result := 10000 * Random(10000) /(1 + Random(100));
end;

function TSMGeral.GetServerVersion: string;
begin
  Result := '1.2.0';
end;

function TSMGeral.GetThreadID: Integer;
begin
  Result := GetCurrentThreadId;
end;

function TSMGeral.GetTotalInstancias: Integer;
begin
  Result := FTotalInstancias;
end;

function TSMGeral.GetTotalInstanciasAbertas: Integer;
begin
  Result := FInstanciasAbertas;
end;

function TSMGeral.ReverseString(Value: string): string;
begin
  Sleep(Random(1000));
  Result := System.StrUtils.ReverseString(Value);
end;

end.

