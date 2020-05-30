unit Endpoint.Imagem;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.DateUtils, System.Generics.Collections, System.Hash, System.SyncObjs, System.NetEncoding,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, EMS.DataSetResource, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  [ResourceName('imagem')]
  TImagemResource = class(TDataModule)
  private
    { Private declarations }
  public
    const
      IMG_LOGO = '1';
      IMG_BACK_GROUND = '2';
      IMG_HELP = '3';
      IMG_PATH = 'C:\Users\AquaAluno09\Pictures\Screenshots\';

    class var
       FListaImagens: TDictionary<string, string>; //HashImagem // Imagem
       FListaHashes: TDictionary<string, string>; // ID   //  HashImagem
       FCriticalSec: TCriticalSection;

    class constructor Create;
    class destructor Destroy;
    class procedure AlteraHashes(pID, pHash, pDataString: string);
  published
    [EndPointRequestSummary('Tests', 'ListItems', 'Retrieves list of items', 'application/json', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'GetItem', 'Retrieves item with specified ID', 'application/json', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PostItem', 'Creates new item', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A new item content', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(409, 'Item Exist', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PutItem', 'Updates item with specified ID', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A item changes', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'DeleteItem', 'Deletes item with specified ID', '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TImagemResource }

class procedure TImagemResource.AlteraHashes(pID, pHash, pDataString: string);
begin
  FCriticalSec.Acquire;
  try
    if FListaHashes.ContainsKey(pID) then
    begin
      FListaHashes[pID] := pHash;
    end else begin
      FListaHashes.Add(pID, pHash);
    end;

    if FListaImagens.ContainsKey(pHash) then
    begin
      FListaImagens[pHash] := pDataString;
    end else begin
      FListaImagens.Add(pHash, pDataString);
    end;
  finally
    FCriticalSec.Release;
  end;
end;

class constructor TImagemResource.Create;
begin
  FCriticalSec := TCriticalSection.Create;;
  FListaImagens := TDictionary<string, string>.Create;
  FListaHashes := TDictionary<string, string>.Create;

  FListaHashes.Add(IMG_LOGO, '');
  FListaHashes.Add(IMG_BACK_GROUND, '');
  FListaHashes.Add(IMG_HELP, '');
end;

procedure TImagemResource.DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  FListaImagens.Free;
end;

class destructor TImagemResource.Destroy;
begin
  FCriticalSec.Free;
  FListaImagens.Free;
  FListaHashes.Free;
end;

procedure TImagemResource.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
const
  IMG = 'C:\Users\AquaAluno09\Pictures\Screenshots\3.jpg';
begin
  var lStm: TStringStream := TStringStream.Create;
  lStm.LoadFromFile(IMG);
  AResponse.Body.SetStream(lStm, 'imagem/jpeg', True);
end;

procedure TImagemResource.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  var lstl: TStringList := TStringList.Create;
  lstl.Delimiter := ';';
  lstl.DelimitedText := ARequest.Params.Values['item'];
  var img: string := lstl.Values['img'];
  var hash: string := lstl.Values['hash'];

  if FListaHashes.ContainsKey(img) then
  begin
    if CompareStr(FListaHashes[img], hash) = 0 then
    begin
      AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('msg', 'ok')), True);
    end else begin
      var lhs: string := FListaHashes[img];
      if not FListaImagens.ContainsKey(lhs) then
      begin
        var arqImagem: string;
        if img = IMG_LOGO then
        begin
          arqImagem := IMG_PATH + IMG_LOGO + '.jpg';
        end else if img = IMG_BACK_GROUND then
        begin
          arqImagem := IMG_PATH + IMG_BACK_GROUND + '.jpg';
        end else if img = IMG_HELP then
        begin
          arqImagem := IMG_PATH + IMG_HELP + '.jpg';
        end else begin
          AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('erro', 'imagem: ''''' + img + ''''' não existe no server')), True);
          Exit;
        end;

        var lstm: TStringStream := TStringStream.Create;
        lstm.LoadFromFile(arqImagem);

        lhs := THashSHA2.GetHashString(lstm);

        var base64Img: string := TNetEncoding.Base64.Encode(lstm.DataString);

        // Para trafegar menos infos, usar ZIP, fora apache e IIS, que tem filtro nativo
        // http://docwiki.embarcadero.com/CodeExamples/Rio/en/ZLibCompressDecompress_(Delphi)
        AlteraHashes(img, lhs, base64Img);
      end;

      AResponse.Body.SetStream(TStringStream.Create(FListaImagens[lhs]), 'imagem/jpeg', True);
    end;
  end else begin
    AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('erro', 'imagem: ''''' + img + ''''' não encontrada')), True);
  end;

  lstl.Free;
end;

procedure TImagemResource.Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin

end;

procedure TImagemResource.PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin

end;

procedure Register;
begin
  RegisterResource(TypeInfo(TImagemResource));
end;

initialization
  Register;

end.
