unit Data.CDS;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Vcl.Forms;

type
  TdmdCDS = class(TDataModule)
    cdsMoeda: TClientDataSet;
    cdsCotacao: TClientDataSet;
    cdsHistorico: TClientDataSet;
    cdsDeletados: TClientDataSet;
    cdsAlteracoes: TClientDataSet;
  private
    class var
      FRefFormHistorico: TForm;
  public
    const
      XML_MOEDA = 'moeda.xml';
  public
    procedure CriarDados;
    procedure SalvarDados;
    procedure ExibeHistorico(pCds: TClientDataSet);
    class property RefFormHistorico: TForm read FRefFormHistorico write FRefFormHistorico;
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

procedure TdmdCDS.ExibeHistorico(pCds: TClientDataSet);
var
  lIndexNo: Integer;
  i: Integer;
begin
  cdsHistorico.Data := pCds.Delta;

  cdsDeletados.Data := pCds.Data;
  cdsDeletados.StatusFilter := [usDeleted];

  cdsAlteracoes.Close;
  cdsAlteracoes.FieldDefs.Clear;
  cdsAlteracoes.FieldDefs.Add('NOME_CAMPO', ftString, 50);
  cdsAlteracoes.FieldDefs.Add('VALOR_ANTIGO', ftString, 50);
  cdsAlteracoes.FieldDefs.Add('VALOR_NOVO', ftString, 50);
  cdsAlteracoes.CreateDataSet;


  lIndexNo := pCds.RecNo;
  pCds.DisableControls;
  try
    pCds.First;
    while not pCds.Eof do
    begin
      for i := 0 to pcds.FieldCount -1 do
      begin
        if pCds.Fields[i].OldValue <> pCds.Fields[i].NewValue then
        begin
          cdsAlteracoes.Append;
          cdsAlteracoes.FieldByName('NOME_CAMPO').AsString := pCds.Fields[i].DisplayLabel;
          cdsAlteracoes.FieldByName('VALOR_ANTIGO').Value := pCds.Fields[i].OldValue;
          cdsAlteracoes.FieldByName('VALOR_NOVO').Value := pCds.Fields[i].NewValue;
          // VarToStr(pCds.Fields[i].NewValue)

          cdsAlteracoes.Post;
        end;
      end;

      pCds.Next;
    end;
  finally
    pCds.RecNo := lIndexNo;
    pCds.EnableControls;
  end;

  if Assigned(FRefFormHistorico) then
  begin
    FRefFormHistorico.Show;
  end else
    raise Exception.Create('Form histórico não preenchido');
end;

procedure TdmdCDS.SalvarDados;
begin
  cdsMoeda.SaveToFile(XML_MOEDA, dfXML);
end;

end.
