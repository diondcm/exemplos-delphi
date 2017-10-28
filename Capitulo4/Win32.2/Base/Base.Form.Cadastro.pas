unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Dados, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TfrmBaseCadastroClass = class of TfrmBaseCadastro;
  TfrmBaseCadastro = class(TfrmBaseDados)
    panelControles: TPanel;
    buttonCancelar: TBitBtn;
    buttonUltimo: TBitBtn;
    buttonProximo: TBitBtn;
    buttonAnterior: TBitBtn;
    buttonPrimeiro: TBitBtn;
    buttonSalvar: TBitBtn;
    buttonDeletar: TBitBtn;
    buttonEditar: TBitBtn;
    buttonInserir: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;

  if DmdCadastro.VerificaEmEdicao then
  begin
    CanClose :=
      Application.MessageBox(PChar('Cadastro em edição.' + sLineBreak +
        'Deseja cancelar a edição?'), 'Atenção',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)= IDYES;

    if CanClose then
    begin
      DmdCadastro.CancelarRegistro;
    end;
  end;
end;

end.
