unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Vcl.ExtCtrls;

type
  TServerMethods1 = class(TDSServerModule)
    tmrValorAtual: TTimer;
    procedure tmrValorAtualTimer(Sender: TObject);
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FValorAtual: Currency;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetValorDolarAtual: Currency;
  end;

//var
//  FValorAtual: Currency;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  FValorAtual := 3.5;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetValorDolarAtual: Currency;
begin
  Randomize;
  FValorAtual := FValorAtual * (1 + (Random(100)/1000));

  Result := FValorAtual;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods1.tmrValorAtualTimer(Sender: TObject);
begin
// todo: timer
//  Randomize;
//  FValorAtual := FValorAtual * (1 + (Random(100)/100));
end;

end.

