unit Data.Usuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmdUsuario = class(TDataModule)
    FDConnection: TFDConnection;
    qryUsuario: TFDQuery;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdUsuario: TdmdUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdUsuario.FDConnectionAfterConnect(Sender: TObject);
begin
  FDConnection.ExecSQL(
    'create table if not exists usuario(ID INTEGER, NOME STRING, DATACADATRO DATETIME)'
    )
end;

procedure TdmdUsuario.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['DataBase'] := ExtractFilePath(ParamStr(0)) + 'dados.db';
end;

end.
