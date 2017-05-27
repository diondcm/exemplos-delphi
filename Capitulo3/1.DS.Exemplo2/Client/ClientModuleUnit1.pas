unit ClientModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule1 = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMAcaoClient: TSMAcaoClient;
    function GetSMAcaoClient: TSMAcaoClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMAcaoClient: TSMAcaoClient read GetSMAcaoClient write FSMAcaoClient;

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
  FSMAcaoClient.Free;
  inherited;
end;

function TClientModule1.GetSMAcaoClient: TSMAcaoClient;
begin
  if FSMAcaoClient = nil then
    FSMAcaoClient:= TSMAcaoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMAcaoClient;
end;

end.
