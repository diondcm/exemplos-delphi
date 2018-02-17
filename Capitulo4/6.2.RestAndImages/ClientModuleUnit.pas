unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit, Datasnap.DSClientRest;

type
  TClientModule = class(TDataModule)
    DSRestConnection: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FGetDadosClient: TGetDadosClient;
    function GetGetDadosClient: TGetDadosClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property GetDadosClient: TGetDadosClient read GetGetDadosClient write FGetDadosClient;

end;

var
  ClientModule: TClientModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule.Destroy;
begin
  FGetDadosClient.Free;
  inherited;
end;

function TClientModule.GetGetDadosClient: TGetDadosClient;
begin
  if FGetDadosClient = nil then
    FGetDadosClient:= TGetDadosClient.Create(DSRestConnection, FInstanceOwner);
  Result := FGetDadosClient;
end;

end.
