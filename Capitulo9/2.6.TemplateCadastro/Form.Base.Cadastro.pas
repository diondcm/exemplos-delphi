unit Form.Base.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBActns, System.Actions, Vcl.ActnList, Data.Base,
  Data.Imagens, Classe.Mensagem, Vcl.Menus, Classe.Grid.Helper;

type
  TfrmBaseCadastro = class(TForm)
    PanelBotoes: TPanel;
    ButtonUltimo: TBitBtn;
    ButtonProximo: TBitBtn;
    ButtonAnterior: TBitBtn;
    ButtonPrimeiro: TBitBtn;
    ButtonDeletar: TBitBtn;
    ButtonSalvar: TBitBtn;
    ButtonCancelar: TBitBtn;
    ButtonEditar: TBitBtn;
    ButtonInsert: TBitBtn;
    PageControlCadastro: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGridDados: TDBGrid;
    StatusBarCadastro: TStatusBar;
    dtsDados: TDataSource;
    ActionList: TActionList;
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
    TimerOpen: TTimer;
    PopupMenuNavegacao: TPopupMenu;
    Deletar1: TMenuItem;
    Primeiro1: TMenuItem;
    ltimo1: TMenuItem;
    Inserir1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Inserir1Click(Sender: TObject);
    procedure DBGridDadosTitleClick(Column: TColumn);
  private
    FDmdDados: TdmdBase;
    procedure AtualizaQtdRegs;
    procedure SetDmdDados(const Value: TdmdBase);
  public
    property DmdDados: TdmdBase read FDmdDados write SetDmdDados;
  end;

//var
//  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.DatasetDelete1Execute(Sender: TObject);
begin
  if TMensagem.Confirmacao('Confirma exclusão do registro?') then
  begin
    dtsDados.DataSet.Delete;
  end;
end;

procedure TfrmBaseCadastro.DBGridDadosTitleClick(Column: TColumn);
begin
  DBGridDados.IdexaPorField(Column);
end;

procedure TfrmBaseCadastro.dtsDadosStateChange(Sender: TObject);
begin
  AtualizaQtdRegs;

  case dtsDados.DataSet.State of
    dsBrowse: PageControlCadastro.ActivePage := TabPesquisa;
    dsEdit: PageControlCadastro.ActivePage := TabCadastro;
    dsInsert: PageControlCadastro.ActivePage := TabCadastro;
  end;
end;

procedure TfrmBaseCadastro.AtualizaQtdRegs;
begin
  if DmdDados.qryDados.IsEmpty then // vazio e closed
  begin
    StatusBarCadastro.Panels[0].Text := 'Sem registros para exibir';
  end else begin
    StatusBarCadastro.Panels[0].Text := FormatFloat('0.,', DmdDados.qryDados.RecordCount) + ' Registros selecionados';
  end;
end;

procedure TfrmBaseCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaseCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if dtsDados.DataSet.State in dsEditModes then
  begin
    CanClose := TMensagem.Confirmacao('Cadastro em edição. Sair cancelará as alterações.' + sLineBreak + 'Sair mesmo assim?');
    if CanClose then
      dtsDados.DataSet.Cancel;
  end;
end;

procedure TfrmBaseCadastro.FormCreate(Sender: TObject);
begin
// FDmdDados := Implementado nos filhos

  PageControlCadastro.ActivePage := TabPesquisa;
  TimerOpen.Enabled := True;;
end;

procedure TfrmBaseCadastro.Inserir1Click(Sender: TObject);
begin
  ButtonInsert.Click;
end;

procedure TfrmBaseCadastro.SetDmdDados(const Value: TdmdBase);
begin
  FDmdDados := Value;
  dtsDados.DataSet := FDmdDados.qryDados;
end;

procedure TfrmBaseCadastro.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  FDmdDados.qryDados.Open;
  FDmdDados.qryDados.FetchAll;
  AtualizaQtdRegs;

  //Sleep(10000);
end;

end.
