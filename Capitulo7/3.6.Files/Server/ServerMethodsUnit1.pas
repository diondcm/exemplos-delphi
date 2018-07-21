unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json, Rest.Json,
    DataSnap.DSProviderDataModuleAdapter, Data.DBXPlatform,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Pessoa, Classe.Resposta;

type
  TCarro = class
  end;

  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetPessoa(pPessoaID: Integer): TPessoa;
    function GetPessoaComOwner: TPessoaComOwner;
    function SetPessoa(pPessoa: TPessoa): Boolean;
    function GetListaPessoa: TListaPessoa;

    function GetCarro(pID: Integer): Boolean;
    function GetCarroSemTratamento(pID: Integer): Boolean;


    //
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCarro(pID: Integer): Boolean;
var
  lRet: TResposta<TCarro>;
begin
  lRet := TResposta<TCarro>.Create;
  try
    raise Exception.Create('Error Message ıÈ·Í');
  except
    on E: Exception do
    begin
      lRet.Erro := E.Message;
      lRet.Status := False;
      lRet.CodErro := 435;
    end;
  end;

  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := TJson.ObjectToJsonString(lRet);
end;

function TServerMethods1.GetCarroSemTratamento(pID: Integer): Boolean;
begin
  raise Exception.Create('Error Message');
end;

function TServerMethods1.GetListaPessoa: TListaPessoa;
begin
  Result := TListaPessoa.Create;
  // cuidado classe filha vai dar access
end;

function TServerMethods1.GetPessoa(pPessoaID: Integer): TPessoa;
begin
  Result := TPessoa.Create; // N„o compatÌvel com polimorfismo: TPessoaRegras
  Result.Nome := 'Teste';
  Result.ID := 10;

  //Result := nil; no client, isso gera access
end;

function TServerMethods1.GetPessoaComOwner: TPessoaComOwner;
begin
  Result := TPessoaComOwner.Create(nil);
  //Result.Free; // N„o dar Free aqui
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetPessoa(pPessoa: TPessoa): Boolean;
var
  lVal: TValidaPessoa;
begin
  if Assigned(pPessoa) then
  begin
    lVal := TValidaPessoa.Create;
    lVal.ValidaCampos(pPessoa);
    lVal.Free; // Sem o Free, Gera memory leak
    //  pPessoa.Free; // gera invalid op error
  end else begin

  end;
end;

end.

