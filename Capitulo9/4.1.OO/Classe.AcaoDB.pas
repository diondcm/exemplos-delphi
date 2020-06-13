unit Classe.AcaoDB;

interface

uses
  Classe.Acao, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet;

type
  TAcaoDB = class(TAcao)
  private
    FDataSet: TFDMemTable;
    procedure InstanciaDataSet;
    function GetDataSet: TFDMemTable;
    procedure SetDataSet(const Value: TFDMemTable);
    procedure AlimentaDataSet;
  public
    destructor Destroy; override;
    function GetDados: IFDDataSetReference;

    class procedure CarregaDeArquivo(pAbrev, pArq: string; pDataSet: TDataSet; pGuardaCache: Boolean = False); override;

    property DataSet: TFDMemTable read GetDataSet write SetDataSet;
  end;

implementation

{ TAcaoDB }

procedure TAcaoDB.AlimentaDataSet;
begin
  FDataSet.DisableControls;
  try
    for var val: TValor in Valores do
    begin
      FDataSet.Append;
      FDataSet.FieldByName('valor').AsCurrency := val.Valor;
      FDataSet.FieldByName('data').AsDateTime := val.Data;
      FDataSet.Post;
    end;
  finally
    FDataSet.EnableControls;
  end;
end;

class procedure TAcaoDB.CarregaDeArquivo(pAbrev, pArq: string;
  pDataSet: TDataSet; pGuardaCache: Boolean);
begin
  var ac: TAcaoDB := TAcaoDB.Create(pAbrev, pArq, pGuardaCache);

  if pDataSet is TFDDataSet then
  begin
    (pDataSet as TFDDataSet).Close;
    TFDDataSet(pDataSet).Data := ac.GetDados;
  end;

  ac.Free;
end;

destructor TAcaoDB.Destroy;
begin
  FDataSet.Free;

  inherited;
end;

function TAcaoDB.GetDados: IFDDataSetReference;
begin
  Result := GetDataSet.Data;
end;

function TAcaoDB.GetDataSet: TFDMemTable;
begin
  InstanciaDataSet;
  Result := FDataSet;
end;

procedure TAcaoDB.InstanciaDataSet;
begin
  if not Assigned(FDataSet) then
  begin
    FDataSet := TFDMemTable.Create(nil);

    FDataSet.FieldDefs.Add('valor', ftCurrency);
    FDataSet.FieldDefs.Add('data', ftDateTime);

    FDataSet.Open;
    AlimentaDataSet;
  end;
end;

procedure TAcaoDB.SetDataSet(const Value: TFDMemTable);
begin
  InstanciaDataSet;
  if FDataSet <> Value then
  begin
    FDataSet.Data := Value.Data;
  end;
end;

end.
