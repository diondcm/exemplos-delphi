unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Controls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Forms, Vcl.Dialogs, Classe.Panel.Obrigatorio, Vcl.ComCtrls,
  Classe.DB.DateEdit;

type
  TForm1 = class(TForm)
    memoCampos: TMemo;
    memCampos: TFDMemTable;
    memCamposCodigo: TIntegerField;
    memCamposID: TIntegerField;
    memCamposNome: TStringField;
    memCamposDataCadastro: TDateField;
    memCamposValorInicial: TCurrencyField;
    DBGrid1: TDBGrid;
    memoLog: TMemo;
    dtsCampos: TDataSource;
    panelBaseObrigatorio: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    buttonValidaCampos: TButton;
    DBDateTimePicker1: TDBDateTimePicker;
    procedure buttonValidaCamposClick(Sender: TObject);
    procedure memCamposBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBDateTimePicker1Change(Sender: TObject);
  private
    FPanelObrigatorio: TPanelObrigatorio;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.buttonValidaCamposClick(Sender: TObject);
begin
  memoCampos.Text := FPanelObrigatorio.ValidaCamposObrigatorios;
end;

procedure TForm1.DBDateTimePicker1Change(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  ReportMemoryLeaksOnShutdown := True;
  FPanelObrigatorio := TPanelObrigatorio.Create(Self);
  FPanelObrigatorio.Parent := Self;

  FPanelObrigatorio.Align := panelBaseObrigatorio.Align;

  for i:= panelBaseObrigatorio.ControlCount -1 downto 0 do
  begin
    panelBaseObrigatorio.Controls[i].Parent := FPanelObrigatorio;
  end;

  FPanelObrigatorio.DataSource := dtsCampos;

  panelBaseObrigatorio.Visible := False;
  memoCampos.Align := alNone;
  memoCampos.Align := alLeft;
end;

procedure TForm1.memCamposBeforePost(DataSet: TDataSet);
begin
  ShowMessage('Before Post');
end;

end.
