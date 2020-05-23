unit Client.Module;

interface

uses
  System.SysUtils, System.Classes, Client.Classes, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMFilesClient: TSMFilesClient;
    function GetSMFilesClient: TSMFilesClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMFilesClient: TSMFilesClient read GetSMFilesClient write FSMFilesClient;

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
  FSMFilesClient.Free;
  inherited;
end;

function TClientModule1.GetSMFilesClient: TSMFilesClient;
begin
  if FSMFilesClient = nil then
    FSMFilesClient:= TSMFilesClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMFilesClient;
end;

end.
