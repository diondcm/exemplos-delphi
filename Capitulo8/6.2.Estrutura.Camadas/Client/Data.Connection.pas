unit Data.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.IOUtils, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmdConnection = class(TDataModule)
    FDConnection: TFDConnection;
    qryCriaCliente: TFDQuery;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConnection: TdmdConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdConnection.FDConnectionAfterConnect(Sender: TObject);
begin
  qryCriaCliente.ExecSQL; // baixar o DDL do server
end;

procedure TdmdConnection.FDConnectionBeforeConnect(Sender: TObject);
begin
  {$IFDEF ANDROID | iOS}
  FDConnection.Params.Values['Database'] :=  System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'client.db');
  {$ELSE}
  FDConnection.Params.Values['Database'] := 'fast.db';
  {$ENDIF}
end;

end.
