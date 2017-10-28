unit Data.Cadastro.Vendors;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd, Data.Win.ADODB, Datasnap.Provider, Data.SqlExpr,
  Data.DB, Datasnap.DBClient, Data.Conexao;

type
  [TAtributoGerador('VENDORNO', 'GEN_GENERICO')]
  TdmdCadVendors = class(TdmdBaseCadastro)
    cdsCadastroVendorNo: TFloatField;
    cdsCadastroVendorName: TWideStringField;
    cdsCadastroAddress1: TWideStringField;
    cdsCadastroAddress2: TWideStringField;
    cdsCadastroCity: TWideStringField;
    cdsCadastroState: TWideStringField;
    cdsCadastroZip: TWideStringField;
    cdsCadastroCountry: TWideStringField;
    cdsCadastroPhone: TWideStringField;
    cdsCadastroFAX: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCadVendors: TdmdCadVendors;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
