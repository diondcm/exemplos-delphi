unit Form.Cadastro.Item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Data.Pedido, Classe.Mensagem, Data.DB, Form.Pesquisa;

type
  TfrmCadItem = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    PanelControles: TPanel;
    ButtonSalvar: TBitBtn;
    ButtonCancelar: TBitBtn;
    dtsItem: TDataSource;
    dtsProduto: TDataSource;
    LabelEstoque: TLabel;
    buttonPesquisa: TBitBtn;
    procedure dtsItemDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure buttonPesquisaClick(Sender: TObject);
  private
    FdmdPedido: TdmdPedido;
    procedure SetdmdPedido(const Value: TdmdPedido);
  public
    class procedure AdicionaItem(pDmdPedidos: TdmdPedido);
    class procedure EditaItem(pDmdPedidos: TdmdPedido);
    class procedure DeletaItem(pDmdPedidos: TdmdPedido);
    property dmdPedido: TdmdPedido read FdmdPedido write SetdmdPedido;
  end;

//var
//  frmCadItem: TfrmCadItem;

implementation

{$R *.dfm}

{ TfrmCadItem }

class procedure TfrmCadItem.AdicionaItem(pDmdPedidos: TdmdPedido);
begin
  var lFrm : TfrmCadItem := Self.Create(nil);
  lFrm.dmdPedido := pDmdPedidos;
  lFrm.dmdPedido.qryItens.Append;
  lFrm.ShowModal;
  lFrm.Free;
end;

procedure TfrmCadItem.ButtonCancelarClick(Sender: TObject);
begin
  if FdmdPedido.qryItens.State in dsEditModes then
    FdmdPedido.qryItens.Cancel;
end;

procedure TfrmCadItem.buttonPesquisaClick(Sender: TObject);
begin
  TfrmPesquisa.Executa(FdmdPedido.qryPesquisaProduto,
    function (pFormPesquisa: TfrmPesquisa): Boolean
    begin
      Result := False;
      if not pFormPesquisa.DataSetPesquisa.IsEmpty then
      begin
        FdmdPedido.qryItensIDPRODUTO.AsInteger := pFormPesquisa.DataSetPesquisa.FieldByName('IDPRODUTO').AsInteger;
        Result := True;
      end else begin
        TMensagem.Aviso('Selecione um produto ou cancele para sair');
      end;
    end);
end;

procedure TfrmCadItem.ButtonSalvarClick(Sender: TObject);
begin
  if FdmdPedido.qryItens.State in dsEditModes then
    FdmdPedido.qryItens.Post;
end;

class procedure TfrmCadItem.DeletaItem(pDmdPedidos: TdmdPedido);
begin
  if not pDmdPedidos.qryItens.IsEmpty then
  begin
    if TMensagem.Confirmacao('Deseja excluir o item do pedido?') then
    begin
      pDmdPedidos.qryItens.Delete;
    end;
  end;
end;

procedure TfrmCadItem.dtsItemDataChange(Sender: TObject; Field: TField);
begin
  if FdmdPedido.qryItens.FieldByName('IDPRODUTO').AsInteger = 0 then
  begin
    LabelEstoque.Caption := '';
  end else begin
    if FdmdPedido.qryPesquisaProduto.IsEmpty then
    begin
      LabelEstoque.Caption := '';
    end else begin
      LabelEstoque.Caption := 'Estoque: ' + FormatFloat('0.,', FdmdPedido.qryPesquisaProduto.FieldByName('ESTOQUE').AsCurrency) + ', Preço unitário: ' + FormatFloat('R$ 0.,00', FdmdPedido.qryPesquisaProduto.FieldByName('PRECO').AsCurrency);
    end;
  end;
end;

class procedure TfrmCadItem.EditaItem(pDmdPedidos: TdmdPedido);
begin
  var lFrm : TfrmCadItem := Self.Create(nil);
  lFrm.dmdPedido := pDmdPedidos;
  lFrm.dmdPedido.qryItens.Edit;
  lFrm.ShowModal;
  lFrm.Free;
end;

procedure TfrmCadItem.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if dtsItem.DataSet.State in dsEditModes then
  begin
    CanClose := TMensagem.Confirmacao('Cadastro em edição. Sair cancelará as alterações.' + sLineBreak + 'Sair mesmo assim?');
    if CanClose then
      dtsItem.DataSet.Cancel;
  end;
end;

procedure TfrmCadItem.FormCreate(Sender: TObject);
begin
  LabelEstoque.Caption := '';
end;

procedure TfrmCadItem.SetdmdPedido(const Value: TdmdPedido);
begin
  FdmdPedido := Value;
  dtsItem.DataSet := FdmdPedido.qryItens;
  dtsProduto.DataSet := FdmdPedido.qryPesquisaProduto;
  FdmdPedido.qryPesquisaProduto.Close;
  FdmdPedido.qryPesquisaProduto.Open;
end;

end.
