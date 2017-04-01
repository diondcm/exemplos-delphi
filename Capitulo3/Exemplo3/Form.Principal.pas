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
    edtID: TEdit;
    edtNome: TEdit;
    edtCPF: TEdit;
    dtpDataNascimento: TDateTimePicker;
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
    procedure btnExibeInfosClick(Sender: TObject);
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

procedure TfrmPrincipal.ExibePessoaFisica;
var
  lPessoa: TPessoaFisica;
begin
  // Shift + Ctrl + V
  lPessoa := TPessoaFisica.Create;
  try
    lPessoa.ID := StrToInt(edtID.Text);
    lPessoa.Nome := edtNome.Text;
    lPessoa.CPF := edtCPF.Text;
    lPessoa.DataNascimento := dtpDataNascimento.Date;
    //lPessoa.Free;
    memInfos.Lines.Add(lPessoa.ExibePessoa);
    // Ctrl + ; >> Teclado EN: Ctrl + /
    //    memInfos.Lines.Add('ID: ' + lPessoa.ID.ToString);
    //    memInfos.Lines.Add('Nome: ' + lPessoa.Nome);
    //    memInfos.Lines.Add('CPF: ' + lPessoa.CPF);
    if chkExibePessoaLabel.Checked then
    begin
      lblResultado.Caption := lPessoa.ExibePessoa;
    end;
    //        'ID: ' + lPessoa.ID.ToString + sLineBreak + // #13#10
    //        'Nome: ' + lPessoa.Nome + sLineBreak +
    //        'CPF: ' + lPessoa.CPF;
  finally
    lPessoa.Free;
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

end.
