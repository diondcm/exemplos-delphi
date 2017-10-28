unit Form.Cadastro.Vendors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, System.ImageList, Vcl.ImgList, Data.DB, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Base.Data.Cadastro, Data.Cadastro.Vendors;

type
  TfrmCadastroVendors = class(TfrmBaseCadastro)
    Label1: TLabel;
    cxDBCalcEdit1: TDBEdit;
    Label2: TLabel;
    cxDBTextEdit1: TDBEdit;
    Label3: TLabel;
    cxDBTextEdit2: TDBEdit;
    Label4: TLabel;
    cxDBTextEdit3: TDBEdit;
    Label5: TLabel;
    cxDBTextEdit4: TDBEdit;
    Label6: TLabel;
    cxDBTextEdit5: TDBEdit;
    Label7: TLabel;
    cxDBTextEdit6: TDBEdit;
    Label8: TLabel;
    cxDBTextEdit7: TDBEdit;
    Label9: TLabel;
    cxDBTextEdit8: TDBEdit;
    Label10: TLabel;
    cxDBTextEdit9: TDBEdit;

  protected
    class function GetClasseDmdBaseCadastro: TdmdBaseCadastroClass; override;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadastroVendors: TfrmCadastroVendors;

implementation

{$R *.dfm}

{ TfrmCadastroVendors }

class function TfrmCadastroVendors.GetClasseDmdBaseCadastro: TdmdBaseCadastroClass;
begin
  Result := TdmdCadVendors;
end;

end.
