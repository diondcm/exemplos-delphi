unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMGeralClient: TSMGeralClient;
    function GetSMGeralClient: TSMGeralClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMGeralClient: TSMGeralClient read GetSMGeralClient write FSMGeralClient;

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
  FSMGeralClient.Free;
  inherited;
end;

function TClientModule1.GetSMGeralClient: TSMGeralClient;
begin
  if FSMGeralClient = nil then
    FSMGeralClient:= TSMGeralClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMGeralClient;
end;

end.
