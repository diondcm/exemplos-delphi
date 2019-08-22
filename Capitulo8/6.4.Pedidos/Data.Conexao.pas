unit Data.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.IOUtils;

type
  TdmdConexao = class(TDataModule)
    FDConnection: TFDConnection;
    qryCriaTabCotacao: TFDQuery;
    qryCotacao: TFDQuery;
    qryCotacaotid: TLargeintField;
    qryCotacaodate: TLargeintField;
    qryCotacaotype: TWideStringField;
    qryCotacaoprice: TFMTBCDField;
    qryCotacaoamount: TFMTBCDField;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdConexao: TdmdConexao;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmdConexao.FDConnectionAfterConnect(Sender: TObject);
begin
  qryCriaTabCotacao.ExecSQL;
end;

procedure TdmdConexao.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['Database'] := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath, 'dadosPedidos.db');
end;

end.
