unit Form.Cadastro.Classe.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Classe.Pessoa, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOperacao = (Alterar, Incluir); // TOperacao.Alterar
  TfrmCadClassePessoa = class(TForm)
    labelCodigo: TLabel;
    editCodigo: TEdit;
    labelNome: TLabel;
    editNome: TEdit;
    Label3: TLabel;
    dateEditDataNascimento: TDateTimePicker;
    panelControles: TPanel;
    buttonSalvar: TBitBtn;
    buttonCancelar: TBitBtn;
    procedure buttonSalvarClick(Sender: TObject);
    procedure buttonCancelarClick(Sender: TObject);
  private
    procedure CarregaFields(pPes: TPessoa);
    procedure PersistirFields(pPes: TPessoa);
  public
    procedure CadastraPessoa(pPessoa: TPessoa; pOperacao: TOperacao);
  end;

var
  frmCadClassePessoa: TfrmCadClassePessoa;

implementation

{$R *.dfm}

{ TfrmCadClassePessoa }

procedure TfrmCadClassePessoa.buttonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadClassePessoa.buttonSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCadClassePessoa.CadastraPessoa(pPessoa: TPessoa;
  pOperacao: TOperacao);
begin
  case pOperacao of
    Alterar: ;
    Incluir: pPessoa.DataCadastro := Now;
  end;

  CarregaFields(pPessoa);
  if Self.ShowModal = mrOk then
    PersistirFields(pPessoa);
end;

procedure TfrmCadClassePessoa.CarregaFields(pPes: TPessoa);
begin
  editCodigo.Text := pPes.Codigo.ToString;
  editNome.Text := pPes.Nome;
  dateEditDataNascimento.Date := pPes.DataNascimento;
end;

procedure TfrmCadClassePessoa.PersistirFields(pPes: TPessoa);
begin
  pPes.Codigo := StrToInt(editCodigo.Text);
  pPes.Nome := editNome.Text;
  pPes.DataNascimento := dateEditDataNascimento.Date;
end;

end.
