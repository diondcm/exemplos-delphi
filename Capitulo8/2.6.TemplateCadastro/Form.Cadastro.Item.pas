unit Form.Cadastro.Item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Data.Pedido;

type
  TfrmCadItem = class(TForm)
    dtsItems: TDataSource;
    Label2: TLabel;
    DBEditQuantidade: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    PanelControles: TPanel;
    ButtonCancelar: TBitBtn;
    ButtonConfirmar: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    dtsProduto: TDataSource;
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItem: TfrmCadItem;

implementation

{$R *.dfm}

procedure TfrmCadItem.ButtonCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCadItem.ButtonConfirmarClick(Sender: TObject);
begin
  if (DBEditQuantidade.Text = '') or (StrToIntDef(DBEditQuantidade.Text, 0) = 0) then
  begin
    DBEditQuantidade.SetFocus;
    raise Exception.Create('Quantidade "' + DBEditQuantidade.Text + '" inválida.');
  end;

  ModalResult := mrOk;
end;

end.
