{
Copyright © 2017-2018 Piotr Chlebek
http://sharktime.com/
}
unit func;

interface

uses
  fann,
  Math, // for Min()
  SysUtils; // for FloatToStrF()

function i2s(const value: Integer): string;
function f2s(const value: Single; const decimalDigits: Integer = 3): string;
function ForceInRange(const value,a,b: Integer): Integer;
procedure Log(const path,text: string);
function IndexOfHighestOutput(const arr: array of fann_type; const len: Integer = MaxInt): Integer;
function IndexOfSecondHighestOutput(const arr: array of fann_type; const len: Integer = MaxInt): Integer;
function doPerm(const value,a,b,c: Integer): Integer;

implementation

uses defs;

function i2s(const value: Integer): string;
begin
  Result := IntToStr(value);
end;

function f2s(const value: Single; const decimalDigits: Integer = 3): string;
begin
  Result := FloatToStrF(value, ffFixed, MaxInt, decimalDigits);
end;

function ForceInRange(const value,a,b: Integer): Integer;
begin
  Assert(a <= b);
  if (value < a) then Result := a
  else if (value > b) then Result := b
  else Result := value;
end;

procedure Log(const path,text: string);
var tf: TextFile;
begin
  AssignFile(tf, path);
  Append(tf);
  WriteLn(tf, text);
  CloseFile(tf);
end;

function IndexOfHighestOutput(const arr: array of fann_type; const len: Integer = MaxInt): Integer;
var imax,i: Integer;
begin
  imax := 0;
  for i:=1 to Min(High(arr), len-1) do
    if (arr[i] > arr[imax]) then
      imax := i;
  Result := imax;
end;

function IndexOfSecondHighestOutput(const arr: array of fann_type; const len: Integer = MaxInt): Integer;
var imax,i: Integer;
begin
  Result := -1;
  imax := 0;
  for i:=1 to Min(High(arr), len-1) do
    if (arr[i] > arr[imax]) then
      begin
        Result := imax;
        imax := i;
      end;
end;

function doPerm(const value,a,b,c: Integer): Integer;
begin
  Assert(NUMBER_OF_CLASSES = 3); // I know, this code not work for other number of classes
  Assert(value >= 1);
  Assert(value <= NUMBER_OF_CLASSES);
  Result := value; // this is not necessary, but compiler likes it
  if (value = a) then Result := 1
  else if (value = b) then Result := 2
  else if (value = c) then Result := 3
  else
    begin
      WriteLn('Can''t permute');
      Halt(1);
    end;
end;

end.
