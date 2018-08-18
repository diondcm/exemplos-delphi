unit Form.Principal.Testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Classe.Panel.Obrigatorio, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmPrincipalTestes = class(TForm)
    Panel1: TPanel;
    gridDados: TDBGrid;
    navigatorDados: TDBNavigator;
    dtsDados: TDataSource;
    memDados: TFDMemTable;
    memDadosCodigo: TIntegerField;
    memDadosNome: TStringField;
    PanelObrigatorio1: TPanelObrigatorio;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure memDadosBeforePost(DataSet: TDataSet);
    procedure PanelObrigatorio1Notifica(Sender: TObject; Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Teste;
  end;

var
  frmPrincipalTestes: TfrmPrincipalTestes;

implementation

{$R *.dfm}

procedure TfrmPrincipalTestes.FormShow(Sender: TObject);
begin
  memDados.Open;
  Teste;
end;

procedure TfrmPrincipalTestes.memDadosBeforePost(DataSet: TDataSet);
begin
  ShowMessage('On Before Post');
end;

procedure TfrmPrincipalTestes.PanelObrigatorio1Notifica(Sender: TObject; Index: Integer);
begin
  ShowMessage('Notifica');
end;

procedure TfrmPrincipalTestes.Teste;
begin
  //
end;

end.
