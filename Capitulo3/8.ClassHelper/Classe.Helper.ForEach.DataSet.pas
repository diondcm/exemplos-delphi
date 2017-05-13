unit Classe.Helper.ForEach.DataSet;

interface

uses
  Data.DB, System.SysUtils;

type
  TDataSetForEach = reference to procedure (pDataSet: TDataSet);

  TDataSetHelper = class helper for TDataSet
    procedure ForEach(const pMethod: TDataSetForEach);
  end;

implementation

{ TDataSetHelper }

procedure TDataSetHelper.ForEach(const pMethod: TDataSetForEach);
var
  lRecNo: Integer;
begin
  if not Self.Active then
  begin
    raise Exception.Create('DataSet fechado!');
  end;

  if Self.IsEmpty then
  begin
    raise Exception.Create('DataSet vazio!');
  end;

  lRecNo := Self.RecNo;
  Self.DisableControls;
  try
    Self.First;
    while not Self.Eof do
    begin
      try
        pMethod(Self);
      except
        on E: Exception do
        begin
          raise Exception.Create('Exceção durante Loop em Dataset: ' +
            Self.Name + ' No registro:' + Self.RecNo.ToString);
        end;
      end;

      Self.Next;
    end;
  finally
    Self.RecNo := lRecNo;
    Self.EnableControls;
  end;
end;

end.
