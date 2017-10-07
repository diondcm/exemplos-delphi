unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Pessoa, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Form.Cadastro.Pessoa, Form.Cadastro.Classe.Pessoa, frxClass,
  frxDBSet;

type
  TfrmPrincipal = class(TForm)
    gridPessoa: TDBGrid;
    dtsPessoa: TDataSource;
    NavPessoa: TDBNavigator;
    buttonConnect: TButton;
    buttonCadastrar: TButton;
    memoLog: TMemo;
    buttonExibePessoa: TButton;
    buttonEditaObjeto: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    buttonReport: TButton;
    procedure FormCreate(Sender: TObject);
    procedure buttonConnectClick(Sender: TObject);
    procedure buttonCadastrarClick(Sender: TObject);
    procedure gridPessoaDblClick(Sender: TObject);
    procedure buttonExibePessoaClick(Sender: TObject);
    procedure buttonEditaObjetoClick(Sender: TObject);
    procedure buttonReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Classe.Pessoa;

{$R *.dfm}

procedure TfrmPrincipal.buttonCadastrarClick(Sender: TObject);
var
  lForm: TfrmCadPessoa;
begin
  lForm := TfrmCadPessoa.Create(Self);
  try
    dmdPessoa.cdsPessoa.Append;
    lForm.ShowModal;
  finally
    lForm.Free;
  end;
end;

procedure TfrmPrincipal.buttonConnectClick(Sender: TObject);
begin
  dmdPessoa.cdsPessoa.Open;
end;

procedure TfrmPrincipal.buttonEditaObjetoClick(Sender: TObject);
var
  lFrm: TfrmCadClassePessoa;
  lPes: TPessoa;
begin
  lFrm := TfrmCadClassePessoa.Create(Self);
  lPes := TPessoa.Create;
  try
    lPes.Carregar(dtsPessoa.DataSet);
    lFrm.CadastraPessoa(lPes, TOperacao.Alterar);
    dtsPessoa.DataSet.Edit;
    lPes.Salvar(dtsPessoa.DataSet);
    memoLog.Lines.Add(lPes.ToString);
  finally
    lFrm.Free;
    lPes.Free;
  end;

end;

procedure TfrmPrincipal.buttonExibePessoaClick(Sender: TObject);
var
  lPes: TPessoa;
begin
  lPes := TPessoa.Create;
  try
    memoLog.Lines.Clear;

    lPes.Carregar(dtsPessoa.DataSet);
    memoLog.Lines.Add(lPes.ToString);
  finally
    lPes.Free;
  end;
end;

procedure TfrmPrincipal.buttonReportClick(Sender: TObject);
begin
  frxReport1.ShowReport;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dtsPessoa.DataSet := dmdPessoa.cdsPessoa;
end;

procedure TfrmPrincipal.gridPessoaDblClick(Sender: TObject);
var
  lForm: TfrmCadPessoa;
begin
  lForm := TfrmCadPessoa.Create(Self);
  try
    dmdPessoa.cdsPessoa.Edit;
    lForm.ShowModal;
  finally
    lForm.Free;
  end;
end;

end.
