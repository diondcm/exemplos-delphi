unit Base.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Base.Data.Imagens, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Base.Data.Cadastro;

type
  TfrmBase = class(TForm)
    MainMenu: TMainMenu;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    ActionList: TActionList;
    procedure Sobre1Click(Sender: TObject);
  private
    FDmdCadastro: TdmdBaseCadastro;
    function GetDmdCadastro: TdmdBaseCadastro;
    procedure SetDmdCadastro(const Value: TdmdBaseCadastro);
  protected
    procedure SetDataSets; virtual;
    class function GetClasseDmdBaseCadastro: TDmdBaseCadastroClass; virtual; abstract;
  public
    constructor Create(Aowner: TComponent; ADmdCadastro: TdmdBaseCadastro; pInstanciaDMD: Boolean = False); reintroduce; overload;
    property DmdCadastro: TdmdBaseCadastro read GetDmdCadastro write SetDmdCadastro;
  end;

//var
//  frmBase: TfrmBase;

implementation

{$R *.dfm}

constructor TfrmBase.Create(Aowner: TComponent; ADmdCadastro: TdmdBaseCadastro; pInstanciaDMD: Boolean);
begin
  inherited Create(Aowner);

  FDmdCadastro := ADmdCadastro;
  if pInstanciaDMD and (not Assigned(FDmdCadastro)) then
  begin
    //FDmdCadastro := /// ???
  end;
end;

function TfrmBase.GetDmdCadastro: TdmdBaseCadastro;
begin
  Result := FDmdCadastro;
  if not Assigned(Result) then
  begin
    raise Exception.Create('DataModule base não instanciado em ' + Self.QualifiedClassName);
  end;
end;

procedure TfrmBase.SetDataSets;
begin

end;

procedure TfrmBase.SetDmdCadastro(const Value: TdmdBaseCadastro);
begin
  if FDmdCadastro <> Value then
  begin
    FDmdCadastro := Value;
    if Assigned(FDmdCadastro) then
    begin
      SetDataSets;
    end;
  end;
end;

procedure TfrmBase.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Em construção');
end;

end.
