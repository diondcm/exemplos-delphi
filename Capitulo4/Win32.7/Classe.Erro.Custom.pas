unit Classe.Erro.Custom;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

type
  // MadExcept, Eureka
  ECustomError = class(Exception)
    class var FLogAtivo: Boolean;
  public
    class property LogAtivo: Boolean read FLogAtivo write FLogAtivo;

    constructor Create(const pMsg: string); overload;
    constructor Create(E: Exception); overload;
  end;

implementation

{ ECustomError }

constructor ECustomError.Create(const pMsg: string);
begin
  inherited;
end;

constructor ECustomError.Create(E: Exception);
var
  lStl: TStringList;
begin
  if FLogAtivo then
  try
    lStl := TStringList.Create;
    try
      if TFile.Exists('LogError.txt') then
      begin
        lStl.LoadFromFile('LogError.txt');
      end;

      lStl.Add(DateTimeToStr(Now) + ' - ' + E.QualifiedClassName + ' - ' + E.Message);

      lStl.SaveToFile('LogError.txt');
    finally
      lStl.Free;
    end;
  except
    //
  end;

  inherited Create(E.Message);
end;

end.
