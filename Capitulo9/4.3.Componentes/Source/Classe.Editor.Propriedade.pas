unit Classe.Editor.Propriedade;

interface

uses
  DesignEditors, DesignIntf, Vcl.Dialogs;

type
  // object inspector
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  // no popup menu da IDE
  TEditorMenu = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


implementation

{ TEditorMenu }

uses Form.Sobre;

procedure TEditorMenu.ExecuteVerb(Index: Integer);
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

function TEditorMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o DBDateTimePicker';
  end;
end;

function TEditorMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TShowAbout }

procedure TShowAbout.Edit;
begin
  inherited;
  var lfrm : TFrmSobre := TfrmSobre.Create(nil);
  lfrm.ShowModal;
  lfrm.Free;
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

end.
