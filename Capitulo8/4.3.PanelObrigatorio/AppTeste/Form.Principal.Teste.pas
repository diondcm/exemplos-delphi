unit Form.Principal.Teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Classe.Panel.Obrigatorio, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPanelTest = class(TForm)
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    FDMemTable1id: TIntegerField;
    FDMemTable1Nome: TStringField;
    FDMemTable1DataCadastro: TDateTimeField;
    PanelObrigatorio1: TPanelObrigatorio;
    Timer1: TTimer;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPanelTest: TfrmPanelTest;

implementation

{$R *.dfm}

procedure TfrmPanelTest.FormCreate(Sender: TObject);
begin
//  Tpane
end;

procedure TfrmPanelTest.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  FDMemTable1.Open;
end;

end.
