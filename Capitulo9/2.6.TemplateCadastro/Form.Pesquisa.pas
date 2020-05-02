unit Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.Imagens, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Classe.Mensagem;

type
  TfrmPesquisa = class;

  TFunctSelecionar = reference to function (pFrm: TFrmPesquisa): Boolean;

  TfrmPesquisa = class(TForm)
    PanelFiltros: TPanel;
    PanelDados: TPanel;
    PanelControles: TPanel;
    ButtonCancelar: TBitBtn;
    buttonSelecionar: TBitBtn;
    EditPesquisa: TButtonedEdit;
    DBGrid1: TDBGrid;
    StatusBarQtd: TStatusBar;
    dtsPesquisa: TDataSource;
    procedure EditPesquisaRightButtonClick(Sender: TObject);
    procedure dtsPesquisaStateChange(Sender: TObject);
    procedure buttonSelecionarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataSetPesquisa: TDataSet;
    FOnSelecionar: TFunctSelecionar;
    procedure SetDataSetPesquisa(const Value: TDataSet);
  public

    class procedure Executa(pDataSetPesquisa: TDataSet; pOnSelecionar: TFunctSelecionar);

    procedure AtualizaQtdRegs;
    property DataSetPesquisa: TDataSet read FDataSetPesquisa write SetDataSetPesquisa;
    property OnSelecionar: TFunctSelecionar read FOnSelecionar write FOnSelecionar;
  end;

//var
//  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.AtualizaQtdRegs;
begin
  if dtsPesquisa.DataSet.IsEmpty then // vazio e closed
  begin
    StatusBarQtd.Panels[0].Text := 'Sem registros para exibir';
  end else begin
    StatusBarQtd.Panels[0].Text := IntToStr(dtsPesquisa.DataSet.RecordCount) + ' Registros selecionados';
  end;
end;

procedure TfrmPesquisa.buttonSelecionarClick(Sender: TObject);
begin
  if Assigned(FOnSelecionar) then
  begin
    if FOnSelecionar(Self) then
      ModalResult := mrYes;
  end else
    ModalResult := mrYes;
end;

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  buttonSelecionarClick(Sender);
end;

procedure TfrmPesquisa.dtsPesquisaStateChange(Sender: TObject);
begin
  AtualizaQtdRegs;
end;

procedure TfrmPesquisa.EditPesquisaRightButtonClick(Sender: TObject);
begin
  Showmessage('Pesquisa')
end;

class procedure TfrmPesquisa.Executa(pDataSetPesquisa: TDataSet; pOnSelecionar: TFunctSelecionar);
begin
  var lFrm: TfrmPesquisa := {TfrmPesquisa}Self.Create(nil);
  lfrm.DataSetPesquisa := pDataSetPesquisa;
  if not Assigned(lFrm.DataSetPesquisa) then
    TMensagem.Erro('Dataset de pesquisa não informado.', True);
  lFrm.OnSelecionar := pOnSelecionar;
  lFrm.ShowModal;
end;

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  DataSetPesquisa.Close;
  DataSetPesquisa.Open;
end;

procedure TfrmPesquisa.SetDataSetPesquisa(const Value: TDataSet);
begin
  FDataSetPesquisa := Value;
  dtsPesquisa.DataSet := FDataSetPesquisa;
end;

end.
