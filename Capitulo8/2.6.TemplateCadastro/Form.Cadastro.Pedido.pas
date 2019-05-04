unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Form.Base.Cadastro, Data.DB, Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.Pedido, Vcl.Mask,
  Vcl.DBCtrls, Form.Cadastro.Item;

type
  TfrmCadPedido = class(TfrmCadBase)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dtsCliente: TDataSource;
    DBText1: TDBText;
    Label6: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    dtsItens: TDataSource;
    PanelItens: TPanel;
    Label8: TLabel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    ShapeAddItem: TShape;
    LabelAddItem: TLabel;
    ShapeEditItem: TShape;
    LabelEditItem: TLabel;
    Shape1: TShape;
    LabelDeleteItem: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LabelAddItemClick(Sender: TObject);
    procedure LabelEditItemClick(Sender: TObject);
    procedure LabelDeleteItemClick(Sender: TObject);
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
  dtsItens.DataSet := dmdPedido.qryItens;
end;

procedure TfrmCadPedido.LabelAddItemClick(Sender: TObject);
begin
  inherited;
  dmdPedido.qryItens.Append;
  if frmCadItem.ShowModal = mrOk then
  begin
    dmdPedido.qryItens.Post;
  end else begin
    dmdPedido.qryItens.Cancel;
  end;
end;

procedure TfrmCadPedido.LabelDeleteItemClick(Sender: TObject);
begin
  inherited;
  if not dmdPedido.qryItens.IsEmpty then
  begin
    dmdPedido.qryItens.Delete;
  end;
end;

procedure TfrmCadPedido.LabelEditItemClick(Sender: TObject);
begin
  inherited;
  if not dmdPedido.qryItens.IsEmpty then
  begin
    dmdPedido.qryItens.Edit;
    if frmCadItem.ShowModal = mrOk then
    begin
      dmdPedido.qryItens.Post;
    end else begin
      dmdPedido.qryItens.Cancel;
    end;
  end;
end;

end.
