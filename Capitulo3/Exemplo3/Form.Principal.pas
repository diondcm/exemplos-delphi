unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    memInfos: TMemo;
    lblResultado: TLabel;
    chkExibePessoaLabel: TCheckBox;
    pnlPessoaFisica: TPanel;
    edtNome: TEdit;
    edtCPF: TEdit;
    lblDataNascimento: TLabel;
    btnExibeInfos: TButton;
    lblTituloPessoaFisica: TLabel;
    pnlPessoaJuridica: TPanel;
    lblTituloPessoaJuridica: TLabel;
    edtCNPJ: TEdit;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    dtpDataFundacao: TDateTimePicker;
    lblDataFundacao: TLabel;
    pnlControles: TPanel;
    pnlSelecaoPessoa: TPanel;
    rbdPessoaFisica: TRadioButton;
    rbdPessoaJuridica: TRadioButton;
    dtpDataNascimento: TDateTimePicker;
    cmbStatusComercial: TComboBox;
    procedure btnExibeInfosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure ConfiguraPessoa(Sender: TObject);
  private
    procedure ExibePessoaFisica;
    procedure ExibePessoaJuridica;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExibeInfosClick(Sender: TObject);
begin
  if rbdPessoaFisica.Checked then
  begin
    ExibePessoaFisica;
  end;

  if rbdPessoaJuridica.Checked then
  begin
    ExibePessoaJuridica;
  end;
end;

procedure TfrmPrincipal.ConfiguraPessoa(Sender: TObject);
begin
  pnlPessoaFisica.Visible := rbdPessoaFisica.Checked;
  pnlPessoaJuridica.Visible := rbdPessoaJuridica.Checked;
end;

procedure TfrmPrincipal.ExibePessoaFisica;
var
  lPF: TPessoaFisica;
begin
  // Shift + Ctrl + V
  lPF := TPessoaFisica.Create;
  try
//    lPF.ID := StrToInt(edtID.Text);
    lPF.Nome := edtNome.Text;
    lPF.CPF := edtCPF.Text;
    lPF.DataNascimento := dtpDataNascimento.Date;
    lPF.StatusComercial := lPF.StringToStatusComercial(cmbStatusComercial.Text);

    memInfos.Lines.Add(lPF.ExibePessoa);
    // Ctrl + ; >> Teclado EN: Ctrl + /
    //    memInfos.Lines.Add('ID: ' + lPF.ID.ToString);
    //    memInfos.Lines.Add('Nome: ' + lPF.Nome);
    //    memInfos.Lines.Add('CPF: ' + lPF.CPF);
    if chkExibePessoaLabel.Checked then
    begin
      lblResultado.Caption := lPF.ExibePessoa;
    end;
    //        'ID: ' + lPF.ID.ToString + sLineBreak + // #13#10
    //        'Nome: ' + lPF.Nome + sLineBreak +
    //        'CPF: ' + lPF.CPF;
  finally
    lPF.Free;
  end;
end;

procedure TfrmPrincipal.ExibePessoaJuridica;
var
  lPJ: TPessoaJuridica;
begin
  lPJ := TPessoaJuridica.Create;
  try
    lPJ.CNPJ := edtCNPJ.Text;
    lPJ.NomeFantasia := edtNomeFantasia.Text;
    lPJ.RazaoSocial := edtRazaoSocial.Text;
    lPJ.DataFundacao := dtpDataFundacao.Date;

    memInfos.Lines.Add(lPJ.ExibePessoa);
    if chkExibePessoaLabel.Checked then
    begin
      lblResultado.Caption := lPJ.ExibePessoa;
    end;

  finally
    lPJ.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lPF: TPessoaFisica;
  i: Integer;
begin
  lPF := TPessoaFisica.Create;
  try
    for i := Ord(Low(TStatusComercialPessoa)) to Ord(High(TStatusComercialPessoa)) do
    begin
      cmbStatusComercial.Items.Add(lPF.StatusComecialToString(TStatusComercialPessoa(i)));
    end;

  finally
    lPF.Free;
  end;
end;

end.
