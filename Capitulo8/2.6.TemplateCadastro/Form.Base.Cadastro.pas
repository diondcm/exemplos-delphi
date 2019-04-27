unit Form.Base.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Cliente, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.Imagens;

type
  TfrmCadBase = class(TForm)
    PageControl: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGridPEsquisa: TDBGrid;
    StatusBar: TStatusBar;
    dtsDados: TDataSource;
    PanelNavigator: TPanel;
    Button1: TButton;
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
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    TimerOpen: TTimer;
    procedure FormShow(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
    procedure TimerOpenTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// base não será instanciado
//var
//  frmCadBase: TfrmCadBase;

implementation

{$R *.dfm}

procedure TfrmCadBase.dtsDadosStateChange(Sender: TObject);
begin
  if dtsDados.DataSet.IsEmpty then
  begin
    StatusBar.Panels[0].Text := 'Sem registros';
  end else begin
    StatusBar.Panels[0].Text := 'Registros selecionados: ' + FormatFloat('0.,', dtsDados.DataSet.RecordCount);
  end;

  case dtsDados.DataSet.State of
    dsInactive: PageControl.ActivePage := TabPesquisa;
    dsBrowse: PageControl.ActivePage := TabPesquisa;
    dsEdit: PageControl.ActivePage := TabCadastro;
    dsInsert: PageControl.ActivePage := TabCadastro;
    dsSetKey: PageControl.ActivePage := TabCadastro;
//    dsCalcFields: ;
//    dsFilter: ;
//    dsNewValue: ;
//    dsOldValue: ;
//    dsCurValue: ;
//    dsBlockRead: ;
//    dsInternalCalc: ;
//    dsOpening: ;
  end;
end;

procedure TfrmCadBase.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := TabPesquisa;
  TimerOpen.Enabled := True;
end;

procedure TfrmCadBase.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  dtsDados.DataSet.Open;
//  (dtsDados.DataSet as TFDQuery).FetchAll;
  if (dtsDados.DataSet is TFDQuery) then
  begin
    TFDQuery(dtsDados.DataSet).FetchAll;
  end;
end;

end.
