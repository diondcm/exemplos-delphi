unit Base.Form.Dados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.DBActns, Data.DB, Base.Data.Cadastro;

type
  TfrmBaseDados = class(TfrmBase)
    ActionList: TActionList;
    dtsDados: TDataSource;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    procedure DatasetFirst1Execute(Sender: TObject);
    procedure DatasetPrior1Execute(Sender: TObject);
    procedure DatasetNext1Execute(Sender: TObject);
    procedure DatasetLast1Execute(Sender: TObject);
    procedure DatasetInsert1Execute(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure DatasetEdit1Execute(Sender: TObject);
    procedure DatasetPost1Execute(Sender: TObject);
    procedure DatasetCancel1Execute(Sender: TObject);
    procedure DatasetRefresh1Execute(Sender: TObject);
  private
    FDmdCadastro: TdmdBaseCadastro;
    procedure SetDataSets;
    function GetDmdCadastro: TdmdBaseCadastro;
    procedure SetDmdCadastro(const Value: TdmdBaseCadastro);

  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; virtual; abstract;

  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; ADmdCadastro: TdmdBaseCadastro); reintroduce; overload;

    property DmdCadastro: TdmdBaseCadastro read GetDmdCadastro write SetDmdCadastro;
  end;

implementation

{$R *.dfm}

{ TfrmBaseDados }

constructor TfrmBaseDados.Create(AOwner: TComponent);
begin
  inherited;
  SetDmdCadastro(GetClasseDmdBaseCadastro.Create(Self));
end;

constructor TfrmBaseDados.Create(AOwner: TComponent; ADmdCadastro: TdmdBaseCadastro);
begin
  inherited Create(AOwner);
  SetDmdCadastro(ADmdCadastro);
end;

procedure TfrmBaseDados.DatasetCancel1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.CancelarRegistro;
end;

procedure TfrmBaseDados.DatasetDelete1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.ExcluirRegistro;
end;

procedure TfrmBaseDados.DatasetEdit1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.AlterarRegistro;
end;

procedure TfrmBaseDados.DatasetFirst1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.IrParaPrimeiro;
end;

procedure TfrmBaseDados.DatasetInsert1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.InserirRegistro;
end;

procedure TfrmBaseDados.DatasetLast1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.IrParaUltimo;
end;

procedure TfrmBaseDados.DatasetNext1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.IrParaProximo;
end;

procedure TfrmBaseDados.DatasetPost1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.SalvarRegistro;
end;

procedure TfrmBaseDados.DatasetPrior1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.IrParaAnterior;
end;

procedure TfrmBaseDados.DatasetRefresh1Execute(Sender: TObject);
begin
  inherited;
  GetDmdCadastro.AtualizarDataSet;
end;

function TfrmBaseDados.GetDmdCadastro: TdmdBaseCadastro;
begin
  Result := {Tem que ter o F}FDmdCadastro; // Result := DmdCadastro >> StackOverflow

  if not Assigned(Result) then
  begin
    raise Exception.Create('Data module base não criado.');
  end;
end;

procedure TfrmBaseDados.SetDataSets;
begin
  dtsDados.DataSet := FDmdCadastro.cdsCadastro;
end;

procedure TfrmBaseDados.SetDmdCadastro(const Value: TdmdBaseCadastro);
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

