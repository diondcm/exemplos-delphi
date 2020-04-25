unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Config, Vcl.Menus, Form.Login, Form.Config.Impressao, Form.Cadastro.Cliente, Vcl.StdCtrls, Form.Base, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Parmetros1: TMenuItem;
    rocausurio1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    ConfigImpresso1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    MemoLogAcesso: TMemo;
    TimerLogin: TTimer;
    procedure Sair1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure rocausurio1Click(Sender: TObject);
    procedure ConfigImpresso1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCadastroCliente.Show;
end;

procedure TfrmPrincipal.ConfigImpresso1Click(Sender: TObject);
begin
  frmConfigImpressao.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  TfrmBase.FOnAtualiza :=
    procedure
    begin
      MemoLogAcesso.Text := TfrmBase.GetListaAcessados;
      // Chama um WS
    end;

  TimerLogin.Enabled := True;
end;

procedure TfrmPrincipal.Parmetros1Click(Sender: TObject);
begin
  frmConfig.ShowModal;
end;

procedure TfrmPrincipal.rocausurio1Click(Sender: TObject);
begin
  if frmLogin.ShowModal <> mrOk then
  begin
    ShowMessage('Re-efetue login para acessar');
    Application.Terminate;
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;
  Caption := Caption + ' - MainForm: ' + Application.MainForm.Name;

  if frmLogin.ShowModal <> mrOk then
  begin
    Application.Terminate;
  end;
end;

end.
