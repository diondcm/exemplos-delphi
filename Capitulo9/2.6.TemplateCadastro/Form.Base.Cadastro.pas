unit Form.Base.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBActns, System.Actions, Vcl.ActnList, Data.Base;

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
    PageControl1: TPageControl;
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
    TimerOpne: TTimer;
    procedure TimerOpneTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtsDadosDataChange(Sender: TObject; Field: TField);
  private
    FDmdDados: TdmdBase;
  public
    property DmdDados: TdmdBase read FDmdDados write FDmdDados;
  end;

//var
//  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.dtsDadosDataChange(Sender: TObject; Field: TField);
begin
  StatusBarCadastro.Panels[0].Text :=   IntToStr(DmdDados.qryDados.RecordCount) + ' Registros selecionados';
end;

procedure TfrmBaseCadastro.FormCreate(Sender: TObject);
begin
// FDmdDados := Implementado nos filhos

  TimerOpne.Enabled := True;;
end;

procedure TfrmBaseCadastro.TimerOpneTimer(Sender: TObject);
begin
  TimerOpne.Enabled := False;

  FDmdDados.qryDados.Open;
end;

end.
