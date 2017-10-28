unit Base.Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Dados, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus,
  Data.Conexao, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Base.Data.Cadastro, Vcl.Grids, Vcl.DBGrids, Base.Form.Cadastro,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TMetodoSelecaoRegistro<T: TdmdBaseCadastro> = reference to procedure(pDmdDados: T);

  TfrmBasePesquisa = class(TfrmBaseDados)
    panelPesquisa: TPanel;
    editPesquisa: TButtonedEdit;
    panelControles: TPanel;
    buttonSelecionar: TBitBtn;
    buttonCancelar: TBitBtn;
    actSelecionar: TAction;
    actCancelar: TAction;
    actPesquisar: TAction;
    panelGrid: TPanel;
    gridDados: TDBGrid;
    labelStatus: TLabel;
    buttonInserir: TBitBtn;
    buttonEditar: TBitBtn;
    procedure actSelecionarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure editPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editPesquisaRightButtonClick(Sender: TObject);
    procedure gridDadosTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DatasetInsert1Execute(Sender: TObject);
    procedure DatasetEdit1Execute(Sender: TObject);
    procedure gridDadosDblClick(Sender: TObject);
  private
    FFrmBaseCadastro: TfrmBaseCadastro;
    FModoSelecao: Boolean;
    procedure AtivarModoSelecao;
  protected
    function GetFrmBaseCadastro: TfrmBaseCadastro;

    class function GetClasseFrmCadastro: TfrmBaseCadastroClass; virtual; abstract;

    // frm cadastro
  public
    class function Pesquisar<T: TdmdBaseCadastro>(const pMetodoSelecao: TMetodoSelecaoRegistro<T>): Boolean;
  end;

implementation

{$R *.dfm}

{ TfrmBasePesquisa }

procedure TfrmBasePesquisa.actCancelarExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmBasePesquisa.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  DmdCadastro.Pesquisar(editPesquisa.Text);
end;

procedure TfrmBasePesquisa.actSelecionarExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmBasePesquisa.AtivarModoSelecao;
begin
  FModoSelecao := True;

  actSelecionar.Visible := True;
  actCancelar.Visible := True;
end;

procedure TfrmBasePesquisa.DatasetEdit1Execute(Sender: TObject);
begin
  inherited;
  GetFrmBaseCadastro.Show;
end;

procedure TfrmBasePesquisa.DatasetInsert1Execute(Sender: TObject);
begin
  inherited;
  GetFrmBaseCadastro.Show;
end;

procedure TfrmBasePesquisa.editPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    actPesquisar.Execute;
  end;
end;

procedure TfrmBasePesquisa.editPesquisaRightButtonClick(Sender: TObject);
begin
  inherited;
  actPesquisar.Execute;
end;

procedure TfrmBasePesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not FModoSelecao then
  begin
    Action := caFree;
  end;
end;

function TfrmBasePesquisa.GetFrmBaseCadastro: TfrmBaseCadastro;
begin
  if not Assigned(FFrmBaseCadastro) then
  begin
    FFrmBaseCadastro := GetClasseFrmCadastro.Create(Self, DmdCadastro);
  end;

  Result := FFrmBaseCadastro;
end;

procedure TfrmBasePesquisa.gridDadosDblClick(Sender: TObject);
begin
  inherited;
  if FModoSelecao then
  begin
    if actSelecionar.Enabled then
    begin
      actSelecionar.Execute;
    end;
  end else begin
    GetFrmBaseCadastro.Show;
  end;
end;

procedure TfrmBasePesquisa.gridDadosTitleClick(Column: TColumn);
begin
  inherited;
  // Não por sql >> trazer esse custo

  // FD cds

  if Assigned(Column.Field.DataSet) then
  begin
    if (Column.Field.DataSet is TClientDataSet) then
    begin
      if CompareStr(TClientDataSet(Column.Field.DataSet).IndexFieldNames, Column.Field.FieldName) <> 0 then
      begin
        TClientDataSet(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName;
      end else begin

      end;
    end;

    if (Column.Field.DataSet is TFDDataSet) then
    begin
      if CompareStr(TFDDataSet(Column.Field.DataSet).IndexFieldNames, Column.Field.FieldName) <> 0 then
      begin
        TFDDataSet(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName;
      end;
    end;
  end;

  //DONE::{$MESSAGE WARN 'Implementar title click'}
end;

class function TfrmBasePesquisa.Pesquisar<T>(const pMetodoSelecao: TMetodoSelecaoRegistro<T>): Boolean;
var
  lInst: TfrmBasePesquisa;
begin
  lInst := Self.Create(nil);
  try
    if not lInst.DmdCadastro.InheritsFrom(T) then
    begin
      raise Exception.Create('[' + Self.ClassName + '] Tipo de datamodule incompatíveis: ' +
        lInst.DmdCadastro.ClassName + ' com: ' + TClass(T).ClassName);
    end;

    lInst.AtivarModoSelecao;
    Result := lInst.ShowModal = mrOk;
    if Result then
    begin
      pMetodoSelecao(T(lInst.DmdCadastro));
    end;
  finally
    linst.Free;
  end;
end;

end.
