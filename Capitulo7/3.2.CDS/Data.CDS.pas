unit Data.CDS;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TdmdCDS = class(TDataModule)
    cdsMoeda: TClientDataSet;
    cdsCotacao: TClientDataSet;
  private
    { Private declarations }
  public
    const
      XML_MOEDA = 'moeda.xml';
  public
    procedure CriarDados;
    procedure SalvarDados;
  end;

var
  dmdCDS: TdmdCDS;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdCDS }

procedure TdmdCDS.CriarDados;
begin
  if FileExists(XML_MOEDA) then
  begin
    cdsMoeda.LoadFromFile(XML_MOEDA);
  end else begin
    cdsMoeda.FieldDefs.Clear;
    cdsMoeda.FieldDefs.Add('DESCRICAO', ftString, 100);
    cdsMoeda.FieldDefs.Add('ABREVIATURA', ftString, 4);
    cdsMoeda.FieldDefs.Add('ATIVA', ftBoolean);
    cdsMoeda.CreateDataSet;
  end;
end;

procedure TdmdCDS.SalvarDados;
begin
  cdsMoeda.SaveToFile(XML_MOEDA, dfXML);
end;

end.
