unit Data.Cores;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdCores = class(TDataModule)
    FDConnection: TFDConnection;
    qryScript: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryCores: TFDQuery;
    qryCoresID: TIntegerField;
    qryCoresDESCRICAO: TStringField;
    qryCoresVALOR: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCores: TdmdCores;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdCores.DataModuleCreate(Sender: TObject);
begin
  qryScript.ExecSQL;
end;

end.
