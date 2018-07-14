unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter, Data.FireDACJSONReflect,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin;

type
  TServerMethods1 = class(TDSServerModule)
    FrameworkConnection: TFDConnection;
    qryCliente: TFDQuery;
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetClientes: TFDJSONDataSets;
    function SetClientes(pDeltaList: TFDJSONDeltas): Boolean;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetClientes: TFDJSONDataSets;
begin
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryCliente);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetClientes(pDeltaList: TFDJSONDeltas): Boolean;
begin
  Result := TFDJSONDeltasApplyUpdates.ListApplyUpdates(
    pDeltaList,
    'CLIENTES',
    qryCliente.Command) = 0;
end;

end.

