unit Form.Pesquisa.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Base.Data.Cadastro,
  Base.Form.Cadastro, Data.Cliente, Form.Cadastro.Cliente;

type
  TfrmPesquisaCliente = class(TfrmBasePesquisa)
  private
  protected
    class function GetClasseDmdBaseCadastro: TDmdBaseCadastroClass; override;
    class function GetClasseFrmCadastro: TFrmBaseCadastroClass; override;
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TfrmPesquisaCliente }

class function TfrmPesquisaCliente.GetClasseDmdBaseCadastro: TDmdBaseCadastroClass;
begin
  Result := TdmdCliente;
end;

class function TfrmPesquisaCliente.GetClasseFrmCadastro: TFrmBaseCadastroClass;
begin
  Result := TfrmCadastroCliente;
end;

end.
