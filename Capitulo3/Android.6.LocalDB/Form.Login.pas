unit Form.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListBox,
  Classe.Usuario.Logado, Data.Geral, Classe.Configuracao;

type
  TfrmLogin = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    ToolBar1: TToolBar;
    btnGoBack: TButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnLogin: TButton;
    cmbEmpresa: TComboBox;
    procedure btnGoBackClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

procedure TfrmLogin.btnGoBackClick(Sender: TObject);
begin
  Hide;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  lLogin: string;
begin
  lLogin := TUsuarioLogado.EfetuaLogin(edtUsuario.Text, edtSenha.Text,
    cmbEmpresa.Items[cmbEmpresa.ItemIndex]);

  if lLogin = '' then
  begin
    if not TConfiguracao.Configs.ContainsKey('NOME_USUARIO') then
    begin
      TConfiguracao.Configs.Add('NOME_USUARIO', TConfiguracao.Create);
    end;

    TConfiguracao.Configs['NOME_USUARIO'].Descricao := 'Nome de usuário';
    TConfiguracao.Configs['NOME_USUARIO'].NomeConfig := 'NOME_USUARIO';
    TConfiguracao.Configs['NOME_USUARIO'].Usuario := edtUsuario.Text;
    TConfiguracao.Configs['NOME_USUARIO'].Empresa := cmbEmpresa.Items[cmbEmpresa.ItemIndex];
    TConfiguracao.Configs['NOME_USUARIO'].ValorConfig := edtUsuario.Text;


    if not TConfiguracao.Configs.ContainsKey('NOME_EMPRESA') then
    begin
      TConfiguracao.Configs.Add('NOME_EMPRESA', TConfiguracao.Create);
    end;

    TConfiguracao.Configs['NOME_EMPRESA'].Descricao := 'Nome da Empresa';
    TConfiguracao.Configs['NOME_EMPRESA'].NomeConfig := 'NOME_EMPRESA';
    TConfiguracao.Configs['NOME_EMPRESA'].Usuario := edtUsuario.Text;
    TConfiguracao.Configs['NOME_EMPRESA'].Empresa := cmbEmpresa.Items[cmbEmpresa.ItemIndex];
    TConfiguracao.Configs['NOME_EMPRESA'].ValorConfig := cmbEmpresa.Items[cmbEmpresa.ItemIndex];

    TConfiguracao.SalvaConfigs;

    Hide;
  end else begin
    edtSenha.Text := '';
    ShowMessage(lLogin);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  lIndexEmpresa: Integer;
begin
  if TConfiguracao.Configs.ContainsKey('NOME_USUARIO') then
  begin
    edtUsuario.Text := TConfiguracao.Configs['NOME_USUARIO'].ValorConfig;
  end;

  if TConfiguracao.Configs.ContainsKey('NOME_EMPRESA') then
  begin
    lIndexEmpresa :=
      cmbEmpresa.Items.IndexOf(TConfiguracao.Configs['NOME_EMPRESA'].ValorConfig);
    if lIndexEmpresa <> -1 then
    begin
      cmbEmpresa.ItemIndex := lIndexEmpresa;
    end;
  end;

//  dmDados.qryConfig.Open;
//  if dmDados.qryConfig.FindKey(['NOME_USUARIO']) then
//  begin
//    edtUsuario.Text := dmDados.qryConfigVALOR_CONFIG.AsString;
//  end;
end;

end.
