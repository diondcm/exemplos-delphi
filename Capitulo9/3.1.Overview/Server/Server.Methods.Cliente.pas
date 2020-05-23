unit Server.Methods.Cliente;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Data.DBXPlatform, REST.Json, System.JSON, System.DateUtils,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCliente = class
  private
    FID: Integer;
    FNome: string;
    FCPF: string;
    FCodigo: Integer;
    FDataNascimento: Int64;
    FRenda: Currency;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
    property Codigo: Integer read FCodigo write FCodigo;
    property DataNascimento: Int64 read FDataNascimento write FDataNascimento;
    property Renda: Currency read FRenda write FRenda;
  end;

  TSMCliente = class(TDSServerModule)
    FDConnection: TFDConnection;
    qryCliente: TFDQuery;
    qryClienteID: TFDAutoIncField;
    qryClienteNOME: TWideStringField;
    qryClienteSALDO: TBCDField;
    qryClienteCPF: TWideStringField;
    qryClienteCODIGO: TIntegerField;
    qryClienteDATA_NASCIMENTO: TDateField;
    qryClienteRENDA: TBCDField;
  private
    { Private declarations }
    class var
      FCacheClientes: string;

    function GetListaClientes(pQtdReg: Integer): string;
  public
    function GetClientes(pQtdReg: Integer): Boolean;
    function Get1000: Boolean;
    function AtualizaCliente(pCliente: string): Boolean;
    function acceptAtualizaCliente(pCliente: string): Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMCliente }

function TSMCliente.acceptAtualizaCliente(pCliente: string): Boolean;
begin
  Result := True;
  FCacheClientes := '';

  // Executa updates na clientes
  try
    var lCliente: TCliente := TJson.JsonToObject<TCliente>(pCliente);
    Result := lCliente.ID = 1;
  except
    // tratar
  end;

  GetInvocationMetadata().ResponseContentType := 'application/json';
  GetInvocationMetadata().ResponseContent := TJSONObject.Create(TJSONPair.Create('result', 'Cliente atualizado com sucesso')).ToString;
end;

function TSMCliente.AtualizaCliente(pCliente: string): Boolean;
begin
  Result := True;
  FCacheClientes := '';

  // Executa updates na clientes
  try
    var lCliente: TCliente := TJson.JsonToObject<TCliente>(pCliente);
    Result := lCliente.ID = 1;
  except
    // tratar
  end;

  GetInvocationMetadata().ResponseContentType := 'application/json';
  GetInvocationMetadata().ResponseContent := TJSONObject.Create(TJSONPair.Create('result', 'Cliente atualizado com sucesso')).ToString;
end;

function TSMCliente.Get1000: Boolean;
begin
  Result := True;
  if FCacheClientes = '' then
  begin
    FCacheClientes := GetListaClientes(1000);
  end;

  GetInvocationMetadata().ResponseContentType := 'application/json';
  GetInvocationMetadata().ResponseContent := FCacheClientes;
end;

function TSMCliente.GetClientes(pQtdReg: Integer): Boolean;
begin
  Result := True;
  GetInvocationMetadata().ResponseContentType := 'application/json';
  GetInvocationMetadata().ResponseContent := GetListaClientes(pQtdReg);
  //GetInvocationMetadata().ResponseContent := '{"id":43242332,"nome":"Albert Fritz","dataNascimento":"2020-05-23T10:11:41.333Z","renda":600,"ativo":true,"dataUnix":1590228701,"dataISO8601":"2020-05-23T10:11:41.333Z"}';
end;

function TSMCliente.GetListaClientes(pQtdReg: Integer): string;
var
  lCliente: TCliente;

  procedure preencheCliente;
  begin
    lCliente.ID := qryClienteID.AsInteger;
    lCliente.Nome := qryClienteNOME.AsString;
    lCliente.CPF := qryClienteCPF.AsString;
    lCliente.Codigo := qryClienteCODIGO.AsInteger;
    lCliente.DataNascimento := DateTimeToUnix(qryClienteDATA_NASCIMENTO.AsDateTime);
    lCliente.Renda := qryClienteRENDA.AsCurrency;
  end;

begin
  if pQtdReg < 1 then
  begin
    pQtdReg := 100;
  end else begin
    pQtdReg := pQtdReg + 1;
  end;

  qryCliente.Close;
  qryCliente.ParamByName('QTD').AsInteger := pQtdReg;
  qryCliente.Open;
  qryCliente.First;

  // ORM
  lCliente := TCliente.Create;
  Result := '';

  preencheCliente;
  Result := TJson.ObjectToJsonString(lCliente);
  qryCliente.Next;

  while not qryCliente.Eof do
  begin
    preencheCliente;

    Result := Result + ',' + TJson.ObjectToJsonString(lCliente);

    qryCliente.Next;
  end;

  lCliente.Free;
  Result := '[' + Result + ']';
end;

end.

