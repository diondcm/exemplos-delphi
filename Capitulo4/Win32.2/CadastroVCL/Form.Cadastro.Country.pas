unit Form.Cadastro.Country;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Base.Data.Cadastro, Data.Country,
  System.ImageList, Vcl.ImgList;

type
  TfrmCadCountry = class(TfrmBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCountry: TfrmCadCountry;

implementation

{$R *.dfm}

//uses
//  Form.Pesquisa.Country;
// não fazer, referencia circular

{ TfrmCadCountry }

class function TfrmCadCountry.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCountry;
end;

end.
