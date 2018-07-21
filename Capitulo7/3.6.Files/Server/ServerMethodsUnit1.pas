unit ServerMethodsUnit1;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, System.Json, Rest.Json, System.SyncObjs,
    DataSnap.DSProviderDataModuleAdapter, Data.DBXPlatform, System.Zlib,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Pessoa, Classe.Resposta;

type
  TCarro = class
  end;

  TServerMethods1 = class(TDSServerModule)
  private
    const
      LOGO_CLIENTE = 'logo_cliente';
      DADOS_CLIENTE = 'dados_cliente';

      // demonstração
      LOGO = 'imgCliente.bmp';
      DADOS = 'dados.txt';
    class var
      FLogo: string;
      FDados: string;
      FCriticalSec: TCriticalSection;
  private
    procedure AtualizaCache(const pNomeArq, pValorStream: string);
  public
    class constructor Create;
    class destructor Destroy;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetPessoa(pPessoaID: Integer): TPessoa;
    function GetPessoaComOwner: TPessoaComOwner;
    function SetPessoa(pPessoa: TPessoa): Boolean;
    function GetListaPessoa: TListaPessoa;

    function GetCarro(pID: Integer): Boolean;
    function GetCarroSemTratamento(pID: Integer): Boolean;

    function GetFile(pAbrevArquivo: string; out pSize: Int64): TStream;
    procedure SetFile(pAbrevArquivo, pOperacao: string; out pSize: Int64; pStm: TStream);
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TServerMethods1.AtualizaCache(const pNomeArq, pValorStream: string);
begin
  FCriticalSec.Acquire;
  try
    if pNomeArq = LOGO then
    begin
      FLogo := pValorStream;
    end else if pNomeArq = DADOS then
    begin
      FDados := pValorStream;
    end;
  finally
    FCriticalSec.Release;
  end;
end;

class constructor TServerMethods1.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TServerMethods1.Destroy;
begin
  FCriticalSec.Free;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetCarro(pID: Integer): Boolean;
var
  lRet: TResposta<TCarro>;
begin
  Result := True;
  lRet := TResposta<TCarro>.Create;
  try
    raise Exception.Create('Error Message õéáê');
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

function TServerMethods1.GetFile(pAbrevArquivo: string; out pSize: Int64): TStream;
var
  lArqPAraZippar: TStringStream;
  LZip: TZCompressionStream;
  lArqParaComprimir: string;
  lSt: TStringStream;
begin
  // Img, Mp3, PDF, Bin
  if (pAbrevArquivo = LOGO_CLIENTE) and FileExists(LOGO) then
  begin
    if FLogo <> '' then
    begin
      lSt := TStringStream.Create(FLogo);
      pSize := lSt.Size;
      Exit(lSt);
    end;

    lArqParaComprimir := LOGO;
  end else if (pAbrevArquivo = DADOS_CLIENTE) and FileExists(DADOS) then
  begin
    if FDados <> '' then
    begin
      lSt := TStringStream.Create(FDados);
      pSize := lSt.Size;
      Exit(lSt);
    end;

    lArqParaComprimir := DADOS;
  end;

  // Cuidado com ANSI do HTTP, Nestes casos, usa o MemoryStream
  Result := TStringStream.Create;
  if lArqParaComprimir <> '' then
  begin
    lArqPAraZippar := TStringStream.Create;
    lArqPAraZippar.LoadFromFile(lArqParaComprimir);
    LZip := TZCompressionStream.Create(clDefault, Result);
    LZip.CopyFrom(lArqPAraZippar, lArqPAraZippar.Size);
    LZip.Free;
    lArqPAraZippar.Free;

    AtualizaCache(lArqParaComprimir, TStringStream(Result).DataString);
  end;
end;

function TServerMethods1.GetListaPessoa: TListaPessoa;
begin
  Result := TListaPessoa.Create;
  // cuidado classe filha vai dar access
end;

function TServerMethods1.GetPessoa(pPessoaID: Integer): TPessoa;
begin
  Result := TPessoa.Create; // Não compatível com polimorfismo: TPessoaRegras
  Result.Nome := 'Teste';
  Result.ID := 10;

  //Result := nil; no client, isso gera access
end;

function TServerMethods1.GetPessoaComOwner: TPessoaComOwner;
begin
  Result := TPessoaComOwner.Create(nil);
  //Result.Free; // Não dar Free aqui
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods1.SetFile(pAbrevArquivo, pOperacao: string;
  out pSize: Int64; pStm: TStream);
var
  lStrStm: TStringStream;
  lUnZip: TZDecompressionStream;
begin
  if Assigned(pStm) then
  begin
    if CompareStr(pOperacao, 'upload') = 0 then
    begin
      lStrStm := TStringStream.Create;//(pParametroString);
      lUnZip := TZDecompressionStream.Create(pStm);
      lStrStm.CopyFrom(LUnZip, 0);
      LUnZip.Free;

      if CompareStr(pAbrevArquivo, LOGO_CLIENTE) = 0 then
      begin
        lStrStm.SaveToFile(IntToStr(GetTickCount) + '_' + LOGO);
      end else if CompareStr(pAbrevArquivo, DADOS_CLIENTE) = 0 then
      begin
        lStrStm.SaveToFile(IntToStr(GetTickCount) + '_' + DADOS);
      end;
      lStrStm.Free;
    end else begin
      // Download
    end;
  end;
end;

function TServerMethods1.SetPessoa(pPessoa: TPessoa): Boolean;
var
  lVal: TValidaPessoa;
begin
  Result := False;
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

