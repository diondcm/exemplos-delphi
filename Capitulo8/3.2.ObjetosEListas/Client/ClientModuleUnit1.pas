unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethodsGeralClient: TServerMethodsGeralClient;
    function GetServerMethodsGeralClient: TServerMethodsGeralClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethodsGeralClient: TServerMethodsGeralClient read GetServerMethodsGeralClient write FServerMethodsGeralClient;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServerMethodsGeralClient.Free;
  inherited;
end;

function TClientModule1.GetServerMethodsGeralClient: TServerMethodsGeralClient;
begin
  if FServerMethodsGeralClient = nil then
    FServerMethodsGeralClient:= TServerMethodsGeralClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FServerMethodsGeralClient;
end;

end.
