unit Form.Pesquisa.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Produto, Form.Cadastro.Produto,
  Base.Data.Cadastro, Base.Form.Cadastro;

type
  TfrmPesquisaProduto = class(TfrmBasePesquisa)
  private
    { Private declarations }
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
    class function GetClasseFrmCadastro: TfrmBaseCadastroClass; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmPesquisaProduto }

class function TfrmPesquisaProduto.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdProduto;
end;

class function TfrmPesquisaProduto.GetClasseFrmCadastro: TfrmBaseCadastroClass;
begin
  Result := TfrmCadastroProduto;
end;

end.
