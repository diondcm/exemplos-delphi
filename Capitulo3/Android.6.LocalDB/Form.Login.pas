unit Form.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListBox,
  Classe.Usuario.Logado, Data.Geral, Classe.Configuracao,
  Classe.Lista.Configuracao;

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
    if not TListaConfiguracao.Configs.ContainsKey('NOME_USUARIO') then
    begin
      TListaConfiguracao.Configs.Add('NOME_USUARIO', TConfiguracao.Create);
    end;

    TListaConfiguracao.Configs['NOME_USUARIO'].Descricao := 'Nome de usuário';
    TListaConfiguracao.Configs['NOME_USUARIO'].NomeConfig := 'NOME_USUARIO';
    TListaConfiguracao.Configs['NOME_USUARIO'].Usuario := edtUsuario.Text;
    TListaConfiguracao.Configs['NOME_USUARIO'].Empresa := cmbEmpresa.Items[cmbEmpresa.ItemIndex];
    TListaConfiguracao.Configs['NOME_USUARIO'].ValorConfig := edtUsuario.Text;


    if not TListaConfiguracao.Configs.ContainsKey('NOME_EMPRESA') then
    begin
      TListaConfiguracao.Configs.Add('NOME_EMPRESA', TConfiguracao.Create);
    end;

    TListaConfiguracao.Configs['NOME_EMPRESA'].Descricao := 'Nome da Empresa';
    TListaConfiguracao.Configs['NOME_EMPRESA'].NomeConfig := 'NOME_EMPRESA';
    TListaConfiguracao.Configs['NOME_EMPRESA'].Usuario := edtUsuario.Text;
    TListaConfiguracao.Configs['NOME_EMPRESA'].Empresa := cmbEmpresa.Items[cmbEmpresa.ItemIndex];
    TListaConfiguracao.Configs['NOME_EMPRESA'].ValorConfig := cmbEmpresa.Items[cmbEmpresa.ItemIndex];

    TListaConfiguracao.SalvaConfigs;

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
  if TListaConfiguracao.Configs.ContainsKey('NOME_USUARIO') then
  begin
    edtUsuario.Text := TListaConfiguracao.Configs['NOME_USUARIO'].ValorConfig;
  end;

  if TListaConfiguracao.Configs.ContainsKey('NOME_EMPRESA') then
  begin
    lIndexEmpresa :=
      cmbEmpresa.Items.IndexOf(TListaConfiguracao.Configs['NOME_EMPRESA'].ValorConfig);
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
