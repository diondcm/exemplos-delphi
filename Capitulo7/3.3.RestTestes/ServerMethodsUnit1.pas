unit ServerMethodsUnit1;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth;

type
  TServerMethods1 = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    class var
      FCountIntances: Integer;
      FTotalCountIntances: Integer;
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function ExibeTickID: Integer;
    function ExibeThreadID: Integer;
    function GetCountInstances: Integer;
    function GetTotalCountInstances: Integer;

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  Tag := GetTickCount;
  InterlockedIncrement(FCountIntances);
  InterlockedIncrement(FTotalCountIntances);
end;

procedure TServerMethods1.DSServerModuleDestroy(Sender: TObject);
begin
  InterlockedDecrement(FCountIntances);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ExibeThreadID: Integer;
begin
  Result := GetCurrentThreadId;
end;

function TServerMethods1.ExibeTickID: Integer;
begin
  Result := Tag;
end;

function TServerMethods1.GetCountInstances: Integer;
begin
  Result := FCountIntances;
end;

function TServerMethods1.GetTotalCountInstances: Integer;
begin
  Result := FTotalCountIntances;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

