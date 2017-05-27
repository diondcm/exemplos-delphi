unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, ClientModuleUnit1, Classe.Status, StrUtils;

type
  TfrmPrincipal = class(TForm)
    pnlOperacao: TPanel;
    edtAcao: TEdit;
    edtQauntidade: TEdit;
    edtValor: TEdit;
    btnVenda: TBitBtn;
    btnCompra: TBitBtn;
    pnlMensagem: TPanel;
    ListView1: TListView;
    procedure btnCompraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCompraClick(Sender: TObject);
var
  lStatus: TStatus;
begin
  lStatus := ClientModule1.SMAcaoClient.RegistraTransacaoCompra(edtAcao.Text, StrToInt(edtQauntidade.Text), StrToCurr(edtValor.Text));
  pnlMensagem.Caption := IfThen(lStatus.Erro = '', 'Ok', lStatus.Erro);
end;

end.
