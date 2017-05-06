unit Form.Cadastro.Categoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask;

type
  TfrmCadastroCategorias = class(TfrmBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    dbeID: TDBEdit;
    dbeDescricao: TDBEdit;
    dbcAtivo: TDBCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
