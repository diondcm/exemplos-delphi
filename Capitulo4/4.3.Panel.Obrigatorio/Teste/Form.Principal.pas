unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Classe.Panel.Obrigatorio, Vcl.Mask,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    checkStado: TCheckBox;
    memoCampos: TMemo;
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
    PanelObrigatorio1: TPanelObrigatorio;
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
    memoLog: TMemo;
    buttonValidaCampos: TButton;
    dtsCampos: TDataSource;
    Button2: TButton;
    procedure buttonValidaCamposClick(Sender: TObject);
    procedure dtsCamposDataChange(Sender: TObject; Field: TField);
    procedure dtsCamposStateChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure memCamposBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  PanelObrigatorio1.DataSource := dtsCampos;
end;

procedure TForm1.buttonValidaCamposClick(Sender: TObject);
begin
  memoCampos.Text := PanelObrigatorio1.ValidaCamposObrigatorios;
end;

procedure TForm1.dtsCamposDataChange(Sender: TObject; Field: TField);
begin
//  if not(memCampos.State in [dsInactive]) then
//    memoLog.Lines.Add(TimeToStr(Now) + ' - Field: ' + Field.DisplayLabel);
end;

procedure TForm1.dtsCamposStateChange(Sender: TObject);
begin
  //memoLog.Lines.Add(TimeToStr(Now) + ' - Dts: ' + IntToStr(Ord(memCampos.State)));
end;

procedure TForm1.memCamposBeforePost(DataSet: TDataSet);
begin
  ShowMessage('Before Post');
end;

end.
