unit Data.Country;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, Data.DB,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageBin;

type
  TdmdCountry = class(TdmdBaseCadastro)
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    cdsCadastroCode: TIntegerField;
    cdsCadastroName: TWideStringField;
    cdsCadastroCapital: TWideStringField;
    cdsCadastroArea: TIntegerField;
    cdsCadastroPopulation: TIntegerField;
    cdsCadastroContinent: TWideStringField;
    memCountry: TFDMemTable;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    WideStringField3: TWideStringField;
    procedure cdsCadastroBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdCountry: TdmdCountry;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdCountry.cdsCadastroBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not memCountry.Active then
  begin
    memCountry.LoadFromFile('C:\Users\Aluno\Desktop\exemplos-delphi\SQLite\country.xml');
  end;

  cdsCadastro.SetProvider(memCountry);
  //dspCadastro.DataSet := memCountry;
end;

end.
