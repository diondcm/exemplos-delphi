unit Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.Imagens, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
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
  private
    FDataSetPesquisa: TDataSet;
    procedure SetDataSetPesquisa(const Value: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizaQtdRegs;
    property DataSetPesquisa: TDataSet read FDataSetPesquisa write SetDataSetPesquisa;
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

procedure TfrmPesquisa.dtsPesquisaStateChange(Sender: TObject);
begin
  AtualizaQtdRegs;
end;

procedure TfrmPesquisa.EditPesquisaRightButtonClick(Sender: TObject);
begin
  Showmessage('Pesquisa')
end;

procedure TfrmPesquisa.SetDataSetPesquisa(const Value: TDataSet);
begin
  FDataSetPesquisa := Value;
  dtsPesquisa.DataSet := FDataSetPesquisa;
end;

end.
