unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  System.IOUtils, System.Zip, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs;

type
  TdmdDados = class(TDataModule)
    IdHTTP: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    FDConnection: TFDConnection;
    qryCustomer: TFDQuery;
    procedure FDConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    const
      DB = 'dbMobile.db';
      DB_ZIP = 'dbMobile.zip';
      URL_DOWNLOAD = 'http://192.168.15.17:8080/datasnap/rest/TServerMethods1/GetDBLocalMobileGeral'; //Apresentou problemas: GetDBLocalMobile';
  public
    function GetDBFileName: string;
    function GetDBFileZip: string;
    function TemDadosLocais: Boolean;
  end;

var
  dmdDados: TdmdDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmdDados }

procedure TdmdDados.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['Database'] := GetDBFileName;
end;

function TdmdDados.GetDBFileName: string;
begin
  Result := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath) + DB;
end;

function TdmdDados.GetDBFileZip: string;
begin
  Result := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath) + DB_ZIP;
end;

function TdmdDados.TemDadosLocais: Boolean;
var
  lStm: TStringStream;
  lOpenProc: TThreadProcedure;
begin
  lOpenProc :=
    procedure
    begin
      qryCustomer.Open;
    end;

  TThread.CreateAnonymousThread(
    procedure
    begin
      if not FileExists(GetDBFileName) then
      begin

    //    lStm := TStringStream.Create;
    //    IdHTTP.Get(URL_DOWNLOAD, lStm);
    //    lStm.SaveToFile(GetDBFileZip);
    //    lStm.Free;

    //    TZipFile.ExtractZipFile(GetDBFileZip, ExtractFilePath(GetDBFileName));
      end;

      TThread.Synchronize(nil, lOpenProc);
    end).Start;

  Result := True;
end;

end.
