unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, Data.Base, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdProduto = class(TdmdBase)
    qryDadosIDPRODUTO: TFDAutoIncField;
    qryDadosDESCRICAO: TWideStringField;
    qryDadosDIAS_ENTREGA: TIntegerField;
    qryDadosIMPORTADO: TBooleanField;
    qryDadosPRECO: TLargeintField;
    qryDadosESTOQUE: TLargeintField;
    procedure qryDadosNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdProduto: TdmdProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdProduto.qryDadosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDadosIMPORTADO.AsBoolean := False;
  qryDadosESTOQUE.AsInteger := 0;
end;

end.
