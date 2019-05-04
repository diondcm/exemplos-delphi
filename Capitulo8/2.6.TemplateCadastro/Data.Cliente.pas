unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, Data.Conexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Variants,
  Data.Base;

type
  TdmdCliente = class(TdmdBase)
    qryDadosIDCLIENTE: TFDAutoIncField;
    qryDadosNOME: TWideStringField;
    qryDadosDATA_CADASTRO: TDateTimeField;
    qryDadosCPF: TWideStringField;
    qryDadosRG: TWideStringField;
    qryDadosDATA_NASCIMENTO: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCliente: TdmdCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
