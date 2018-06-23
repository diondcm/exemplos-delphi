unit Form.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Cliente, Base.Data.Cadastro,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroCliente = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
  private
  protected
    class function GetClasseDmdBaseCadastro: TDmdBaseCadastroClass; override;
  public
    { Public declarations }

  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

{ TfrmCadastroCliente }

class function TfrmCadastroCliente.GetClasseDmdBaseCadastro: TDmdBaseCadastroClass;
begin
  Result := TdmdCliente;
end;

end.
