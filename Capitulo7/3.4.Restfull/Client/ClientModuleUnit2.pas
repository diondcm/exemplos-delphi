unit ClientModuleUnit2;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit2, Datasnap.DSClientRest;

type
  TClientModule2 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    FMethodsCotacaoClient: TMethodsCotacaoClient;
    function GetServerMethods1Client: TServerMethods1Client;
    function GetMethodsCotacaoClient: TMethodsCotacaoClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;
    property MethodsCotacaoClient: TMethodsCotacaoClient read GetMethodsCotacaoClient write FMethodsCotacaoClient;

end;

var
  ClientModule2: TClientModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule2.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule2.Destroy;
begin
  FServerMethods1Client.Free;
  FMethodsCotacaoClient.Free;
  inherited;
end;

function TClientModule2.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethods1Client.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethods1Client;
end;
function TClientModule2.GetMethodsCotacaoClient: TMethodsCotacaoClient;
begin
  if FMethodsCotacaoClient = nil then
    FMethodsCotacaoClient:= TMethodsCotacaoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FMethodsCotacaoClient;
end;

end.
