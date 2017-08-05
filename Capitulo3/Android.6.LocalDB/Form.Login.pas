unit Form.Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Edit, FMX.ListBox,
  Classe.Usuario.Logado, Data.Geral;

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
    if dmDados.qryConfig.FindKey(['NOME_USUARIO']) then
    begin
      dmDados.qryConfig.Edit;
    end else begin
      dmDados.qryConfig.Append;
      dmDados.qryConfigUSUARIO.AsString := edtUsuario.Text;
      dmDados.qryConfigEMPRESA.AsString := cmbEmpresa.Items[cmbEmpresa.ItemIndex];
      dmDados.qryConfigNOME_CONFIG.AsString := 'NOME_USUARIO';
      dmDados.qryConfigDESCRICAO_CONFIG.AsString := 'Nome de usuário';
    end;

    dmDados.qryConfigVALOR_CONFIG.AsString := edtUsuario.Text;
    dmDados.qryConfig.Post;

    Hide;
  end else begin
    edtSenha.Text := '';
    ShowMessage(lLogin);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  dmDados.qryConfig.Open;
  if dmDados.qryConfig.FindKey(['NOME_USUARIO']) then
  begin
    edtUsuario.Text := dmDados.qryConfigVALOR_CONFIG.AsString;
  end;
end;

end.
