unit Form.Pesquisa.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Base.Data.Cadastro,
  Base.Form.Cadastro, Data.Pedido, Form.Cadastro.Pedido;

type
  TfrmPesquisaPedido = class(TfrmBasePesquisa)
  private
    { Private declarations }
  protected
    class function GetClasseDmdBaseCadastro: TDmdBaseCadastroClass; override;
    class function GetClasseFrmCadastro: TFrmBaseCadastroClass; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmPesquisaPedido }

class function TfrmPesquisaPedido.GetClasseDmdBaseCadastro: TDmdBaseCadastroClass;
begin
  Result := TdmdPedido;
end;

class function TfrmPesquisaPedido.GetClasseFrmCadastro: TFrmBaseCadastroClass;
begin
  Result := TfrmCadastroPedido;
end;

end.
