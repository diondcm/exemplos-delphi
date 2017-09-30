unit Form.Consulta.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, System.IOUtils,
  Form.Cadastro.Pessoa;

type
  TfrmConsultaPessoa = class(TForm)
    gridPessoa: TDBGrid;
    dtsPessoal: TDataSource;
    cdsPessoa: TClientDataSet;
    NavigatorPessoa: TDBNavigator;
    buttonAtualizar: TButton;
    cdsPessoaID: TIntegerField;
    cdsPessoaCodigo: TIntegerField;
    cdsPessoaNome: TStringField;
    cdsPessoaDataNascimento: TDateField;
    cdsPessoaDataCadastro: TDateTimeField;
    panelControles: TPanel;
    buttonCadastro: TButton;
    buttonAlterarPessoa: TButton;
    procedure buttonAtualizarClick(Sender: TObject);
    procedure buttonCadastroClick(Sender: TObject);
    procedure cdsPessoaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buttonAlterarPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPessoa: TfrmConsultaPessoa;

implementation

{$R *.dfm}

procedure TfrmConsultaPessoa.buttonAlterarPessoaClick(Sender: TObject);
begin
  if not cdsPessoa.IsEmpty then
  begin
    cdsPessoa.Edit;
    frmCadastroPessoa.dtsPessoa.DataSet := cdsPessoa;
    if frmCadastroPessoa.ShowModal = mrYes then
    begin
      cdsPessoa.Post;
    end else begin
      cdsPessoa.Cancel;
    end;
  end;
end;

procedure TfrmConsultaPessoa.buttonAtualizarClick(Sender: TObject);
const
  ARQ_PESSOA = 'Pessoas.xml';
begin
  //TDirectory.GetFiles('C:\Windows', '*.bat');

  if cdsPessoa.Active { = True } then
  begin
    cdsPessoa.SaveToFile(ARQ_PESSOA, dfXML);
  end else begin
    if TFile.Exists(ARQ_PESSOA) then
    begin
      cdsPessoa.LoadFromFile(ARQ_PESSOA);
    end else begin
      cdsPessoa.FieldDefs.Clear;
      cdsPessoa.FieldDefs.Add('ID', ftInteger);
      cdsPessoa.FieldDefs.Add('Codigo', ftInteger);
      cdsPessoa.FieldDefs.Add('Nome', ftString, 50);
      cdsPessoa.FieldDefs.Add('DataNascimento', ftDate);
      cdsPessoa.FieldDefs.Add('DataCadastro', ftDate);
      cdsPessoa.CreateDataSet;
    end;
  end;
end;

procedure TfrmConsultaPessoa.buttonCadastroClick(Sender: TObject);
begin
//  if not cdsPessoa.Active then
//  begin
//    buttonAtualizarClick(Sender);
//  end;

  cdsPessoa.Append;
  frmCadastroPessoa.dtsPessoa.DataSet := cdsPessoa;
  if frmCadastroPessoa.ShowModal = mrYes then
  begin
    cdsPessoa.Post;
  end else begin
    cdsPessoa.Cancel;
  end;
end;

procedure TfrmConsultaPessoa.cdsPessoaNewRecord(DataSet: TDataSet);
begin
  cdsPessoa.FieldByName('DataCadastro').AsDateTime := Now;
  cdsPessoa.FieldByName('ID').AsInteger := Random(Random(Random(1000000)));
end;

procedure TfrmConsultaPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  buttonAtualizarClick(Sender);
end;

procedure TfrmConsultaPessoa.FormShow(Sender: TObject);
begin
  buttonAtualizarClick(Sender);
end;

end.
