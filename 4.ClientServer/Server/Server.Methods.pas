unit Server.Methods;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Produto, Classe.Retorno,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnection: TFDConnection;
    qryProduto: TFDQuery;
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
//  Sleep(5000);
  // todo: bugs de acesso threads
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
//    lProduto := TProduto.Create;
//    lProduto.ID := 1;
//    lProduto.Descricao := 'Processador i7';
//    lProduto.Valor := 1200.35;
//    FListaProduto.Add(lProduto);
//
//    FListaProduto.Add(TProduto.Create);
//    FListaProduto.Last.ID := 2;
//    FListaProduto.Last.Descricao := 'AMD 32412';
//    FListaProduto.Last.Valor := 1100.67;
    qryProduto.Close;
    qryProduto.Open('select * from produto_mobile');
    qryProduto.First;
    while not qryProduto.Eof do
    begin
      lProduto := TProduto.Create;
      // engine para converter os dados do Dataset em classes
      // popular ORM

      lProduto.ID := qryProduto.FieldByName('ID').AsInteger;
      lProduto.Descricao := qryProduto.FieldByName('DESCRICAO').AsString;
      lProduto.Valor := qryProduto.FieldByName('VALOR').AsCurrency;;
      FListaProduto.Add(lProduto);

      qryProduto.Next;
    end;
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
  Result := TRetorno.Create;
  Result.Sucess := True;
  for lProduto in pLista do
  begin
    // outra maneira de tratar é no DB
    qryProduto.Open('select * from produto_mobile');
    qryProduto.IndexFieldNames := 'ID';

    if (lProduto.ID <> 0) and qryProduto.FindKey([lProduto.ID]) then
    begin
      qryProduto.Edit;
    end else begin
      // não deletar infos, setar flag deletado
      if (lProduto.ID <> 0) then
      begin
        // Exit(TRetorno.Create(False, 'Registro não localizado no server: ' + lProduto.ID.ToString));
        Result.Sucess := False;
        Result.Msg := 'Registro não localizado no server: ' + lProduto.ID.ToString;
      end else begin
        qryProduto.Insert;
      end;
    end;

    if qryProduto.State in dsEditModes then
    begin
      qryProduto.FieldByName('VALOR').AsCurrency := lProduto.Valor;
      qryProduto.FieldByName('DESCRICAO').AsString := lProduto.Descricao;

      // todo: implementar trigger
      if qryProduto.State = dsInsert then
      begin
        Randomize;
        qryProduto.FieldByName('ID').AsInteger := Random(100000000);
      end;

      qryProduto.Post;
      if qryProduto.RowsAffected > 0 then
      begin
        Result.Sucess := Result.Sucess and True;
      end;
    end;

    FListaProduto.Add(lProduto);
  end;
end;

end.

