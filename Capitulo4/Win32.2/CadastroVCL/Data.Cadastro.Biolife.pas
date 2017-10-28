unit Data.Cadastro.Biolife;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd, Data.Win.ADODB, Datasnap.Provider, Data.SqlExpr,
  Data.DB, Datasnap.DBClient, Data.Conexao;

type
  [TAtributoGerador('SpeciesNo', '')]
  TdmdCadBiolife = class(TdmdBaseCadastro)
    cdsCadastroSpeciesNo: TFloatField;
    cdsCadastroCategory: TWideStringField;
    cdsCadastroCommon_Name: TWideStringField;
    cdsCadastroSpeciesName: TWideStringField;
    cdsCadastroLengthcm: TFloatField;
    cdsCadastroLength_In: TFloatField;
    cdsCadastroNotes: TWideMemoField;
    cdsCadastroGraphic: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCadBiolife: TdmdCadBiolife;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
