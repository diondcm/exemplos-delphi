unit Classe.Base;

interface

uses
  System.Classes, System.SysUtils;

type
  TClasseBase = class(TComponent)
  strict private
    FID: Integer;
    procedure SetID(const Value: Integer);
  protected
    function ConsultaDB(pID: Integer): Boolean; virtual; abstract;
    function GetNovoID: Integer; virtual; abstract;

    property ID: Integer read FID write SetID;
  public
    function ToString: string; override;
  end;

implementation

{ TClasseBase }

procedure TClasseBase.SetID(const Value: Integer);
begin
  FID := Value;
  if not ConsultaDB(FID) then
  begin
    FID := GetNovoID;
  end;
end;

function TClasseBase.ToString: string;
begin
  Result := 'ID: ' + FID.ToString;
end;

end.
