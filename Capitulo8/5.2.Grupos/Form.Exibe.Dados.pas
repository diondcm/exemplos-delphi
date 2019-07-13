unit Form.Exibe.Dados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmExibeDados = class(TForm)
    DBGrid1: TDBGrid;
    dtsDados: TDataSource;
    DBNavigator1: TDBNavigator;
    PanelDetalhes: TPanel;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    dtsDetalhes: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeDados(pDts: TDataSet); overload;
    class procedure ExibeDados(pDts, pDtsDetalhes: TDataSet); overload;
  end;

var
  frmExibeDados: TfrmExibeDados;

implementation

{$R *.dfm}

{ TfrmExibeDados }

class procedure TfrmExibeDados.ExibeDados(pDts: TDataSet);
begin
  ExibeDados(pDts, nil);
end;

class procedure TfrmExibeDados.ExibeDados(pDts, pDtsDetalhes: TDataSet);
begin
  if not Assigned(frmExibeDados) then
  begin
    frmExibeDados := TfrmExibeDados.Create(Application);
  end;

  if Assigned(pDtsDetalhes) then
  begin
    frmExibeDados.PanelDetalhes.Visible := True;

    if pDtsDetalhes.IsEmpty then
    begin
      pDtsDetalhes.Open;
    end;

  end else begin
    frmExibeDados.PanelDetalhes.Visible := False;
  end;


  if pDts.IsEmpty then
  begin
    pDts.Open;
  end;

  frmExibeDados.dtsDados.DataSet := pDts;
  frmExibeDados.dtsDetalhes.DataSet := pDtsDetalhes;
  frmExibeDados.ShowModal;
end;

end.
