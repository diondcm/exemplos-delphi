unit Form.Pesquisa.Categoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Categoria, Base.Data.Cadastro;

type
  TfrmPesquisaCategoria = class(TfrmBasePesquisa)
  private
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

{ TfrmPesquisaCategoria }

class function TfrmPesquisaCategoria.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCategoria;
end;

end.
