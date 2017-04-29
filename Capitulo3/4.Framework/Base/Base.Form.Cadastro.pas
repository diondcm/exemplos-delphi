unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Data.DB, Base.Data.Cadastro,
  Base.Form.Dados, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus,
  Base.Mensagem, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmBaseCadastroClass = class of TfrmBaseCadastro;
  TfrmBaseCadastro = class(TfrmBaseDados)
    Panel1: TPanel;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnInserir: TBitBtn;
    btnDeletar: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  public
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  if DmdCadastro.VerificaEmEdicao then
  begin
    CanClose :=
      TMensagem.Confirmacao(
        'Cadastro em edição.' + sLineBreak + 'Deseja cancelar a edição?');

//    Application.MessageBox(PChar('Cadastro em edição.' + sLineBreak +
//      'Deseja cancelar a edição?'), 'Atenção',
//      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= IDYES;

    if CanClose then
    begin
      DmdCadastro.CancelarRegistro;
    end;
  end;
end;

end.
