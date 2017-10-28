unit Form.Cadastro.Biolife;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, System.ImageList, Vcl.ImgList, Data.DB, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Cadastro.Biolife, Vcl.DBCtrls,
  Vcl.Mask, Base.Data.Cadastro;

type
  TfrmCadBioLife = class(TfrmBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBImage1: TDBImage;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBioLife: TfrmCadBioLife;

implementation

{$R *.dfm}

{ TfrmCadBioLife }

class function TfrmCadBioLife.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCadBiolife;
end;

end.
