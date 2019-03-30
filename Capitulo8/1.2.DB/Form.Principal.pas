unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.Themes, Vcl.Styles, System.IniFiles;

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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxTemaChange(Sender: TObject);
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

procedure TfrmPrincipal.ComboBoxTemaChange(Sender: TObject);
var
  lIni: TIniFile;
begin
  TStyleManager.TrySetStyle(ComboBoxTema.Text);  //'Cyan Night');

  lIni := TIniFile.Create(ARQUIVO_INI);
  lIni.WriteString('Visual', 'Style', ComboBoxTema.Text);
  lIni.Free;
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
