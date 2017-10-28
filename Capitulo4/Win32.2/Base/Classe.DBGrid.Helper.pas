unit Classe.DBGrid.Helper;

interface

uses
  Vcl.DBGrids;

type
  TDBGridHelper = class
    class procedure IndexaPorField(pColumn: TColumn);
  end;

implementation

uses
  System.Classes, System.SysUtils, Data.DB, Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;

{ TDBGridHelper }

class procedure TDBGridHelper.IndexaPorField(pColumn: TColumn);
var
  lCds: TClientDataSet;
  lIdx: TIndexDef;
  lFds: TFDDataSet;
const
  FIELD_DESC = 'FiledDesc';

  function GetIndex(const pIndexName: string; pIndexDefs: TIndexDefs): TIndexDef;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to pIndexDefs.Count -1 do
    begin
      if CompareStr(pIndexDefs[i].Name, pIndexName) = 0 then
      begin
        //Exit(pIndexDefs[i]);
        Result := pIndexDefs[i];
        Break;
      end;
    end;
  end;

begin
  // Não por sql >> trazer esse custo
  if Assigned(pColumn.Field.DataSet) then
  begin
    if (pColumn.Field.DataSet is TClientDataSet) then
    begin
      lCds := TClientDataSet(pColumn.Field.DataSet);
      if (lCds.IndexFieldNames = '') or (CompareStr(lCds.IndexFieldNames, pColumn.Field.FieldName) <> 0) then
      begin
        lCds.IndexName := '';
        lCds.IndexFieldNames := pColumn.Field.FieldName;
      end else begin
        lIdx := GetIndex(pColumn.Field.FieldName + FIELD_DESC, lCds.IndexDefs);
        if Assigned(lIdx) then
        begin
          lCds.IndexFieldNames := '';
          lCds.IndexName := lIdx.Name;
        end else begin
          lCds.IndexDefs.Add(pColumn.Field.FieldName + FIELD_DESC, pColumn.Field.FieldName, [ixDescending]);
          lCds.IndexFieldNames := '';
          lCds.IndexName := pColumn.Field.FieldName + FIELD_DESC;
        end;
      end;
    end;

    if (pColumn.Field.DataSet is TFDDataSet) then
    begin
      lFds := TFDDataSet(pColumn.Field.DataSet);
      if (lFds.IndexFieldNames = '') or (CompareStr(lFds.IndexFieldNames, pColumn.Field.FieldName) <> 0) then
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
          lFds.IndexDefs.Add(pColumn.Field.FieldName + FIELD_DESC, pColumn.Field.FieldName, [ixDescending]);
          lFds.IndexFieldNames := '';
          lFds.IndexName := pColumn.Field.FieldName + FIELD_DESC;
        end;
      end;
    end;
  end;
end;

end.
