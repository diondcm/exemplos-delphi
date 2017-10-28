unit Classe.Helper.DataSet;

interface

uses
  Data.DB, System.SysUtils;

type
  TDataSetForEach = reference to procedure (pDataSet: TDataSet);
  TDataSetError = reference to procedure (pDataSet: TDataSet; E: Exception);

  TDataSetHelper = class helper for TDataSet
    procedure ForEach(const pMetodoDataSet: TDataSetForEach; const pOnError{Failure}: TDataSetError = nil);
  end;

implementation

{ TDataSetHelper }

procedure TDataSetHelper.ForEach(const pMetodoDataSet: TDataSetForEach; const pOnError: TDataSetError);
var
  lRecNo: Integer;
begin
  if not Self.Active then
  begin
    if Assigned(pOnError) then
    begin
      pOnError(Self, Exception.Create('Consulta ainda não realizada'));
    end else begin
      raise Exception.Create('Consulta ainda não realizada');
    end;
  end;

  if Self.IsEmpty then
  begin
    raise Exception.Create('Sem registros para aplicar.');
  end;

  lRecNo := Self.RecNo;
  Self.First;

  Self.DisableControls;
  try
    while not Self.Eof do
    begin
      try
        pMetodoDataSet(Self);
      except
        on E: Exception do
        begin
          raise Exception.Create('Exceção durante Loop: ' + sLineBreak +
            'Obj: ' + Self.Name + ' registro: ' + Self.RecNo.ToString + sLineBreak +
            E.ClassName + ' - ' + E.Message);
        end;
      end;

      Self.Next;
    end;
  finally
    Self.RecNo := lRecNo;
    Self.EnableControls;
  end;

  //Self.First;
end;

end.
