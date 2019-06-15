unit Classe.Editor.Propriedades;

interface

uses
  DesignEditors, DesignIntf, Vcl.Dialogs, Form.Sobre;

type
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  TEditoMenu = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

implementation

{ TShowAbout }

procedure TShowAbout.Edit;
var
  lfrm: TfrmSobre;
begin
  inherited;
  lfrm := TfrmSobre.Create(nil);
  lfrm.ShowModal;
  lfrm.Free;
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TEditoMenu }

procedure TEditoMenu.ExecuteVerb(Index: Integer);
var
  lfrm: TfrmSobre;
begin
  inherited;
  case Index of
    0:
    begin
      lfrm := TfrmSobre.Create(nil);
      lfrm.ShowModal;
      lfrm.Free;
    end;
  end;
end;

function TEditoMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o DBDateTimePicker';
  end;
end;

function TEditoMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
