unit Server.Methods;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Produto, Classe.Retorno;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FListaProduto: TListaProduto;
    procedure IniciaLista;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetListaProdutos: TListaProduto;
    function SetListaProduto(pLista: TListaProduto): TRetorno;
  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

procedure TServerMethods1.DataModuleCreate(Sender: TObject);
begin
  FListaProduto := TListaProduto.Create;
end;

procedure TServerMethods1.DataModuleDestroy(Sender: TObject);
begin
  FListaProduto.Free;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetListaProdutos: TListaProduto;
begin
  Result := TListaProduto.Create;

  IniciaLista;
  Result.AddRange(FListaProduto.ToArray);

  // Se eu retornar a Flistaproduto, o delphi vai liberar ela da memória
  // Result := FListaProduto;

// Não usar: Result.Free;
//  DataSnap liberará a memória
end;

procedure TServerMethods1.IniciaLista;
var
  lProduto: TProduto;
begin
  if FListaProduto.Count = 0 then
  begin
    lProduto := TProduto.Create;
    lProduto.ID := 1;
    lProduto.Descricao := 'Processador i7';
    lProduto.Valor := 1200.35;
    FListaProduto.Add(lProduto);

    FListaProduto.Add(TProduto.Create);
    FListaProduto.Last.ID := 2;
    FListaProduto.Last.Descricao := 'AMD 32412';
    FListaProduto.Last.Valor := 1100.67;
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetListaProduto(pLista: TListaProduto): TRetorno;
var
  lProduto: TProduto;
begin
  for lProduto in pLista do
  begin
    // todo: verificar ID
    FListaProduto.Add(lProduto);
  end;
end;

end.

