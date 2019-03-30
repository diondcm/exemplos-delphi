unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.Themes, Vcl.Styles, System.IniFiles, Form.DadosDB, Vcl.DBActns, System.Actions, Vcl.ActnList, Form.Objeto, Form.Visualiza.QrCode;

const
  ARQUIVO_INI = './Conf.ini';

type
  TfrmPrincipal = class(TForm)
    dtsClientes: TDataSource;
    cdsClientes: TClientDataSet;
    cdsClientesID: TIntegerField;
    cdsClientesNome: TStringField;
    cdsClientesDataNascimento: TDateField;
    cdsClientesCPF: TStringField;
    cdsClientesDataCadastro: TDateTimeField;
    cdsClientesCredito: TCurrencyField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    PanelNavigator: TPanel;
    ComboBoxTema: TComboBox;
    Label7: TLabel;
    StatusBar: TStatusBar;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ActionList1: TActionList;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Shape1: TShape;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    ButtonQRCode: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxTemaChange(Sender: TObject);
    procedure dtsClientesStateChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure ButtonQRCodeClick(Sender: TObject);
  private
    { Private declarations }
    function GetArquivoClientes: string;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button14Click(Sender: TObject);
begin
  frmObjeto.Cliente.ID := cdsClientesID.AsInteger;
//  frmObjeto.Cliente.ID := cdsClientes.FieldByName('ID').AsInteger;
  //XXX: frmObjeto.Cliente.ID := cdsClientes.Fields[0].AsInteger; // NUNCA USAR

  frmObjeto.Cliente.Nome := cdsClientesNome.AsString;
  frmObjeto.Cliente.DataNascimento := cdsClientesDataNascimento.AsDateTime;
  frmObjeto.Cliente.CPF := cdsClientesCPF.AsString;
  frmObjeto.Cliente.DataCadastro := cdsClientesDataCadastro.AsDateTime;
  frmObjeto.Cliente.Credito := cdsClientesCredito.AsCurrency;

  frmObjeto.Show;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
var
  lInt: Integer;
  lStr: string;
  lFloat: Extended;
  lDate: TDateTime;
  lVar: Variant;
begin
  lInt := 8;
  lStr := 'A';
  lFloat := 6.5;
  lDate := Now;

//  lDate := lFloat + lInt + lStr;

  lVar := Null;
  lVar := lFloat;
  lVar := lVar + lInt;
  lVar := lStr;

  Caption := lVar;
end;

procedure TfrmPrincipal.Button4Click(Sender: TObject);
begin
  frmDadosDB.cdsClienteImportacao.Data := cdsClientes.Data;
  frmDadosDB.Show;
end;

procedure TfrmPrincipal.ButtonQRCodeClick(Sender: TObject);
begin
  frmVIsualizaQrCode.Show;
end;

procedure TfrmPrincipal.ComboBoxTemaChange(Sender: TObject);
var
  lIni: TIniFile;
begin
  TStyleManager.TrySetStyle(ComboBoxTema.Text);  //'Cyan Night');

  lIni := TIniFile.Create(ARQUIVO_INI);
  lIni.WriteString('Visual', 'Style', ComboBoxTema.Text);
  lIni.Free;
end;

procedure TfrmPrincipal.dtsClientesStateChange(Sender: TObject);
begin
  StatusBar.SimpleText := 'Total de ' + cdsClientes.RecordCount.ToString + ' registros';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsClientes.SaveToFile(GetArquivoClientes, dfXML);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lArquivoXML: string;
//  i: Integer;
  lTema: string;
  lIni: TIniFile;
  lStl: TStringList;
begin
//  ShowMessage(ComboBoxTema.Items.ClassName);
//  for i := 0 to Length(TStyleManager.StyleNames) -1 do
//  begin
//    ComboBoxTema.Items.Add(TStyleManager.StyleNames[i]);
//  end;
  PageControl.ActivePage := TabPesquisa;

  { Ordena os temas }
  lStl := TStringList.Create;
  for lTema in TStyleManager.StyleNames do
  begin
    lStl.Add(lTema);
  end;

  lStl.Sort;
  ComboBoxTema.Items.Text := lStl.Text;
  lStl.Free;

  { Carrega o tema }
  lIni := TIniFile.Create(ARQUIVO_INI);
  lTema := lIni.ReadString('Visual', 'Style', 'Cyan Night');
  lIni.Free;

  { Configura tema salvo }
  ComboBoxTema.ItemIndex := ComboBoxTema.Items.IndexOf(lTema);
  TStyleManager.TrySetStyle(lTema);

  { Carrega os dados }
  if FileExists(GetArquivoClientes) then
  begin
    cdsClientes.LoadFromFile(GetArquivoClientes);
  end else begin
    cdsClientes.CreateDataSet;
  end;
end;

function TfrmPrincipal.GetArquivoClientes: string;
begin
  // Application.ExeName = ParamStr(0)
  Result := ExtractFilePath(ParamStr(0)) + 'Clientes.xml';
end;

end.
