{
Copyright © 2017-2018 Piotr Chlebek
http://sharktime.com/
}
unit data;

interface

uses defs;

type
  TOnLog = reference to procedure (pMsg: string);

  TLog = class
  private
    class procedure DoOnLog(pMsg: string);

  public
    class var
      OnLog: TOnLog;
  end;

  TCompras = class
  class var
    FMax: Single;
    FMin: Single;
    FSoma: Double;
    FMedia: Double;
    FQtd: Integer;
  end;

  function DataLoad(const path: string): TDataArr;
  //procedure DataSplit(var d: TDataArr; const testPerc: Single; const seed: Integer);
  function DataNormalize(const d: TDataArr; const vmin,vmax: Single): TDataArr;
  function DataSave(const d: TDataArr; const pathTrain, pathTest: string; const problem: Integer; const perm: Integer = 0): Boolean;


  function DataNormalizeCompras(const d: TDataArr; const vmin,vmax: Single): TDataArr;
  function DataLoadCompras(const path: string): TDataArr;
  function DataSaveCompras(const d: TDataArr; const pathTrain, pathTest: string; const problem: Integer; const nSize, perm: Integer): Boolean;

implementation

uses
  func, SysUtils;

function DataLoad(const path: string): TDataArr;
var
  tf: TextFile;
  ndata, nin, nout, n, i: Integer;
begin
  SetLength(Result, 0);

  TLog.DoOnLog('Carregando...');
  if not FileExists(path) then
  begin
    TLog.DoOnLog('Arquivo não localizado: ' + path);
    Exit;
  end;

  AssignFile(tf, path);
  try
    Reset(tf);
    n := 0;
    ndata := 0;
    if not EOF(tf) then
    begin
      ReadLn(tf, ndata, nin, nout);
      TLog.DoOnLog(Format('ndata=%d  nin=%d  nout=%d', [ndata, nin, nout]));

      SetLength(Result, ndata);
      for i:= 0 to ndata-1 do
      begin
        FillChar(Result[i], SizeOf(TData), 0);
      end;

      while not EOF(tf) and (n < ndata) do
      begin
        ReadLn(tf, Result[n][0], Result[n][1]);
        Inc(n);
      end;
    end;
  finally
    CloseFile(tf);
  end;
end;

function DataNormalize(const d: TDataArr; const vmin,vmax: Single): TDataArr;
var
  i,k: Integer;
  dmax,dmin: TData;
begin
  TLog.DoOnLog('Normalizing data...');

  dmax := d[1];
  dmin := d[1];
  for i:=1 to High(d) do
    for k:=1 to High(TData) do
      begin
        if (dmax[k] < d[i][k]) then
          dmax[k] := d[i][k];
        if (dmin[k] > d[i][k]) then
          dmin[k] := d[i][k];
      end;

  for k:=1 to High(TData) do
  begin
    if (dmax[k] = dmin[k]) then
    begin
      TLog.DoOnLog('Warning! All values are the same in column '+ i2s(k+1));
      dmax[k] := dmax[k] + 0.1;
      dmin[k] := dmin[k] - 0.1;
    end;

    TLog.DoOnLog(Format('%.3f .. %.3f', [dmin[k], dmax[k]]));
  end;

  SetLength(Result, Length(d));
  for i:=0 to High(d) do
  begin
    Result[i] := d[i];
    for k:=1 to High(TData) do
      Result[i][k] := vmin + (vmax-vmin) * (d[i][k] - dmin[k]) / (dmax[k] - dmin[k]);
  end;
end;

function DataSave(const d: TDataArr; const pathTrain, pathTest: string; const problem: Integer; const perm: Integer = 0): Boolean;

  procedure SaveSplit(const v: Single; const path: string; const perm: Integer = 0);
  var
    tf: TextFile;
    i,k,n,outputs: Integer;
    s: string;
  begin
    n := 100;
    outputs := 1;

    AssignFile(tf, path);
    try
      Rewrite(tf);
      WriteLn(tf, Format('%d %d %d', [n, NUMBER_OF_INPUTS, outputs]));
      FormatSettings.DecimalSeparator := '.';
      FormatSettings.ThousandSeparator := ',';
      for i:=0 to High(d) do
      begin
        s := Format('%.3f %.3f', [d[i][0], d[i][1]]);
        WriteLn(tf, s);
      end;
    finally
      CloseFile(tf);
    end;
  end;
