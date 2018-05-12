unit Classe.Parametros;

interface

type
  TParametros = class
    class procedure ExecutAlgo(
      pData: TDateTime;
      pFloat: Double;
      pInteiro: Integer;
      pStr: string);

    class procedure ExecutAlgoConst(
      const pData: TDateTime;
      const pFloat: Double;
      const pInteiro: Integer;
      const pStr: string);

    class procedure ExecutAlgoVar(
      var pData: TDateTime;
      var pFloat: Double;
      var pInteiro: Integer;
      var pStr: string);
  end;

implementation

uses
  System.SysUtils;

{ TParametros }

class procedure TParametros.ExecutAlgo(pData: TDateTime; pFloat: Double; pInteiro: Integer; pStr: string);
begin
  pData := 0;
  pFloat := 0;
  pInteiro := 0;
  pStr := '';
  Writeln(Format('$%p Str: %s', [@pStr, pStr]));
  Writeln(Format('$%p Int: %d', [@pInteiro, pInteiro]));
end;

class procedure TParametros.ExecutAlgoConst(const pData: TDateTime; const pFloat: Double; const pInteiro: Integer; const pStr: string);
begin
  Writeln('');
//  pData := 0;
//  pFloat := 0;
//  pInteiro := 0;
//  pStr := '';
  Writeln(Format('@%p $%p Str: %s', [Pointer(pStr), @pStr, pStr]));
  Writeln(Format('@%p $%p Int: %d', [Pointer(pInteiro), @pInteiro, pInteiro]));
  Writeln('');
end;

class procedure TParametros.ExecutAlgoVar(var pData: TDateTime; var pFloat: Double; var pInteiro: Integer; var pStr: string);
begin
  Writeln('');
  pData := 0;
  pFloat := 0;
  pInteiro := 0;
  pStr := '';
  Writeln(Format('$%p Str: %s', [@pStr, pStr]));
  Writeln(Format('$%p Int: %d', [@pInteiro, pInteiro]));
  Writeln('');
end;

end.
