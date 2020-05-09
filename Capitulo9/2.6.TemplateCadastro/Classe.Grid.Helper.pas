unit Classe.Grid.Helper;

interface

uses
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB;

type
  TDBGridHelper = class helper for TDBGrid
    procedure IdexaPorField(pColumn: TColumn);
  end;

implementation

{ TDBGridHelper }

procedure TDBGridHelper.IdexaPorField(pColumn: TColumn);
var
  lQry: TFDQuery;
  lIdx: TFDIndex;
begin
  if Assigned(pColumn) and Assigned(pColumn.Field) and Assigned(pColumn.Field.DataSet) then
  begin
    if pColumn.Field.FieldKind = fkData then
    begin
      if pColumn.Field.DataSet is TFDQuery then
      begin
        lQry := TFDQuery(pColumn.Field.DataSet);

        if (lQry.IndexFieldNames = '') or (lQry.IndexFieldNames <> pColumn.Field.FieldName) then
        begin
          lQry.IndexFieldNames := pColumn.Field.FieldName;
        end else begin
          lIdx := lQry.Indexes.Add;
          lIdx.Name := pColumn.Field.FieldName + 'FieldDesc';
          lIdx.Fields := pColumn.Field.FieldName;
          lIdx.Options := [soDescending];
          lIdx.Active := True;

          lQry.IndexFieldNames := '';
          lQry.IndexName := lIdx.Name;
        end;
      end;
    end;
  end;
end;

end.
