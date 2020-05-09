unit Classe.Strings.Helper;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils;

type
  TStringListHelper = class helper for TStringList
    constructor Create(pArq: string); overload;
  end;

  TStringLoadHelper = record helper for string
    function GetFileContents: string;
    procedure Avisa;
  end;


implementation

{ TStringListHelper }

uses Classe.Mensagem;

constructor TStringListHelper.Create(pArq: string);
begin
  inherited Create;

  if TFile.Exists(pArq) then
  begin
    Self.LoadFromFile(pArq);
  end;
end;

{ TStringLoadHelper }

procedure TStringLoadHelper.Avisa;
begin
  TMensagem.Aviso(Self);
end;

function TStringLoadHelper.GetFileContents: string;
begin
  if TFile.Exists(Self) then
  begin
    var lStl: TStringList := TStringList.Create(Self);
    Result := lStl.Text;
    lStl.Free;
  end;
end;

end.
