unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Email, IdComponent, IdBaseComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdAntiFreezeBase, Vcl.IdAntiFreeze,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Form.Multi.Tabelas;

type
  TfrmPrincipal = class(TForm)
    panelEmail: TPanel;
    lblInfo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    buttonEnviarEmail: TButton;
    editSenha: TEdit;
    editDestinatario: TEdit;
    editAssunto: TEdit;
    editUsuario: TEdit;
    memoBody: TMemo;
    checkAnexo: TCheckBox;
    buttonMultiTabelas: TButton;
    procedure buttonEnviarEmailClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonMultiTabelasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonEnviarEmailClick(Sender: TObject);
var
  lErroEnvio: string;
  lAnexos: TStringList;
  lBody: string;
  lStrAnexos: string;
begin
  lAnexos := TStringList.Create;
  try
    if checkAnexo.Checked then
    begin
      lAnexos.Add('teste.txt');
    end;
    //lErroEnvio := TEmail.Enviar(editUsuario.Text, editSenha.Text, editDestinatario.Text, editAssunto.Text, memoBody.Lines, lAnexos);
    lBody := memoBody.Lines.Text;
    lStrAnexos := lAnexos.Text;
    TEmailThread.Create(editUsuario.Text, editSenha.Text, editDestinatario.Text, editAssunto.Text, lBody, lStrAnexos);
  finally
    lAnexos.Free;
  end;

  if lErroEnvio <> '' then
  begin
    raise Exception.Create('Erro ao enviar email: ' + lErroEnvio);
  end else begin
    ShowMessage('Email enviado com sucesso.');
  end;
end;

procedure TfrmPrincipal.buttonMultiTabelasClick(Sender: TObject);
begin
  frmMultiTabelas.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
{$IFDEF DEBUG}
  buttonMultiTabelas.Click;
{$ENDIF}
end;

end.
