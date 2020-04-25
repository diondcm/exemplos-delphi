unit Form.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmBase = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    class var
      FListaAcessados: TStringList;
      FOnAtualiza: TProc;
  private
    class constructor Create;
    class destructor Destroy;
  public
    class function GetListaAcessados: string;
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

{ TfrmBase }

class constructor TfrmBase.Create;
begin
  FListaAcessados := TStringList.Create;
end;

class destructor TfrmBase.Destroy;
begin
  FListaAcessados.Free;
end;

procedure TfrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //ShowMessage('Dataset.Close');
end;

procedure TfrmBase.FormShow(Sender: TObject);
begin
  FListaAcessados.Add(Self.Name);

//  if FOnAtualiza <> nil then
  if Assigned(FOnAtualiza) then
  begin
    FOnAtualiza;
  end;
end;

class function TfrmBase.GetListaAcessados: string;
begin
  Result := FListaAcessados.Text;
end;

end.
