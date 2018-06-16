unit Classe.DBGrid.Helper;

interface

uses
  Vcl.DbGrids;

type
  TDbGridHelper = class helper for TDBGrid
    procedure IndexaPorField(pColumn: TColumn); overload;
    procedure IndexaPorField(const pFieldName: string); overload;
  end;


implementation

uses
  System.SysUtils, System.Variants, System.Classes,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

{ TDbGridHelper }

procedure TDbGridHelper.IndexaPorField(pColumn: TColumn);
const
  FIELD_DESC = 'FiledDesc';
var
  lFds: TFDDataSet;
  lIdx: TIndexDef;
  lIxd: TFDIndex;

  function GetIndex(const pIndexName: string; pIndexDefs: TIndexDefs): TIndexDef;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to pIndexDefs.Count -1 do
    begin
      if CompareStr(pIndexName, pIndexDefs[i].Name) = 0 then
      begin
        // Exit(pIndexDefs[i]);
        Result := pIndexDefs[i];
        Break;
      end;
    end;
  end;

begin
  if Assigned(pColumn.Field) and Assigned(pColumn.Field.DataSet) then
  begin
    if pColumn.Field.DataSet is TFDDataSet then
    begin
      if pColumn.Field.FieldKind <> fkData then
      begin
        raise Exception.Create('Indexação somente por fields de dados: ' +
          pColumn.Field.FieldName);
      end;

      lFds := TFDDataSet(pColumn.Field.DataSet);
      if (lFds.IndexFieldNames = '') or
        (CompareStr(lFds.IndexFieldNames, pColumn.Field.FieldName) <> 0) then
      begin
        lFds.IndexName := '';
        lFds.IndexFieldNames := pColumn.Field.FieldName;
      end else begin
        lIdx := GetIndex(pColumn.Field.FieldName + FIELD_DESC, lFds.IndexDefs);
        if Assigned(lIdx) then
        begin
          lFds.IndexFieldNames := '';
          lFds.IndexName := lIdx.Name;
        end else begin
          lIxd := lFds.Indexes.Add;
          lIxd.Name := pColumn.Field.FieldName + FIELD_DESC;
          lIxd.Fields := pColumn.Field.FieldName;
          lIxd.Options := [soDescending];
          lIxd.Active := True;

          lFds.IndexFieldNames := '';
          lFds.IndexName := pColumn.Field.FieldName + FIELD_DESC;
        end;
      end;
    end else
      raise Exception.Create('Classe de dataset não contemplada para ordenação: ' +
        pColumn.Field.DataSet.ClassName);
  end else
    raise Exception.Create('Dataset não preenchido.');
end;

procedure TDbGridHelper.IndexaPorField(const pFieldName: string);
var
  i: Integer;
  lFieldName: string;
begin
  //Self.ChangeScale(0, 0);
  lFieldName:= LowerCase(pFieldName);
  for i := 0 to Self.Columns.Count -1 do
  begin
    if CompareStr(lFieldName, LowerCase(Self.Columns[i].FieldName)) = 0 then
    begin
      IndexaPorField(Self.Columns[i]);
      Break;
    end;
  end;
end;

end.
