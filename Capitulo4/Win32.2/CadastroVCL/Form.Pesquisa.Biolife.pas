unit Form.Pesquisa.Biolife;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Pesquisa, Data.DB, System.ImageList, Vcl.ImgList, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Base.Data.Cadastro, Data.Cadastro.Biolife, Form.Cadastro.Biolife, Base.Form.Cadastro;

type
  TfrmPesquisaBiolife = class(TfrmBasePesquisa)
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
    class function GetClasseFrmCadastro: TfrmBaseCadastroClass; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaBiolife: TfrmPesquisaBiolife;

implementation

{$R *.dfm}

{ TfrmPesquisaBiolife }

class function TfrmPesquisaBiolife.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCadBiolife;
end;

class function TfrmPesquisaBiolife.GetClasseFrmCadastro: TfrmBaseCadastroClass;
begin
  Result := TfrmCadBioLife;
end;

end.
