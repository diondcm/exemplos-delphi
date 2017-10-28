unit Form.Pesquisa.Country;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Base.Data.Cadastro, Data.Country,
  Base.Form.Cadastro, Form.Cadastro.Country, System.ImageList, Vcl.ImgList;

type
  TfrmPesquisaPaises = class(TfrmBasePesquisa)
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;

    class function GetClasseFrmCadastro: TfrmBaseCadastroClass; override;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaPaises: TfrmPesquisaPaises;

implementation

{$R *.dfm}

{ TfrmPesquisaPaises }

class function TfrmPesquisaPaises.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCountry;
end;

class function TfrmPesquisaPaises.GetClasseFrmCadastro: TfrmBaseCadastroClass;
begin
  Result := TfrmCadCountry;
end;

end.
