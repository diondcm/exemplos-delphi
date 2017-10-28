unit Form.Pesquisa.Vendors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB, System.ImageList, Vcl.ImgList, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Base.Data.Cadastro, Data.Cadastro.Vendors, Base.Form.Cadastro, Form.Cadastro.Vendors;

type
  TfrmPesquisaVendors = class(TfrmBasePesquisa)
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
    class function GetClasseFrmCadastro: TfrmBaseCadastroClass; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaVendors: TfrmPesquisaVendors;

implementation

{$R *.dfm}

{ TfrmPesquisaVendors }

class function TfrmPesquisaVendors.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCadVendors;
end;

class function TfrmPesquisaVendors.GetClasseFrmCadastro: TfrmBaseCadastroClass;
begin
  Result := TfrmCadastroVendors;
end;

end.
