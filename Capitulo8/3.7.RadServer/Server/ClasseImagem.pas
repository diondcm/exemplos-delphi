unit ClasseImagem;

interface

uses
  System.SysUtils, System.Classes, System.JSON, EMS.ResourceAPI, EMS.Services, EMS.ResourceTypes, System.SyncObjs, System.Hash;

type
  [ResourceName('imagem')]
  TImagemResource = class(TDataModule)
  private
    class var
      FImagem: string;
      FHash: string;
      FCriticalSec: TCriticalSection;
  public
    class constructor Create;
    class destructor Destroy;
  published
//    [ResourceSuffix ('*')]
//    [EndpointProduce ('image/jpeg')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure register;
begin
  RegisterResource(TypeInfo(TImagemResource));
end;

{ TImagemResource }

class constructor TImagemResource.Create;
begin
  FCriticalSec := TCriticalSection.Create;
end;

class destructor TImagemResource.Destroy;
begin
  FCriticalSec.Free;
end;

procedure TImagemResource.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  fs: TStringStream;
begin
  if FImagem = '' then
  begin
    fs := TStringStream.Create;
    fs.LoadFromFile('C:\Users\Instrutor01\Downloads\IMG-9108.JPG');

    FCriticalSec.Acquire;
    try
      FImagem := fs.DataString;
      FHash := THashSHA2.GetHashString(fs);
    finally
      FCriticalSec.Release;
    end;

    AResponse.Body.SetStream(fs, 'image/jpeg', True);
  end else begin
    AResponse.Body.SetStream(TStringStream.Create(FImagem), 'image/jpeg', True);
  end;
end;

procedure TImagemResource.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];

  if CompareStr(LItem, FHash) <> 0 then
  begin
    AResponse.Body.SetStream(TStringStream.Create(FImagem), 'image/jpeg', True);
  end else begin
    AResponse.Body.SetValue(TJSONObject.Create(TJSONPair.Create('imagem', 'ok')), True);
  end;
end;

initialization
  register;

end.