begin
  try
    SaveSplit( SPLIT_TRAIN, pathTrain, perm );
    SaveSplit( SPLIT_TEST, pathTest, perm );
    Result := True;
  except
    Result := False;
  end;
end;

function DataLoadCompras(const path: string): TDataArr;
var
  tf: TextFile;
  ndata, nin, nout, n, i: Integer;
begin
  SetLength(Result, 0);

  TLog.DoOnLog('Carregando...');
  if not FileExists(path) then
  begin
    TLog.DoOnLog('Arquivo não localizado: ' + path);
    Exit;
  end;

  AssignFile(tf, path);
  try
    Reset(tf);
    n := 0;
    ndata := 0;
    if not EOF(tf) then
    begin
      ReadLn(tf, ndata, nin, nout);
      TLog.DoOnLog(Format('ndata=%d  nin=%d  nout=%d', [ndata, nin, nout]));

      SetLength(Result, ndata);
      for i:= 0 to ndata-1 do
      begin
        FillChar(Result[i], SizeOf(TData), 0);
      end;

      while not EOF(tf) and (n < ndata) do
      begin
        ReadLn(tf, Result[n][0], Result[n][1]);
        Inc(n);
      end;
    end;
  finally
    CloseFile(tf);
  end;
end;

function DataSaveCompras(const d: TDataArr; const pathTrain, pathTest: string; const problem: Integer; const nSize, perm: Integer): Boolean;

  procedure SaveSplit(pTest: Boolean; path: string; perm: Integer);
  var
    tf: TextFile;
    i,k: Integer;
    s: string;
    lSize: Integer;
  begin
    AssignFile(tf, path);
    try
      Rewrite(tf);
      if pTest then
      begin
        lSize := nSize;
      end else begin
        lSize := nSize;
//        lSize := Trunc(nSize * 0.6);
        // ¨60 % dos dados para treinar a rede, o restante para testar
        // note que para isso devemos ter uma quantidade significativa de dados
        // caso contrário teremos muito "ruído" nos resultados
      end;

      WriteLn(tf, Format('%d %d %d', [lSize, NUMBER_OF_INPUTS, NUMBER_OF_OUTPUTS]));
      FormatSettings.DecimalSeparator := '.';
      FormatSettings.ThousandSeparator := ',';
      for i:=0 to lSize do//High(d) do
      begin
        s := Format('%.3f %.3f', [d[i][0], d[i][1]]);
        WriteLn(tf, s);
      end;
    finally
      CloseFile(tf);
    end;
  end;
begin
  try
    SaveSplit(False, pathTrain, perm);
    SaveSplit(True, pathTest, perm);
    Result := True;
  except
    Result := False;
  end;
end;

function DataNormalizeCompras(const d: TDataArr; const vmin,vmax: Single): TDataArr;
var
  i,k: Integer;
  dmax,dmin: TData;
begin
  TLog.DoOnLog('Normalizing data...');

  dmax := d[1];
  dmin := d[1];
  for i:=1 to High(d) do
  begin
    for k:=1 to High(TData) do
    begin
      if (dmax[k] < d[i][k]) then
        dmax[k] := d[i][k];
      if (dmin[k] > d[i][k]) then
        dmin[k] := d[i][k];

      TCompras.FQtd := TCompras.FQtd + 1;
      TCompras.FSoma := TCompras.FSoma + d[i][k];
      TCompras.FMax := dmax[k];
      TCompras.FMin := dmin[k];
    end;
  end;

  TCompras.FMedia := TCompras.FSoma / TCompras.FQtd;

  for k:=1 to High(TData) do
  begin
    if (dmax[k] = dmin[k]) then
    begin
      TLog.DoOnLog('Warning! All values are the same in column '+ i2s(k+1));
      dmax[k] := dmax[k] + 0.1;
      dmin[k] := dmin[k] - 0.1;
    end;

    TLog.DoOnLog('Range values: ' + Format('%.3f .. %.3f', [dmin[k], dmax[k]]));
  end;

  SetLength(Result, Length(d));
  for i:=0 to High(d) do
  begin
    Result[i] := d[i];
    for k:=1 to High(TData) do
      Result[i][k] := vmin + (vmax-vmin) * (d[i][k] - dmin[k]) / (dmax[k] - dmin[k]);
  end;
end;


{ TLog }

class procedure TLog.DoOnLog(pMsg: string);
begin
  if Assigned(OnLog) then
    OnLog(pMsg);
end;

end.

