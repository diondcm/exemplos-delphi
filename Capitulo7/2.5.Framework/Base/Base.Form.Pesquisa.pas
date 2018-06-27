unit Base.Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, Base.Data.Imagens, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBActns,
  Base.Form.Cadastro, System.Threading;

type
  TfrmBasePesquisa = class(TfrmBase)
    panelFiltro: TPanel;
    editPesquisa: TButtonedEdit;
    panelControles: TPanel;
    buttonInserir: TButton;
    buttonEditar: TButton;
    Button3: TButton;
    buttonCancelar: TButton;
    gridPesquisa: TDBGrid;
    dtsPesquisa: TDataSource;
    actionSelecionar: TAction;
    actionCancelar: TAction;
    actionPesquisar: TAction;
    DatasetInsert1: TDataSetInsert;
    DatasetEdit1: TDataSetEdit;
    timerOpen: TTimer;
    procedure actionSelecionarExecute(Sender: TObject);
    procedure actionCancelarExecute(Sender: TObject);
    procedure actionPesquisarExecute(Sender: TObject);
    procedure editPesquisaRightButtonClick(Sender: TObject);
    procedure editPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPesquisaDblClick(Sender: TObject);
    procedure DatasetInsert1Execute(Sender: TObject);
    procedure DatasetEdit1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FJaExecutouQuery: Boolean;
    FFrmBaseCadastro: TfrmBaseCadastro;
    FModoSelecao: Boolean;
  protected
    procedure AtivarModoSelecao;

    function GetFrmBaseCadastro: TFrmBaseCadastro;

    class function GetClasseFrmCadastro: TFrmBaseCadastroClass; virtual; abstract;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBasePesquisa.actionCancelarExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;

end;

procedure TfrmBasePesquisa.actionPesquisarExecute(Sender: TObject);
begin
  inherited;
  DmdCadastro.Pesquisar(editPesquisa.Text);
end;

procedure TfrmBasePesquisa.actionSelecionarExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmBasePesquisa.AtivarModoSelecao;
begin
  FModoSelecao := True;

  actionSelecionar.Visible := True;
  actionCancelar.Visible := True;
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
    actionPesquisar.Execute;
  end;
end;

procedure TfrmBasePesquisa.editPesquisaRightButtonClick(Sender: TObject);
begin
  inherited;
  actionPesquisar.Execute;
end;

procedure TfrmBasePesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FModoSelecao then
  begin
    Action := caFree;
  end;
end;

procedure TfrmBasePesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  dtsPesquisa.DataSet := DmdCadastro.DataSet;
  actionSelecionar.Visible := False;
  actionCancelar.Visible := False;
end;

procedure TfrmBasePesquisa.FormShow(Sender: TObject);
begin
  inherited;
  if not FJaExecutouQuery then
  begin
    FJaExecutouQuery := True;

    timerOpen.Enabled := True;

//    TTask.Create(
//      procedure
//      begin
//        actionPesquisar.Execute;
//      end).Start;
//    Leak de memória
//    Sleep
  end;
end;

function TfrmBasePesquisa.GetFrmBaseCadastro: TFrmBaseCadastro;
begin
  if not Assigned(FFrmBaseCadastro) then
  begin
    FFrmBaseCadastro := GetClasseFrmCadastro.Create(Self, DmdCadastro);
  end;

  Result := FFrmBaseCadastro;
end;

procedure TfrmBasePesquisa.gridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  if not DmdCadastro.DataSet.IsEmpty then
  begin
    if FModoSelecao then
    begin
      actionSelecionar.Execute
    end else begin
      GetFrmBaseCadastro.Show;
    end;
  end;
end;

procedure TfrmBasePesquisa.timerOpenTimer(Sender: TObject);
begin
  timerOpen.Enabled := False;
  actionPesquisar.Execute;

end;

end.
