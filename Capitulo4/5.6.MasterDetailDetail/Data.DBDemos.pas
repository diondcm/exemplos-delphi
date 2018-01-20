unit Data.DBDemos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TdmdDBDemos = class(TDataModule)
    memCustomer: TFDMemTable;
    frxReportMasterDetail: TfrxReport;
    frxDBCustomer: TfrxDBDataset;
    memOrders: TFDMemTable;
    frxDBOrders: TfrxDBDataset;
  strict private
    class var FInstancia: TdmdDBDemos;
  private
    class function GetInstancia: TdmdDBDemos; static;
  public
    class property Instancia: TdmdDBDemos read GetInstancia write FInstancia;
  end;

//var
//  dmdDBDemos: TdmdDBDemos;

implementation

uses
  Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdDBDemos }

class function TdmdDBDemos.GetInstancia: TdmdDBDemos;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TdmdDBDemos.Create(Application);
  end;

  Result := FInstancia;
end;

end.
