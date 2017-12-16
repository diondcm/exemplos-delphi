unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Classe.Panel.Obrigatorio, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    dtsCampos: TDataSource;
    PanelObrigatorio: TPanelObrigatorio;
    memLog: TMemo;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    DBEdit1: TDBEdit;
    memCampos: TFDMemTable;
    memCamposCodigo: TIntegerField;
    memCamposID: TIntegerField;
    memCamposNome: TStringField;
    memCamposDataCadastro: TDateField;
    memCamposValorInicial: TCurrencyField;
    DBGrid1: TDBGrid;
    buttonValidaCampos: TButton;
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
    procedure buttonValidaCamposClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.buttonValidaCamposClick(Sender: TObject);
begin
  memLog.Text := PanelObrigatorio.ValidaCamposObrigatorios;
end;

end.
