unit Base.Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Conexao, Vcl.Buttons, Data.DB, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Base.Form.Dados, System.Actions, Vcl.ActnList, Vcl.DBActns, System.Generics.Collections,
  Base.Data.Cadastro, Base.Form.Cadastro;

type
  TMetodoSelecaoRegistro<T: TdmdBaseCadastro> = reference to procedure(pDmdDados: T);

  TfrmBasePesquisa = class(TfrmBaseDados)
    pnlPesquisa: TPanel;
    btePesquisa: TButtonedEdit;
    pnlControles: TPanel;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    btnSelecionar: TBitBtn;
    btnCancelar: TBitBtn;
    dbgPesquisa: TDBGrid;
    PopupMenu: TPopupMenu;
    actCancelar: TAction;
    actPesquisar: TAction;
    actSelecionar: TAction;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Selecionar1: TMenuItem;
    N2: TMenuItem;
    Inserir1: TMenuItem;
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure btePesquisaRightButtonClick(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure btePesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DatasetInsert1Execute(Sender: TObject);
    procedure DatasetEdit1Execute(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FModoSelecao: Boolean;
    FFrmBaseCadastro: TfrmBaseCadastro;
    procedure AtivarModoSelecao;
  protected
    function GetFrmBaseCadastro: TfrmBaseCadastro;
    class function GetClasseFrmCadastro: TFrmBaseCadastroClass; virtual; abstract;
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
  DmdCadastro.Pesquisar(btePesquisa.Text);
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

procedure TfrmBasePesquisa.btePesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    actPesquisar.Execute;
  end;
end;

procedure TfrmBasePesquisa.btePesquisaRightButtonClick(Sender: TObject);
begin
  inherited;
  actPesquisar.Execute;
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

procedure TfrmBasePesquisa.dbgPesquisaDblClick(Sender: TObject);
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

class function TfrmBasePesquisa.Pesquisar<T>(const pMetodoSelecao: TMetodoSelecaoRegistro<T>): Boolean;
var
  lInstancia: TfrmBasePesquisa;
begin
  lInstancia := Self.Create(nil);
  try
    if not lInstancia.DmdCadastro.InheritsFrom(T) then
    begin
      raise Exception.Create('Tipos de data modules incompatíves.');
    end;

    lInstancia.AtivarModoSelecao;
    Result := lInstancia.ShowModal = mrOk;
    if Result then
    begin
      pMetodoSelecao(T(lInstancia.DmdCadastro));
    end;
  finally
    lInstancia.Free;
  end;
end;

end.
