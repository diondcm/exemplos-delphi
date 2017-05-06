unit Form.Cadastro.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Base.Data.Cadastro, Data.Produto;

type
  TfrmCadastroProduto = class(TfrmBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeCodigo: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeCor: TDBEdit;
    dbePeso: TDBEdit;
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCadastroProduto }

class function TfrmCadastroProduto.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdProduto;
end;

end.
