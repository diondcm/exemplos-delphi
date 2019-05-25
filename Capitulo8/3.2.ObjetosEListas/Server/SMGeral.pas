unit SMGeral;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Winapi.Windows, Classe.Pessoa;

type
  TArrayPessoa = TArray<TPessoa>;

  TListaPessoa = class
  private
    FPessoas: TArrayPessoa;
  public
    property Pessoas: TArrayPessoa read FPessoas write FPessoas;
  end;

{$METHODINFO ON}
  TServerMethodsGeral = class(TDataModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetPessoas: TArray<TPessoa>; { Não publica method }
    function GetListaPessoa: TListaPessoa;

    function SetPessoa(pPessoa: TPessoa): Boolean;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethodsGeral.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethodsGeral.GetListaPessoa: TListaPessoa;
begin
  Result := TListaPessoa.Create;
  SetLength(Result.FPessoas, 10);
  for var i : Integer := 0 to 9 do
  begin
    Result.FPessoas[i] := TPessoa.Create;
    Result.FPessoas[i].Nome := 'Teste ' + IntToStr(GetTickCount);
    Result.FPessoas[i].ID := GetTickCount;
  end;
end;

function TServerMethodsGeral.GetPessoas: TArray<TPessoa>;
begin
  for var i : Integer := 0 to 9 do
  begin
    var lPessoa : TPessoa := TPessoa.Create;
    lPessoa.ID := GetTickCount;
    lPessoa.Nome := 'Teste ' + IntToStr(GetTickCount);

    SetLength(Result, Length(Result) + 1);
    Result[Length(Result)] := lPessoa;
  end;
end;

function TServerMethodsGeral.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethodsGeral.SetPessoa(pPessoa: TPessoa): Boolean;
begin
  Result := pPessoa.ID > 0;
end;

end.

