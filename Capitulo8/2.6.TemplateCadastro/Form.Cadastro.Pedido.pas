unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.Pedido, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmCadPedido = class(TfrmCadBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dtsCliente: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

procedure TfrmCadPedido.FormCreate(Sender: TObject);
begin
  inherited;
  dtsDados.DataSet := dmdPedido.qryDados;
  dtsCliente.DataSet := dmdPedido.qryCliente;
end;

end.
