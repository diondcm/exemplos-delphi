unit Form.Visualiza.Dados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmVisualizaDados = class(TForm)
    PanelMaster: TPanel;
    PanelDetail: TPanel;
    StatusBarDetail: TStatusBar;
    StatusBarMaster: TStatusBar;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    dtsMaster: TDataSource;
    dtsDetail: TDataSource;
    procedure dtsMasterStateChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure dtsDetailDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizaDados: TfrmVisualizaDados;

implementation

{$R *.dfm}

procedure TfrmVisualizaDados.DBGrid1TitleClick(Column: TColumn);
begin
  // buscar ordenador do grid no repo de exemplos

  if (Assigned(dtsMaster.DataSet)) and (not dtsMaster.DataSet.IsEmpty) then
  begin
    if dtsMaster.DataSet is TFDDataSet then
    begin
      TFDDataSet(dtsMaster.DataSet).IndexFieldNames := Column.Field.FieldName;
    end;
  end;
end;

procedure TfrmVisualizaDados.DBGrid2TitleClick(Column: TColumn);
begin
  if (Assigned(dtsDetail.DataSet)) and (not dtsDetail.DataSet.IsEmpty) then
  begin
    if dtsDetail.DataSet is TFDDataSet then
    begin
      TFDDataSet(dtsDetail.DataSet).IndexFieldNames := Column.Field.FieldName;
    end;
  end;
end;

procedure TfrmVisualizaDados.dtsDetailDataChange(Sender: TObject;
  Field: TField);
begin
  if (not Assigned(dtsDetail.DataSet)) or (dtsDetail.DataSet.IsEmpty) then
  begin
    StatusBarDetail.Panels[0].Text := 'Sem registros';
  end else begin
    StatusBarDetail.Panels[0].Text := IntToStr(dtsDetail.DataSet.RecordCount) + ' registros';
  end;
end;

procedure TfrmVisualizaDados.dtsMasterStateChange(Sender: TObject);
begin
  if (not Assigned(dtsMaster.DataSet)) or (dtsMaster.DataSet.IsEmpty) then
  begin
    StatusBarMaster.Panels[0].Text := 'Sem registros';
  end else begin
    StatusBarMaster.Panels[0].Text := IntToStr(dtsMaster.DataSet.RecordCount) + ' registros';
  end;
end;

end.
