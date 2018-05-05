unit Form.Cadastro.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Classe.Pessoa,
  Vcl.Menus, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DB, Datasnap.DBClient, Vcl.WinXCtrls, FireDAC.Stan.StorageJSON;

type
  TfrmCadastroPessoa = class(TForm)
    memoLog: TMemo;
    PopupMenu: TPopupMenu;
    ExibePessoa1: TMenuItem;
    panelControles: TPanel;
    editNome: TEdit;
    labelNome: TLabel;
    labelID: TLabel;
    editCPF: TMaskEdit;
    labelCPF: TLabel;
    buttonSalvaPessoa: TButton;
    cdsPessoa: TClientDataSet;
    memPessoa: TFDMemTable;
    radioCDS: TRadioButton;
    radioMem: TRadioButton;
    ToggleSwitchSalvar: TToggleSwitch;
    procedure FormCreate(Sender: TObject);
    procedure Teste(Sender: TObject);
    procedure buttonSalvaPessoaClick(Sender: TObject);
    procedure ExibePessoa1Click(Sender: TObject);
    procedure radioCDSClick(Sender: TObject);
    procedure radioMemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    const
      ARQ_CDS_XML = 'cds_xml.xml';
      ARQ_MEM_JSON = 'mem_json.json';
  private
    FPessoa: TPessoa;
    FDts: TDataSet;
    procedure LoadPessoa(pPessoa: TPessoa);
    procedure UnLoadPessoa(pPessoa: TPessoa);
  public
    procedure SetPessoa(pPessoa: TPessoa); deprecated 'Utilizar metodo Y na unit X';
  end;

var
  frmCadastroPessoa: TfrmCadastroPessoa;

implementation

{$R *.dfm}

{ TfrmCadastroPessoa }

procedure TfrmCadastroPessoa.buttonSalvaPessoaClick(Sender: TObject);
begin
  UnLoadPessoa(FPessoa);
  FPessoa.PessoaToDataSet(FDts);
//  if radioCDS.Checked then
//    FPessoa.PessoaToDataSet(cdsPessoa)
//  else
//    FPessoa.PessoaToDataSet(memPessoa);
//  ShowMessage('Pessoa salva com sucesso.');
  Caption := TimeToStr(Now);
end;

procedure TfrmCadastroPessoa.ExibePessoa1Click(Sender: TObject);
begin
  memoLog.Lines.Add('');
  memoLog.Lines.Add(FPessoa.ToString);
end;

procedure TfrmCadastroPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;

  if Assigned(FDts) then
  begin
    case ToggleSwitchSalvar.State of
      tssOn:
      begin
        if FDts is TClientDataSet then
        begin
          TClientDataSet(FDts).SaveToFile(ARQ_CDS_XML, dfXML);
        end else if FDts is TFDMemTable then
        begin
          TFDMemTable(FDts).SaveToFile(ARQ_MEM_JSON, sfJSON);
        end;
      end;
    end;
  end;
end;

procedure TfrmCadastroPessoa.FormCreate(Sender: TObject);
begin
   {$Warnings OFF}
   {$Warnings ON}

//   {$WARNING  'Teste'}

{$WARN SYMBOL_PLATFORM OFF}
  memoLog.Visible := (DebugHook > 0);
 {$WARN SYMBOL_PLATFORM ON}

  cdsPessoa.FieldDefs.Clear;
  cdsPessoa.FieldDefs.Add('ID', ftInteger);
  cdsPessoa.FieldDefs.Add('NOME', ftString, 50);
  cdsPessoa.FieldDefs.Add('CPF', ftString, 15);
  cdsPessoa.CreateDataSet;

  memPessoa.FieldDefs.Clear;
  memPessoa.FieldDefs.Add('ID', ftInteger);
  memPessoa.FieldDefs.Add('NOME', ftString, 50);
  memPessoa.FieldDefs.Add('CPF', ftString, 15);
  memPessoa.Open;

  SetPessoa(nil);
end;

procedure TfrmCadastroPessoa.LoadPessoa(pPessoa: TPessoa);
begin
  editNome.Text := pPessoa.Nome;
  labelID.Caption := Format('ID: %d', [pPessoa.ID]);
  editCPF.Text := pPessoa.CPF;
end;

procedure TfrmCadastroPessoa.radioCDSClick(Sender: TObject);
begin
  FDts := cdsPessoa;
end;

procedure TfrmCadastroPessoa.radioMemClick(Sender: TObject);
begin
  FDts := memPessoa;
end;

procedure TfrmCadastroPessoa.SetPessoa(pPessoa: TPessoa);
begin
  if Assigned(pPessoa) then
  begin
    FPessoa := pPessoa;
  end else begin
    FPessoa := TPessoa.Create;
  end;
  LoadPessoa(FPessoa);
end;

procedure TfrmCadastroPessoa.UnLoadPessoa(pPessoa: TPessoa);
begin
  pPessoa.Nome := editNome.Text;
  pPessoa.CPFFormatado := editCPF.Text;
end;

procedure TfrmCadastroPessoa.Teste(Sender: TObject);
begin
  //
end;

end.
