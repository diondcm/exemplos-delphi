unit Classe.Editor.Propriedade;

interface

// Add reference from path: C:\Program Files (x86)\Embarcadero\Studio\19.0\lib\win32\release

uses
  DesignEditors, DesignIntf, Form.Sobre{, Classe.DB.DateEdit};
  { OTA: Open Tools API, cnPack, GeXpertss }

type
  { Edita no Inpector }
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

  { Edita no Click da IDE }
  TEditorMenu = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

implementation

{ TShowAbout }

procedure TShowAbout.Edit;
begin
  inherited;
  Value := TfrmSobre.Exibe;
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TEditorMenu }

procedure TEditorMenu.ExecuteVerb(Index: Integer);
begin
  inherited;
  case Index of
    0:
    begin
      TfrmSobre.Exibe;
      // state = csDesign
//     (Component as TDBDateTime).Sobre := TfrmSobre.Exibe;
    end;
  end;
end;

function TEditorMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o DB DateEdit';
  end;
end;

function TEditorMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
