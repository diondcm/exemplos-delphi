unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Base.Data.Cadastro, Data.Pedido;

type
  TfrmCadastroPedido = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
  protected
    class function GetClasseDmdBaseCadastro: TDmdBaseCadastroClass; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmCadastroPedido }

class function TfrmCadastroPedido.GetClasseDmdBaseCadastro: TDmdBaseCadastroClass;
begin
  Result := TdmdPedido;
end;

end.
