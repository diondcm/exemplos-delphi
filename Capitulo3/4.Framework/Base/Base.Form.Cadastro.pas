unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Data.DB, Base.Data.Cadastro;

type
  TfrmBaseCadastro = class(TfrmBase)
    dtsDados: TDataSource;
  private
    FDmdCadastro: TdmdBaseCadastro;
    procedure SetDataSets;
    function GetDmdCadastro: TdmdBaseCadastro;
    procedure SetDmdCadastro(const Value: TdmdBaseCadastro);

//    procedure SetTeste(const Value: TdmdBaseCadastro); overload;
//    procedure SetTeste(const Value: TdmdBaseTipoDiferente); overload;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; ADmdCadastro: TdmdBaseCadastro); reintroduce; overload;
    property DmdCadastro: TdmdBaseCadastro read GetDmdCadastro write SetDmdCadastro;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

{ TfrmBaseCadastro }

constructor TfrmBaseCadastro.Create(AOwner: TComponent);
begin
  inherited;
  /// todo: getclass
  SetDmdCadastro(TdmdBaseCadastro.Create(Self));
end;

constructor TfrmBaseCadastro.Create(AOwner: TComponent;
  ADmdCadastro: TdmdBaseCadastro);
begin
  inherited Create(AOwner);
  SetDmdCadastro(ADmdCadastro);
end;

function TfrmBaseCadastro.GetDmdCadastro: TdmdBaseCadastro;
begin
  Result := FDmdCadastro;
  if not Assigned(Result) then
  begin
    raise Exception.Create('Data module base não criado.');
  end;
end;

procedure TfrmBaseCadastro.SetDataSets;
begin
  dtsDados.DataSet := FDmdCadastro.cdsCadastro;
end;

procedure TfrmBaseCadastro.SetDmdCadastro(const Value: TdmdBaseCadastro);
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

end.
