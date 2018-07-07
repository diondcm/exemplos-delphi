unit Form.Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Data.CDS;

type
  TfrmHistorico = class(TForm)
    panelHistorico: TPanel;
    panelExcluidos: TPanel;
    Splitter1: TSplitter;
    Label1: TLabel;
    navigatorHistorico: TDBNavigator;
    gridHistorico: TDBGrid;
    dstHistorico: TDataSource;
    Label2: TLabel;
    navigatorExcluidos: TDBNavigator;
    gridDeletados: TDBGrid;
    dtsExcluidos: TDataSource;
    Splitter2: TSplitter;
    gridAlteracoes: TDBGrid;
    dtsAlterados: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistorico: TfrmHistorico;

implementation

{$R *.dfm}

procedure TfrmHistorico.FormCreate(Sender: TObject);
begin
  TdmdCDS.RefFormHistorico := Self;
end;

end.
