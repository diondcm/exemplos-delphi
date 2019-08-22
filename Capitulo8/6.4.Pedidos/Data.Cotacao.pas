unit Data.Cotacao;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.DateUtils, System.IOUtils, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin;

type
  TdmdCotacao = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    memCotacao: TFDMemTable;
    memCotacaotid: TLargeintField;
    memCotacaodate: TLargeintField;
    memCotacaotype: TStringField;
    memCotacaoprice: TCurrencyField;
    memCotacaoamount: TFloatField;
    memCotacaodata: TDateTimeField;
    procedure memCotacaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    function GetArqCacheJson: string;
  public
    const
      URL_COTACAO = 'https://www.mercadobitcoin.net/api/BTC/trades/';
      ARQ_CACHE_JSON = 'tempCotacao.json';
  public
    procedure GetDados(pDataIni, pDataFim: TDateTime; const pOnTermina: TProc);
    procedure CarregaCache;
  end;

var
  dmdCotacao: TdmdCotacao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Data.Conexao;

{$R *.dfm}

{ TdmdCotacao }

procedure TdmdCotacao.CarregaCache;
begin
  if FileExists(GetArqCacheJson) then
  begin
//    memCotacao.Close;
//    try
//      memCotacao.LoadFromFile(GetArqCacheJson);
//    except
//      // ressalva: cuidado ao ocultar o tipo de exceção que ocorreu
//      DeleteFile(GetArqCacheJson);
//    end;

    memCotacao.Close;
    dmdConexao.qryCotacao.Close;
    dmdConexao.qryCotacao.Open;

    if not dmdConexao.qryCotacao.IsEmpty then
    begin
//      memCotacao.Data := dmdConexao.qryCotacao;
      memCotacao.Open;

      memCotacao.CopyDataSet(dmdConexao.qryCotacao, [coAppend]);
      dmdConexao.qryCotacao.Close;
    end;
  end;
end;

function TdmdCotacao.GetArqCacheJson: string;
begin
  Result := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, ARQ_CACHE_JSON);
end;

procedure TdmdCotacao.GetDados(pDataIni, pDataFim: TDateTime; const pOnTermina: TProc);
var
  lDataIni: Int64;
  lDataFim: Int64;
begin
  lDataIni := DateTimeToUnix(pDataIni);
  lDataFim := DateTimeToUnix(pDataFim);

  dmdConexao.qryCotacao.Close;
  dmdConexao.qryCotacao.Open;

  TThread.CreateAnonymousThread(
    procedure
    begin
      try
        memCotacao.Close;
        memCotacao.Open;

        RESTClient1.BaseURL := URL_COTACAO + lDataIni.ToString + '/' + lDataFim.ToString + '/';

        RESTRequest1.Execute;

        // Prover o cache
        // maneira 1 -> simples
//        memCotacao.SaveToFile(GetArqCacheJson, sfJSON);
        //memCotacao.SaveToFile(GetArqCacheJson, sfBinary);

        // maneira 2 -> db local

        dmdConexao.qryCotacao.First;
        while not dmdConexao.qryCotacao.Eof do
        begin
          dmdConexao.qryCotacao.Delete;
        end;

        dmdConexao.qryCotacao.Close;
        dmdConexao.qryCotacao.Open;

        dmdConexao.qryCotacao.CopyDataSet(memCotacao, [coAppend]);

        dmdConexao.qryCotacao.Close;
      finally
        TThread.Synchronize(nil,
          procedure
          begin
            pOnTermina;
          end);
      end;
    end).Start;
end;

procedure TdmdCotacao.memCotacaoCalcFields(DataSet: TDataSet);
begin
  if memCotacaodata.AsDateTime = 0 then
  begin
    memCotacaodata.AsDateTime := UnixToDateTime(memCotacaodate.AsLargeInt);
  end;
end;

end.
