unit Base.Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Conexao, Vcl.Buttons, Data.DB, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Base.Form.Dados, System.Actions, Vcl.ActnList, Vcl.DBActns, System.Generics.Collections,
  Base.Data.Cadastro;

type
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
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure btePesquisaRightButtonClick(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure btePesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FModoSelecao: Boolean;
    procedure AtivarModoSelecao;
  public
    class function Pesquisar<T: TdmdBaseCadastro>: Boolean;
  end;

var
  frmBasePesquisa: TfrmBasePesquisa;

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

  /// todo: Actions
  btnSelecionar.Enabled := True;
  btnCancelar.Enabled := True;
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

class function TfrmBasePesquisa.Pesquisar<T>: Boolean;
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
    Result := lInstancia.ModalResult = mrOk;
  finally
    lInstancia.Free;
  end;

// todo: completar seleção
// if Result then
// begin
//   pMetodoSelecaoRegistro(T(lInstancia.dmdBaseCadastro))
// end;
end;

end.
