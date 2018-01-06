unit Classe.Editor.Propriedade;

interface

uses
  DesignEditors, DesignIntf, Form.Sobre;  // -LUDesignIDE

type
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

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
  TfrmSobre.Exibir;
  Value := '4.7';
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
    0: TfrmSobre.Exibir;
  end;
end;

function TEditorMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := '&Sobre o Panel com Obrigatórios';
  end;
end;

function TEditorMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
