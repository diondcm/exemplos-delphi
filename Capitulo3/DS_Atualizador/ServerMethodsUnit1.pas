unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json, Data.DBXJSONCommon,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.FileTransfer;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function updateEchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function GetVersaoAtual(pFileName, pVersao: string): TStatusFileTransfer;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetVersaoAtual(pFileName, pVersao: string): TStatusFileTransfer;
var
  lVersao: string;
  lComp: Integer;
  lFileSM: TMemoryStream;
  strFileStream: TFileStream;
begin
  Result := TStatusFileTransfer.Create;
  if FileExists(pFileName) then
  begin
    lVersao := TStatusFileTransfer.GetFileVersion(pFileName);
    lComp := CompareText(pVersao, lVersao);
    if lComp = 0 then
    begin
      Result.Versao := pVersao;
      Result.FileName := pFileName;
    end else // lComp <> 0, mesmo se > 0, pois significa regressão de versão no client
    begin
      Result.Versao := lVersao;
      Result.FileName := pFileName;

      strFileStream := TFileStream.Create(pFileName, fmOpenRead);
      Result.TesteArr := TDBXJSONTools.StreamToJSON(strFileStream, 0, strFileStream.Size);


//      lFileSM := TFileStream.Create(pFileName, fmOpenRead);
//      Result.Arquivo.LoadFromFile(pFileName);
//      Result.Arquivo.CopyFrom(lFileSM, lFileSM.Size);
//      Result.Arquivo.Position := 0;
    end;
  end else begin
    Result.Versao := '0.0.0.0';
    Result.FileName := 'Arquivo não encontrado';
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.updateEchoString(Value: string): string;
begin
  Result := EchoString(Value);
end;

end.

