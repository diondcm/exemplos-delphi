unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.FireDACJSONReflect, FireDAC.Stan.StorageBin, ClasseStatus, System.NetEncoding;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    qryPessoa: TFDQuery;
    qryProduto: TFDQuery;
    memProduto: TFDMemTable;
    memPessoa: TFDMemTable;
    FDConnection: TFDConnection;
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetDados: TFDJSONDataSets;
    function SetDados(pDados: TFDJSONDataSets): TStatus;

    // exemplo oficial
//    function GetDados(idTransacao): TFDJSONDataSets;
//    function SetDados(idTransacao, pDados: TFDJSONDataSets): string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetDados: TFDJSONDataSets;
begin
  Result := TFDJSONDataSets.Create;

  qryPessoa.Close;
  qryPessoa.Open;
  qryPessoa.FetchAll;

  TFDJSONDataSetsWriter.ListAdd(Result, 'Pessoa', qryPessoa);

  qryProduto.Close;
  qryProduto.Open;
  qryProduto.FetchAll;

  TFDJSONDataSetsWriter.ListAdd(Result, 'Produto', qryProduto);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetDados(pDados: TFDJSONDataSets): TStatus;
var
  lID: Integer;
begin
  Result := TStatus.Create;

  try
  memPessoa.Close;
  memPessoa.AppendData(TFDJSONDataSetsReader.GetListValueByName(pDados, 'Pessoa'));
  memPessoa.First;

  qryPessoa.Close;
  qryPessoa.Open;
  qryPessoa.IndexFieldNames := 'ID';

  while not memPessoa.Eof do
  begin
    if memPessoa.FieldByName('id').IsNull or (memPessoa.FieldByName('id').AsInteger = 0) then
    begin
      qryPessoa.Append;
      qryPessoa.CopyRecord(memPessoa);

      // Validações de negócio

      // ignorar
      qryPessoa.FieldByName('id').AsInteger := Random(10000000);

      if qryPessoa.FieldByName('nome').AsString = '' then
      begin
        Result.Msg := 'Pessoa sem nome informado';
        Result.Persistido := False;
//        raise Exception.Create('Nome não informado');
//        Result := Result  + sLineBreak + 'Pessoa sem nome informado';
        qryPessoa.Cancel;
        memPessoa.Next;
        Continue;
      end;

      qryPessoa.Post;
    end else begin

      //qryPessoa.SetRange();
      if qryPessoa.FindKey([memPessoa.FieldByName('id').AsInteger]) then
      begin
        qryPessoa.FieldByName('id').ReadOnly := True;
        qryPessoa.Edit;

        qryPessoa.CopyRecord(memPessoa);

        // Validações de negócio

        qryPessoa.Post;
        qryPessoa.FieldByName('id').ReadOnly := False;
      end;
    end;

    memPessoa.Next;
  end;

  memProduto.Close;
  memProduto.AppendData(TFDJSONDataSetsReader.GetListValueByName(pDados, 'Produto'));
  memProduto.First;

  qryProduto.Close;
  qryProduto.Open;
  qryProduto.IndexFieldNames := 'idproduto';


  while not memProduto.Eof do
  begin
    if memProduto.FieldByName('idproduto').IsNull or (memProduto.FieldByName('idproduto').AsInteger = 0) then
    begin
      qryProduto.Append;
      qryProduto.CopyRecord(memProduto);

      // ignorar
      qryProduto.FieldByName('idproduto').AsInteger := Random(10000000);

      qryProduto.Post;
    end else begin

      if qryProduto.FindKey([memProduto.FieldByName('idproduto').AsInteger]) then
      begin
        qryProduto.FieldByName('idproduto').ReadOnly := True;
        qryProduto.Edit;

        qryProduto.CopyRecord(memProduto);

        qryProduto.Post;
        qryProduto.FieldByName('idproduto').ReadOnly := False;
      end;
    end;

    memProduto.Next;
  end;
    if Result.Msg = '' then
    begin
      Result.Persistido := True;
      Result.Msg := 'Dados gravados com sucesso';
    end;

  except
    on E: Exception do
    begin
      Result.Erro := E.Message;
      Result.Persistido := False;
      Result.Msg := 'Erro ao processar no servidor';
    end;
  end;
end;

end.

