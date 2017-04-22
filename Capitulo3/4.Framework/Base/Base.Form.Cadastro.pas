unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form, Data.DB, Base.Data.Cadastro,
  Base.Form.Dados, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfrmBaseCadastro = class(TfrmBaseDados)
  private
//    procedure SetTeste(const Value: TdmdBaseCadastro); overload;
//    procedure SetTeste(const Value: TdmdBaseTipoDiferente); overload;
  public
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

end.
